#!/usr/bin/env perl
package NetHack::Monster::Turn;
use Moose;

our $VERSION = '0.01';

=head1 NAME

NetHack::Monster::Turn - the conditions of a turn as used by NetHack::Monster

=head1 SYNOPSIS

    use NetHack::Monster;
    use NetHack::Monster::Turn;

    my $t1 = NetHack::Monster::Turn->new(count => 1, hallucination => 1);
    my $t2 = NetHack::Monster::Turn->new(count => 2, hallucination => 1);

    my $m1 = NetHack::Monster->new(turn => $t1, glyph => '@',
        color => 'bright_blue', x => 10, y => 10);

    my $m2 = NetHack::Monster->new(parents => [ $m1 ], turn => $t2,
        glyph => 'e', color => 'blue', x => 10, y => 10);

    $m2->species;   # undef because we're hallucinating

=head1 DESCRIPTION

A NetHack::Monster::Turn instance represents a specific turn in the history
of a NetHack game.  These are used by NetHack::Monster for input of data that
affects all monsters on a specific turn, such as the location of the player
and hallucination.

NetHack::Monster::Turn exists only to provide the following attributes:

=head2 count :: Int

The current turn number.

=head2 hallucination :: Bool

Are we hallucinating?

=cut

has count => (
    is       => 'ro',
    required => 1,
    isa      => 'Int',
);

has hallucination => (
    is       => 'ro',
    isa      => 'Bool',
    default  => 0,
);

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

