#!/usr/bin/env perl
package NetHack::Monster;
use Moose;

our $VERSION = '0.01';

=head1 NAME

NetHack::Monster - represent a monster in NetHack

=cut

has [qw/x y/] => (
    is  => 'rw',
    isa => 'Int',
);

has [qw/glyph color/] => (
    is  => 'rw',
    isa => 'Str',
);

has farlooked => (
    is  => 'rw',
    isa => 'Maybe[Str]',
);


1;

__END__

=head1 SYNOPSIS

    use NetHack::Monster;

=head1 DESCRIPTION



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

