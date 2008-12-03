#!/usr/bin/env perl
use strict;
use warnings;
use Test::More tests => 2;

use_ok('NetHack::Monster::Spoiler');

my $list = NetHack::Monster::Spoiler->list;

is(ref $list, 'HASH');
