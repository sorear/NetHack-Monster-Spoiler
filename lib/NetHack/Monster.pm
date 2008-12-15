#!/usr/bin/env perl
package NetHack::Monster;
use Moose;

our $VERSION = '0.01';

=head1 NAME

NetHack::Monster - represent a monster in NetHack

=head1 SYNOPSIS

    use NetHack::Monster;
    use NetHack::Monster::Turn;

    my @turns;
    for my $turn (0 .. 20) {
        $turns[$turn] = NetHack::Monster::Turn->new(count => $turn);
    }

    my $m1 = NetHack::Monster->new(glyph => '@', color => 'bright_blue',
        x => 10, y => 10, turn => $turns[1]);

    my $m2 = NetHack::Monster->new(parents => [ $m1 ], turn => $turns[2]);

    $m2->y(11);

    scalar $m2->is_sleeping   # 0
    scalar $m2->spoiler->name # Elf-lord

    for (3 .. 20) {
        $m2 = NetHack::Monster->new(parents => [ $m2 ], turn => $turns[$_]);
        $m2->x(10);
        $m2->y(11);
    }

    scalar $m2->is_sleeping  # 0
    ($m2->is_immobile)       # 0 0.05 1 0.95
    ($m2->is_sleeping)       # 0 0.60 1 0.40

=head1 DESCRIPTION

NetHack::Monster represents a monster in the NetHack universe.  Like its
sibling NetHack::Item, NetHack::Monster attempts to be useful by tracking
the unobvious properties of monsters.  This is rather complicated by the
fact that monsters frequently change state while we are not aware of them.

One instance of NetHack::Monster represents a single monster at a single
instant in a NetHack game.  Since it is in general not possible to
determine with certainty whether two monsters observed at different
times are, in fact, the same monster, they are represented with different
objects.  Instead, NetHack::Monster expects to be told about possible
predecessor monsters, along with a conditional probability vector.

=head1 CONDITIONAL PROBABILITY

NetHack::Monster makes extensive use of the concept of conditional
probability.  Conditional probability, notated P(A|B), refers to the
probability of statement A being true, given that we have already observed
B.  For instance, if we saw a monster as being a dwarf king last turn,
it is extremely unlikely to be a master mind flayer this turn.

A conditional probability vector, for a parameter X, is a vector of the
probabilities P(X=Xi|O), where O is the set of all observations which
have been made, and Xi is the i'th possible value of X.

A conditional probability vector (henceforth abbreviated CPV) is represented as
an array, each of whose elements is a reference to a 2-element array, where the
first element is the value, and the second element is the corresponding
conditional probability.

A function which "returns a CPV" will return it directly in list context.  If
called in scalar context, it will return the corresponding value if one option
has a CP of 0.7 or greater, or undef if no such value exists.

=head1 ATTRIBUTES

The meat of NetHack::Monster is in the many attributes provided.
These fall into four groups:

=over

=item * Meta attributes

These two attributes control the operation of the propagation mechanism.

=item * Observables

Observable attributes represent specific facts which can be absolutely
known about a monster on a turn.  Good examples are "This monster is
purple", "This monster was farlooked this turn with this result".

Observables are initialized to undef, indicating that the measurement
was not made or the event did not happen.  They are never propagated.

=item * Hidden variables

Hidden variables are, as their name implies, not directly observable.
Hidden variables are determined by accumulating the results of many
observations.  When the value of a hidden variable is requested,
NetHack::Monster looks at the values of the hidden variables in
ancestor monsters, uses attribute-specific code to advance them to
the current turn, and then throws out the possibilities which are
inconsistent with this turn's observations.  Examples of hidden
variables are "Is this monster peaceful", "How much damage has this
monster taken", "Is this monster immobile".

=item * Derived variables

Derived variables are not maintained at all by NetHack::Monster; they
are simply calculated on demand from hidden variables and spoiler
knowledge.  A good example is "Will this monster respect Elbereth?".

=back

=head1 THE META ATTRIBUTES

=head2 turn :: NetHack::Monster::Turn

C<turn> represents the turn for which this monster exists.  It is, naturally,
required to exist.

=cut

has turn => (
    is  => 'ro',
    isa => 'NetHack::Monster::Turn',
    required => 1,
);

=head2 parents :: CPV

C<parents> represents the NetHack::Monster(s) that the monster tracker (beyond
our concern) considers as candidates for identity with the NetHack monster
under consideration.

