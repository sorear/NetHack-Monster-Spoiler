#!/usr/bin/env perl
use strict;
use warnings;
use Test::More tests => 1;

use NetHack::Monster;

my $mon = NetHack::Monster->new;

can_ok($mon, qw/x y glyph color/);
