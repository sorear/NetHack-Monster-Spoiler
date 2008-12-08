#!/usr/bin/env perl
# vim: sw=4 et
use strict;
use warnings;
use Test::More tests => 9;

use NetHack::Monster;
use NetHack::Monster::Turn;

my @turns;

for my $t (0 .. 30) {
    $turns[$t] = NetHack::Monster::Turn->new(count => $t);
}

my $mon = NetHack::Monster->new(turn => $turns[0], x => 2, y => 2);

is_deeply($mon->moved, { hold => 0.5, wander => 0.5 }, "No information about last move exists");

is($mon->sleeping, undef, "With only one observation we don't know if it's sleeping");
is_deeply({$mon->sleeping}, {0, 0.5, 1, 0.5}, "A priori assignment is equal probabilities");

$mon = NetHack::Monster->new(parents => [[$mon,1]], turn => $turns[1],
    x => 2, y => 2);

is_deeply($mon->moved, { hold => 1, wander => 0 }, "Definitely held still");
is($mon->sleeping, 1, "Seeing it hold still, it's probably asleep");

$mon = NetHack::Monster->new(parents => [[$mon,1]], turn => $turns[2],
    x => 3, y => 2);

is_deeply($mon->moved, { wander => 1, hold => 0 }, "Definitely moved");
is($mon->sleeping, 0, "Now that it's moved, it's definitely awake");

$mon = NetHack::Monster->new(parents => [[$mon,1]], turn => $turns[3],
    x => 3, y => 2);

is_deeply($mon->moved, { hold => 1, wander => 0 }, "Definitely held still");
is($mon->sleeping, 0, "It will stay awake for a while");

