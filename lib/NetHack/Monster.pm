#!/usr/bin/env perl
package NetHack::Monster;
use Moose;

our $VERSION = '0.01';

=head1 NAME

NetHack::Monster - represent a monster in NetHack

=head1 SYNOPSIS

    use NetHack::Monster;

    my $m1 = NetHack::Monster->new(glyph => '@', color => 'bright_blue',
        x => 10, y => 10);

    my $m2 = NetHack::Monster->new(parents => [ $m1 ]);

    $m2->y(11);

    scalar $m2->is_sleeping   # 0
    scalar $m2->spoiler->name # Elf-lord

    for (0 .. 20) {
        $m2 = NetHack::Monster->new(parents => [ $m2 ]);
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

=head2 turn :: Int

C<turn> represents the turn for which this monster exists.  It is, naturally,
required to exist.  If not specified, it defaults to 1 more than the highest
turn number of any parent monster, or 1.

=cut

has turn => (
    is  => 'ro',
    isa => 'Int',
);

sub BUILD {
    my ($self) = @_;

    if (!defined($self->{turn})) {
        my $t = 0;

        for my $p ($self->parents) {
            my $t2 = $p->turn;

            $t = $t2 if $t2 > $t;
        }

        $self->{turn} = $t + 1; # NOTE NOTE modifying a readonly attribute
    }
}

=head2 parents :: CPV

C<parents> represents the NetHack::Monster(s) that the monster tracker (beyond
our concern) considers as candidates for identity with the NetHack monster
under consideration.

=cut

has parents => (
    is  => 'ro',
    isa => 'ArrayRef',
    default => sub { [] },
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

#sub parse_description {
#    my ($class, $s, %args) = @_;
#
#    my %r;
#
#    # Only look at the bit in parens
#
#    return () unless $s =~ /\((.*)\)(?: \[seen: ([^]]*)\])?/;
#    $s = $1;
#    my $modes = $2 || 'normal vision';
#
#    my %modes = map { s/ .*//; s/paranoid/warned/; $_ => 1 } split ', ', $modes;
#
#    $r{seen} = \%modes; # see normal astral telepathy monster infravision warned
#
#    # Trim suffixes, risks confusion with calls, oh well.
#        (,\ holding\ you)?
#        (,\ leashed\ to\ you)?
#        (?:,\ trapped\ in\ a\ (bear\ trap|spiked\ pit|pit|web))?
#    $r{trapped_in} = $1 if $s =~ s/, trapped in a (bear trap|spiked pit|pit|web)$//;
#    $r{leashed} = 1     if $s =~ s/, leashed you$//;
#    $r{holding} = 1     if $s =~ s/, holding you$//;
#    $r{stuck} = 1       if $s =~ s/, stuck to you$//;
#}



=head1 THE HIDDEN VARIABLES

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

NetHack::Monster uses Moose metaprogramming to perform the steps in the
propagation process, and the two regular types of attribute are implemented
as traits.  See the documentation for L<NetHack::Monster::Meta::Observable>
and L<NetHack::Monster::Meta::HiddenVar> for details.

If you have subclassed NetHack::Monster::Spoiler, you should use an augment
to provide a new package name to the C<spoiler> method.

=cut


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