=cut

has parents => (
    is  => 'ro',
    isa => 'ArrayRef',
    default    => sub { [] },
    auto_deref => 1,
);

=head1 THE OBSERVABLES

=head2 x, y :: Int

=head2 glyph, color :: Str

These four observables give the position and appearance of a monster, and
should be set if the monster is directly observed.

=cut

has [qw/x y/] => (
    is  => 'rw',
    isa => 'Int',
);

has [qw/glyph color/] => (
    is  => 'rw',
    isa => 'Str',
);

=head2 farlooked :: Str

Set this to the response line from a farlook.

=cut

has farlooked => (
    is  => 'rw',
    isa => 'Maybe[Str]',
    predicate => 'was_farlooked',
);

sub farlooked_parsed {
    my ($self) = @_;

    my $s = $self->farlooked;

    my %r;

    # Only look at the bit in parens

    return () unless $s =~ /\((.*)\)(?: \[seen: ([^]]*)\])?/;
    $s = $1;
    my $modes = $2 || 'normal vision';

    my %modes = map { s/ .*//; s/paranoid/warned/; $_ => 1 } split ', ', $modes;

    $r{seen} = \%modes; # see normal astral telepathy monster infravision warned

    # Trim suffixes, risks confusion with calls, oh well.
    $r{trapped_in} = $1 if $s =~ s/, trapped in a (bear trap|spiked pit|pit|web)$//;
    $r{leashed} = 1     if $s =~ s/, leashed to you$//;
    $r{holding} = 1     if $s =~ s/, holding you$//;
    $r{stuck} = 1       if $s =~ s/, being held$//;

    # Trim prefixes
    $r{tail_of} = 1     if $s =~ s/^tail of (?:an? )?//;
    $r{peaceful} = 1    if $s =~ s/^peaceful //;
    $r{tame} = 1        if $s =~ s/^tame //;

    my $m = $self->spoiler_class->parse_description($s);

    return { %r, %$m };
}

=head1 THE HIDDEN VARIABLES

All of the hidden variables are methods which return conditional probability
vectors.

=head2 immobile :: CPV Bool

Is the monster immobile?  Sleep, paralysis, plain unmovement.

=cut

sub moved {
    my ($self) = @_;

    my $remwt = 1;
    my %ret;

    for my $p ($self->parents) {
        my $wt = $p->[1];
        my $pa = $p->[0];

        my $cls = ($pa->x == $self->x && $pa->y == $self->y) ? 'hold' :
            'wander';

        $ret{$cls} += $wt;
        $remwt -= $wt;
    }

    # A simpler approximation of the null observation breaks sleeping, sadly
    $ret{hold}   += $remwt / 9;
    $ret{wander} += $remwt * 8 / 9;

    return \%ret;
}

sub historical {
    my ($self, $hvar, $spectrum, $evolve) = @_;
    my %would;

    if (!@{ $self->parents }) {
        return $spectrum ? { map { $_ => (1/@$spectrum) } @$spectrum } : {};
    }

    for my $p ($self->parents) {
        my ($parent, $weight) = @$p;

        my %old_hidden = $parent->$hvar;
        my %adv;
        my $gap = $self->turn->count - $parent->turn->count;

        for my $oval (keys %old_hidden) {
            my $owt = $old_hidden{$oval};

            my $n = $evolve ? $evolve->($self, $oval, $gap) : { $oval => 1 };

            for my $nkey (keys %$n) {
                $adv{$nkey} += $n->{$nkey} * $owt;
            }
        }

        # Simulate incomplete knowledge with a 0.1% arbitrary transition
        my $fuzz = (0.999 ** $gap);
        for my $key (keys %adv) {
            $would{$key} += $weight * $fuzz * $adv{$key};
        }
    }

    if ($spectrum) {
        my $total = 0;
        for (values %would) { $total += $_; }

        for my $key (@$spectrum) {
            $would{$key} += (1 - $total) / @$spectrum;
        }
    }

    return \%would;
}

sub return_cpv {
    my ($self, $would) = @_;

    if (wantarray) {
        return %$would;
    } else {
        for my $key (keys %$would) {
            return $key if $would->{$key} >= 0.7;
        }

        return undef;
    }
}

