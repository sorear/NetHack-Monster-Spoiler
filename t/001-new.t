#!/usr/bin/env perl
use strict;
use warnings;
use Test::More tests => 4;

use NetHack::Monster;

use NetHack::Monster::Turn;

my $trn = NetHack::Monster::Turn->new(count => 1);

is(ref $trn, 'NetHack::Monster::Turn');
can_ok($trn, qw/count hallucination/);

my $mon = NetHack::Monster->new(turn => $trn);

is(ref $mon, 'NetHack::Monster');
can_ok($mon, qw/x y glyph color/);

