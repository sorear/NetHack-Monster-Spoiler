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

my $mo2;
my $mon = NetHack::Monster->new(turn => $turns[0], x => 2, y => 2,
    glyph => 'E', color => 'cyan');

is($mon->type, "air elemental", "Cyan E can be immediately recognized");

$mon = NetHack::Monster->new(turn => $turns[1], x => 2, y => 2,
    glyph => 'I', color => 'gray', parents => [[$mon,1]]);

is($mon->type, "air elemental", "Losing sight doesn't make us forget");

####################

$mon = NetHack::Monster->new(turn => $turns[0], x => 2, y => 2,
    glyph => 'I', color => 'gray');

is($mon->type, undef, "We start with no information for Is");

####################

$mo2 = NetHack::Monster->new(turn => $turns[0], x => 2, y => 2,
    glyph => 'H', color => 'brown');

is_deeply({ $mo2->type }, { minotaur => 0.5, ettin => 0.5 },
    "A brown H could be an ettin or a minotaur, a priori equally possible");

$mo2->farlooked("H       a giant humanoid (minotaur)");

is($mo2->type, "minotaur", "With farlook we know");

$mo2 = NetHack::Monster->new(turn => $turns[1], x => 2, y => 2,
    glyph => 'H', color => 'brown', parents => [[$mo2,1]]);

is($mo2->type, "minotaur", "And remember next turn");

####################

$mo2 = NetHack::Monster->new(turn => $turns[2], x => 2, y => 2,
    glyph => 'I', color => 'gray', parents => [[$mo2,0.5],[$mon,0.5]]);

# We can do better
is($mo2->type, undef, "A monster with ambiguous history is ambiguous");

####################
####################

$turns[0] = NetHack::Monster::Turn->new(count => 0, hallucination => 1);

$mo2 = NetHack::Monster->new(turn => $turns[0], x => 2, y => 2,
    glyph => 'K', color => 'blue');

is_deeply({$mo2->type}, {}, "No information can be gleaned from appearance under hallucination");

$mo2->farlooked("H       a giant humanoid (jabberwock) [seen: paranoid delusion]");

is_deeply({$mo2->type}, { orc => 1/10, goblin => 1/10, hobgoblin => 1/10,
    "hill orc" => 1/10, "Mordor orc" => 1/10, "Uruk-hai" => 1/10,
    "orc shaman" => 1/10, "orc-captain" => 1/10, "orc mummy" => 1/10,
    "orc zombie" => 1/10}, "but a paranoid delusion is an orc");
