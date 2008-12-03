#!/usr/bin/env perl
use strict;
use warnings;
use Test::More tests => 2;

use NetHack::Monster;

my $mon = NetHack::Monster->new;

is(ref $mon, 'NetHack::Monster');

can_ok($mon, qw/x y glyph color/);
