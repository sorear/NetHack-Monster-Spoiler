#!/usr/bin/env perl
# vim: sw=4 et
use strict;
use warnings;
use Test::More tests => 4;

use NetHack::Monster;
use NetHack::Monster::Turn;

my @turns;

for my $t (0 .. 30) {
    $turns[$t] = NetHack::Monster::Turn->new(count => $t);
}

my $mon = NetHack::Monster->new(turn => $turns[0], x => 2, y => 2);

is($mon->sleeping, undef, "With only one observation we don't know if it's sleeping");

$mon = NetHack::Monster->new(parents => [[$mon,1]], turn => $turns[1],
    x => 2, y => 2);

is($mon->sleeping, 1, "Seeing it hold still, it's probably asleep");

$mon = NetHack::Monster->new(parents => [[$mon,1]], turn => $turns[2],
    x => 3, y => 2);

is($mon->sleeping, 0, "Now that it's moved, it's definitely awake");

$mon = NetHack::Monster->new(parents => [[$mon,1]], turn => $turns[3],
    x => 3, y => 2);

is($mon->sleeping, 0, "It will stay awake for a while");