sub hidden_var {
    my ($pkg, $name, $spectrum, $evolve, $filter) = @_;

    $pkg->meta->add_method($name, sub {
        my ($self) = @_;

        my $would = $self->historical($name, $spectrum, $evolve);

        my $total;

        for my $now (keys %$would) {
            $would->{$now} *= $filter->($self, $now);
            $total += $would->{$now};
        }

        for my $now (keys %$would) {
            $would->{$now} /= $total;
        }

        $self->return_cpv($would);
    });
}

=head2 type :: String

The type of monster (eg "minotaur", "guardian naga hatchling").

=cut

# We have to do this by hand because of a continuous spectrum.
sub type {
    my ($self) = @_;

    my $parents = $self->historical('type');

    my $observe_type;
    my @constraints;
    my $hallu = $self->turn->hallucination;

    if (!$hallu && $self->glyph && $self->glyph !~ /[I1-5]/) {
        # Currently, we gain no information from warning numbers.  This could
        # potentially be improved, but it doesn't seem worth it.

        push @constraints, [ glyph => $self->glyph, color => $self->color ];
    }

    if ($self->was_farlooked) {
        my $f = $self->farlooked_parsed;

        push @constraints, [ name => $f->{monster} ] unless $hallu;
        push @constraints, [ is_orc => 1 ] if $hallu && $f->{seen}{warned};
    }

    # XXX handle other forms of recognition (hit messages) here

    # Renormalization is a bit tricky

    my $change = 1;
    for (keys %$parents) {
        $change -= $parents->{$_};
    }
    $change /= scalar @{ $self->spoiler_class->list };

    for my $con (@constraints) {
        my %iter = (%$parents, map { $_->name => 'add' }
            $self->spoiler_class->lookup(@$con));
        my $tot = 0;

        for my $mon (keys %iter) {
            $parents->{$mon} ||= $change;
            delete $parents->{$mon} if $iter{$mon} ne 'add';
            $tot += $parents->{$mon} || 0;
        }

        for (keys %$parents) { $parents->{$_} /= $tot }
    }

    $self->return_cpv($parents);
}

__PACKAGE__->hidden_var(sleeping => [0, 1], sub {
    my ($self, $olds, $time) = @_;

    return { $olds => 1 };
}, sub {
    my ($self, $nv) = @_;

    my $movec = $self->moved->{hold};

    if ($nv) {
        # absolutely inconsistent with motion
        return $movec;
    } else {
        # any specific motion is dissuggestive of random walking
        return 1 / 9;
    }
});

=head1 THE DERIVED ATTRIBUTES

=head1 FINALIZATION (todo)

The algorithm, as described thus far, requires exponential time (with a rather
large base) in the length of chains.  This is bad.  To avoid this,
NetHack::Monster provides one method not strictly necessary:

=head2 finalize :: ()

To set or update any observable after calling this method is an error.

When finalize is called, NetHack::Monster determines the CPVs for all the
hidden variables, stores them so that they need not be recomputed, and deletes
the parent vector to allow old monsters to be garbage-collected.  Any
NetHack::Monster which is used as a parent will be automatically finalized.

=head1 CONSIDERATIONS FOR SUBCLASSERS

If you have subclassed NetHack::Monster::Spoiler, you should override
spoiler_class.

New observables should simply be Moose attributes (XXX there needs to be magic
here due to the finalization).  New hidden variables should be methods which
take no arguments and "return a CPV" as described earlier.  To make this easier,
NetHack::Monster provides a class method hidden_var which installs a new
hidden variable for a discrete spectrum.

=head2 __PACKAGE__->hidden_var(name => [qw/VALUES/], sub { EVOLVE }, sub { FILTER }

Hidden variables created by hidden_var update in two steps.  First, the old
value (determined from all ancestors) is updated using EVOLVE, which will
be passed $self and an old value, and should return a CPV of new values without
regard for observations.  Then, FILTER is used, passing it $self and a new
value; it should return a value from 0 to 1 reflecting how well this hidden
variable explains the observation.  If your hidden variable lacks a discrete
spectrum, several lower-level functions are available.

=cut

sub spoiler_class {
    require NetHack::Monster::Spoiler;
    'NetHack::Monster::Spoiler';
}

1;

__END__

=head1 AUTHOR

Stefan O'Rear, C<< <stefanor@cox.net> >>

=head1 BUGS

No known bugs.

Please report any bugs through RT: email
C<bug-nethack-monster at rt.cpan.org>, or browse
L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=NetHack-Monster>.

=head1 COPYRIGHT AND LICENSE

Copyright 2008 Stefan O'Rear.

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.

=cut

