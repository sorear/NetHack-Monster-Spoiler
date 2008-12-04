use inc::Module::Install;

name     'NetHack-Monster';
all_from 'lib/NetHack/Monster.pm';

requires       'YAML';
requires       'Moose';
requires       'MooseX::ClassAttributes';

build_requires 'Test::More';

WriteAll;

