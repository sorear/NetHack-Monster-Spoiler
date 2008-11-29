use inc::Module::Install;

name     'NetHack-Monster';
all_from 'lib/NetHack/Monster.pm';

build_requires 'Test::More';

WriteAll;

