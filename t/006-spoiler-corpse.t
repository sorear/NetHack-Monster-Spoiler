#!/usr/bin/env perl
use strict;
use warnings;
use Test::More;
use NetHack::Monster::Spoiler;
use List::Util qw/sum/;

sub test_corpse {
    local $Test::Builder::Level = $Test::Builder::Level + 1;
    my ($name, $expected_corpse) = @_;
    my $monster = NetHack::Monster::Spoiler->lookup($name);
    my $got_corpse = $monster->corpse;
    isa_ok($got_corpse, 'HASH');
    is_deeply($got_corpse, $expected_corpse, "correct corpse info for $name");
}

my %corpses = (
    kobold        => { poisonous         => 1 },
    newt          => { energy            => 1 },
    Death         => { die               => 1 },
    shopkeeper    => { cannibal          => 'Hum' },
    nurse         => { cannibal          => 'Hum',
                       heal              => 1 },
    raven         => { },
    tengu         => { poison_resistance => 1,
                       teleportitis      => 1,
                       teleport_control  => 1 },
    Medusa        => { petrify           => 1,
                       poisonous         => 1,
                       poison_resistance => 1 },
    'flesh golem' => { fire_resistance   => 1,
                       cold_resistance   => 1,
                       sleep_resistance  => 1,
                       shock_resistance  => 1,
                       poison_resistance => 1 },
);

Test::More::plan(tests => 2 * values %corpses);
test_corpse($_, $corpses{$_}) for keys %corpses;
