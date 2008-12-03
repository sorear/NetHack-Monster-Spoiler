package NetHack::Monster::Spoiler;
use Moose;
use YAML qw();
use MooseX::ClassAttribute;

our $VERSION = '0.01';

=head1 NAME

NetHack::Monster::Spoiler - information on a type of monster

=cut

class_has list => (
    is      => 'ro',
    isa     => 'HashRef',
    lazy    => 1,
    default => sub {
        local $/ = undef;
        my $hash = YAML::Load(<DATA>);
        close DATA;
        $hash;
    }
);


1;

=head1 SYNOPSIS

    use NetHack::Monster::Spoiler;

    my $s = NetHack::Monster::Spoiler->lookup(glyph => 'A', color => 'magenta');

    $s->is_spellcaster;          # returns 'wizard'
    $s->name                     # 'Archon'
    $s->nocorpse                 # 1
    $s->ignores_elbereth         # 1
    $s->resists('petrification') # 0

=head1 DESCRIPTION

NetHack::Monster::Spoiler is a machine-readable database of information
on the various monsters that inhabit the NetHack univers.

=head1 AUTHOR

Stefan O'Rear, C<< <stefanor@cox.net> >>

=head1 BUGS

No known bugs.

Please report any bugs through RT: email
C<bug-nethack-monster at rt.cpan.org>, or browse
L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=NetHack-Monster>.

=head1 COPYRIGHT AND LICENSE

Copyright 2008 Stefan O'Rear.

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.

=cut

__DATA__
---
Aleax:
  ac: 0
  alignment: 7
  attacks:
    - damage: 1d6
      mode: weapon
      type: physical
    - damage: 1d6
      mode: weapon
      type: physical
    - damage: 1d4
      mode: kick
      type: physical
  collect: 1
  color: yellow
  corpse: {}
  glyph: A
  hitdice: 10
  humanoid: 1
  infravisible: 1
  infravision: 1
  minion: 1
  mr: 30
  name: Aleax
  nasty: 1
  nocorpse: 1
  nohell: 1
  nutrition: 400
  rarity: 1
  resist:
    cold: 1
    elec: 1
    poison: 1
    sleep: 1
  see_invis: 1
  size: human
  sound: imitate
  speed: 8
  stalk: 1
  weight: 1450
Angel:
  ac: -4
  alignment: 12
  attacks:
    - damage: 1d6
      mode: weapon
      type: physical
    - damage: 1d6
      mode: weapon
      type: physical
    - damage: 1d4
      mode: claw
      type: physical
    - damage: 2d6
      mode: magic
      type: magicmissile
  collect: 1
  color: white
  corpse: {}
  fly: 1
  glyph: A
  hitdice: 14
  humanoid: 1
  infravisible: 1
  infravision: 1
  minion: 1
  mr: 55
  name: Angel
  nasty: 1
  nocorpse: 1
  nohell: 1
  nopoly: 1
  nutrition: 400
  rarity: 1
  resist:
    cold: 1
    elec: 1
    poison: 1
    sleep: 1
  see_invis: 1
  size: human
  sound: cuss
  speed: 10
  stalk: 1
  strong: 1
  weight: 1450
Arch Priest:
  ac: 7
  alignment: 0
  attacks:
    - damage: 4d10
      mode: weapon
      type: physical
    - damage: 2d8
      mode: kick
      type: physical
    - damage: 2d8
      mode: magic
      type: clericalspell
    - damage: 2d8
      mode: magic
      type: clericalspell
  close: 1
  collect: 1
  color: white
  corpse: {}
  glyph: '@'
  hitdice: 25
  human: 1
  humanoid: 1
  infravisible: 1
  magic: 1
  mr: 70
  name: Arch Priest
  nogen: 1
  nopoly: 1
  nutrition: 400
  omnivore: 1
  peaceful: 1
  resist:
    elec: 1
    fire: 1
    poison: 1
    sleep: 1
  see_invis: 1
  size: human
  sound: leader
  speed: 12
  strong: 1
  uniq: 1
  weight: 1450
Archon:
  ac: -6
  alignment: 15
  attacks:
    - damage: 2d4
      mode: weapon
      type: physical
    - damage: 2d4
      mode: weapon
      type: physical
    - damage: 2d6
      mode: gaze
      type: blind
    - damage: 1d8
      mode: claw
      type: physical
    - damage: 4d6
      mode: magic
      type: wizardspell
  collect: 1
  color: magenta
  corpse: {}
  fly: 1
  glyph: A
  hitdice: 19
  humanoid: 1
  infravisible: 1
  infravision: 1
  lord: 1
  magic: 1
  minion: 1
  mr: 80
  name: Archon
  nasty: 1
  nocorpse: 1
  nohell: 1
  nopoly: 1
  nutrition: 400
  rarity: 1
  regen: 1
  resist:
    cold: 1
    elec: 1
    fire: 1
    poison: 1
    sleep: 1
  see_invis: 1
  size: large
  sound: cuss
  speed: 16
  stalk: 1
  strong: 1
  weight: 1450
Ashikaga Takauji:
  ac: 0
  alignment: -13
  attacks:
    - damage: 2d6
      mode: weapon
      type: physical
    - damage: 2d6
      mode: weapon
      type: physical
    - damage: 2d6
      mode: claw
      type: stealamulet
  collect: 1
  color: magenta
  corpse: {}
  glyph: '@'
  hitdice: 15
  hostile: 1
  human: 1
  humanoid: 1
  infravisible: 1
  magic: 1
  male: 1
  mr: 40
  name: Ashikaga Takauji
  nasty: 1
  nocorpse: 1
  nogen: 1
  nopoly: 1
  nutrition: 400
  omnivore: 1
  pname: 1
  resist:
    stone: 1
  size: human
  sound: nemesis
  speed: 12
  stalk: 1
  strong: 1
  uniq: 1
  waitforu: 1
  wantsarti: 1
  weight: 1450
Asmodeus:
  ac: -7
  alignment: 20
  attacks:
    - damage: 4d4
      mode: claw
      type: physical
    - damage: 6d6
      mode: magic
      type: cold
  color: magenta
  corpse: {}
  demon: 1
  fly: 1
  glyph: '&'
  hell: 1
  hitdice: 105
  hostile: 1
  humanoid: 1
  infravisible: 1
  infravision: 1
  male: 1
  mr: 90
  name: Asmodeus
  nasty: 1
  nocorpse: 1
  nogen: 1
  nopoly: 1
  nutrition: 500
  pname: 1
  pois: 1
  prince: 1
  resist:
    cold: 1
    fire: 1
    poison: 1
  see_invis: 1
  size: huge
  sound: bribe
  speed: 12
  stalk: 1
  strong: 1
  uniq: 1
  waitforu: 1
  wantsamul: 1
  weight: 1500
Baalzebub:
  ac: -5
  alignment: 20
  attacks:
    - damage: 2d6
      mode: bite
      type: poison
    - damage: 2d6
      mode: gaze
      type: stun
  color: magenta
  corpse: {}
  demon: 1
  fly: 1
  glyph: '&'
  hell: 1
  hitdice: 89
  hostile: 1
  infravisible: 1
  infravision: 1
  male: 1
  mr: 85
  name: Baalzebub
  nasty: 1
  nocorpse: 1
  nogen: 1
  nopoly: 1
  nutrition: 500
  pname: 1
  pois: 1
  prince: 1
  resist:
    fire: 1
    poison: 1
  see_invis: 1
  size: large
  sound: bribe
  speed: 9
  stalk: 1
  uniq: 1
  waitforu: 1
  wantsamul: 1
  weight: 1500
Chromatic Dragon:
  ac: 0
  alignment: -14
  attacks:
    - damage: 6d8
      mode: breathe
      type: randombreath
    - damage: 0d0
      mode: magic
      type: wizardspell
    - damage: 2d8
      mode: claw
      type: stealamulet
    - damage: 4d8
      mode: bite
      type: physical
    - damage: 4d8
      mode: bite
      type: physical
    - damage: 1d6
      mode: sting
      type: physical
  carnivore: 1
  color: magenta
  corpse:
    cold: 1
    disint: 1
    elec: 1
    fire: 1
    poison: 1
    sleep: 1
    stone: 1
  female: 1
  glyph: D
  greedy: 1
  hitdice: 16
  hostile: 1
  infravisible: 1
  jewels: 1
  magic: 1
  mr: 30
  name: Chromatic Dragon
  nasty: 1
  nogen: 1
  nohands: 1
  nopoly: 1
  nutrition: 1700
  pois: 1
  resist:
    acid: 1
    cold: 1
    disint: 1
    elec: 1
    fire: 1
    poison: 1
    sleep: 1
    stone: 1
  see_invis: 1
  size: gigantic
  sound: nemesis
  speed: 12
  stalk: 1
  strong: 1
  thick_hide: 1
  uniq: 1
  waitforu: 1
  wantsarti: 1
  weight: 4500
Croesus:
  ac: 0
  alignment: 15
  attacks:
    - damage: 4d10
      mode: weapon
      type: physical
  collect: 1
  color: magenta
  corpse: {}
  glyph: '@'
  greedy: 1
  hitdice: 20
  hostile: 1
  human: 1
  humanoid: 1
  infravisible: 1
  jewels: 1
  magic: 1
  male: 1
  mr: 40
  name: Croesus
  nasty: 1
  nogen: 1
  nopoly: 1
  nutrition: 400
  omnivore: 1
  pname: 1
  prince: 1
  resist: {}
  see_invis: 1
  size: human
  sound: guard
  speed: 15
  stalk: 1
  strong: 1
  uniq: 1
  weight: 1450
Cyclops:
  ac: 0
  alignment: -15
  attacks:
    - damage: 4d8
      mode: weapon
      type: physical
    - damage: 4d8
      mode: weapon
      type: physical
    - damage: 2d6
      mode: claw
      type: stealamulet
  collect: 1
  color: gray
  corpse: {}
  giant: 1
  glyph: H
  hitdice: 18
  hostile: 1
  humanoid: 1
  infravisible: 1
  infravision: 1
  jewels: 1
  male: 1
  mr: 0
  name: Cyclops
  nasty: 1
  nogen: 1
  nopoly: 1
  nutrition: 700
  omnivore: 1
  resist:
    stone: 1
  rockthrow: 1
  size: huge
  sound: nemesis
  speed: 12
  stalk: 1
  strong: 1
  uniq: 1
  waitforu: 1
  wantsarti: 1
  weight: 1900
Dark One:
  ac: 0
  alignment: -10
  attacks:
    - damage: 1d6
      mode: weapon
      type: physical
    - damage: 1d6
      mode: weapon
      type: physical
    - damage: 1d4
      mode: claw
      type: stealamulet
    - damage: 0d0
      mode: magic
      type: wizardspell
  collect: 1
  color: black
  corpse: {}
  glyph: '@'
  hitdice: 15
  hostile: 1
  human: 1
  humanoid: 1
  infravisible: 1
  magic: 1
  mr: 80
  name: Dark One
  nasty: 1
  nocorpse: 1
  nogen: 1
  nopoly: 1
  nutrition: 400
  omnivore: 1
  resist:
    stone: 1
  size: human
  sound: nemesis
  speed: 12
  stalk: 1
  strong: 1
  uniq: 1
  waitforu: 1
  wantsarti: 1
  weight: 1450
Death:
  ac: -5
  alignment: 0
  attacks:
    - damage: 8d8
      mode: touch
      type: Death
    - damage: 8d8
      mode: touch
      type: Death
  color: magenta
  corpse: {}
  fly: 1
  glyph: '&'
  hitdice: 30
  hostile: 1
  humanoid: 1
  infravisible: 1
  infravision: 1
  mr: 100
  name: Death
  nasty: 1
  nogen: 1
  nopoly: 1
  nutrition: 1
  pname: 1
  regen: 1
  resist:
    cold: 1
    elec: 1
    fire: 1
    poison: 1
    sleep: 1
    stone: 1
  see_invis: 1
  size: human
  sound: rider
  speed: 12
  stalk: 1
  strong: 1
  tport_cntrl: 1
  uniq: 1
  weight: 1450
Demogorgon:
  ac: -8
  alignment: -20
  attacks:
    - damage: 8d6
      mode: magic
      type: wizardspell
    - damage: 1d4
      mode: sting
      type: drain
    - damage: 1d6
      mode: claw
      type: sickness
    - damage: 1d6
      mode: claw
      type: sickness
  color: magenta
  corpse: {}
  demon: 1
  fly: 1
  glyph: '&'
  hell: 1
  hitdice: 106
  hostile: 1
  infravisible: 1
  infravision: 1
  male: 1
  mr: 95
  name: Demogorgon
  nasty: 1
  nocorpse: 1
  nogen: 1
  nohands: 1
  nopoly: 1
  nutrition: 500
  pname: 1
  pois: 1
  prince: 1
  resist:
    fire: 1
    poison: 1
  see_invis: 1
  size: huge
  sound: growl
  speed: 15
  stalk: 1
  uniq: 1
  wantsamul: 1
  weight: 1500
Dispater:
  ac: -2
  alignment: 15
  attacks:
    - damage: 4d6
      mode: weapon
      type: physical
    - damage: 6d6
      mode: magic
      type: wizardspell
  collect: 1
  color: magenta
  corpse: {}
  demon: 1
  fly: 1
  glyph: '&'
  hell: 1
  hitdice: 78
  hostile: 1
  humanoid: 1
  infravisible: 1
  infravision: 1
  male: 1
  mr: 80
  name: Dispater
  nasty: 1
  nocorpse: 1
  nogen: 1
  nopoly: 1
  nutrition: 500
  pname: 1
  pois: 1
  prince: 1
  resist:
    fire: 1
    poison: 1
  see_invis: 1
  size: human
  sound: bribe
  speed: 15
  stalk: 1
  uniq: 1
  wantsamul: 1
  weight: 1500
Elvenking:
  ac: 10
  alignment: -10
  attacks:
    - damage: 2d4
      mode: weapon
      type: physical
    - damage: 2d4
      mode: weapon
      type: physical
  collect: 1
  color: magenta
  corpse:
    sleep: 1
  elf: 1
  geno: 1
  glyph: '@'
  hitdice: 9
  humanoid: 1
  infravisible: 1
  infravision: 1
  male: 1
  mr: 25
  name: Elvenking
  nutrition: 350
  omnivore: 1
  prince: 1
  rarity: 1
  resist:
    sleep: 1
  see_invis: 1
  size: human
  sound: humanoid
  speed: 12
  strong: 1
  weight: 800
Famine:
  ac: -5
  alignment: 0
  attacks:
    - damage: 8d8
      mode: touch
      type: Famine
    - damage: 8d8
      mode: touch
      type: Famine
  color: magenta
  corpse: {}
  fly: 1
  glyph: '&'
  hitdice: 30
  hostile: 1
  humanoid: 1
  infravisible: 1
  infravision: 1
  mr: 100
  name: Famine
  nasty: 1
  nogen: 1
  nopoly: 1
  nutrition: 1
  pname: 1
  regen: 1
  resist:
    cold: 1
    elec: 1
    fire: 1
    poison: 1
    sleep: 1
    stone: 1
  see_invis: 1
  size: human
  sound: rider
  speed: 12
  stalk: 1
  strong: 1
  tport_cntrl: 1
  uniq: 1
  weight: 1450
Geryon:
  ac: -3
  alignment: 15
  attacks:
    - damage: 3d6
      mode: claw
      type: physical
    - damage: 3d6
      mode: claw
      type: physical
    - damage: 2d4
      mode: sting
      type: poison
  color: magenta
  corpse: {}
  demon: 1
  fly: 1
  glyph: '&'
  hell: 1
  hitdice: 72
  hostile: 1
  infravisible: 1
  infravision: 1
  male: 1
  mr: 75
  name: Geryon
  nasty: 1
  nocorpse: 1
  nogen: 1
  nopoly: 1
  nutrition: 500
  pname: 1
  pois: 1
  prince: 1
  resist:
    fire: 1
    poison: 1
  see_invis: 1
  size: huge
  slithy: 1
  sound: bribe
  speed: 3
  stalk: 1
  uniq: 1
  wantsamul: 1
  weight: 1500
Grand Master:
  ac: 0
  alignment: 0
  attacks:
    - damage: 4d10
      mode: claw
      type: physical
    - damage: 2d8
      mode: kick
      type: physical
    - damage: 2d8
      mode: magic
      type: clericalspell
    - damage: 2d8
      mode: magic
      type: clericalspell
  close: 1
  color: black
  corpse: {}
  glyph: '@'
  herbivore: 1
  hitdice: 25
  human: 1
  humanoid: 1
  infravisible: 1
  magic: 1
  mr: 70
  name: Grand Master
  nasty: 1
  nogen: 1
  nopoly: 1
  nutrition: 400
  peaceful: 1
  resist:
    elec: 1
    fire: 1
    poison: 1
    sleep: 1
  see_invis: 1
  size: human
  sound: leader
  speed: 12
  strong: 1
  uniq: 1
  weight: 1450
Green-elf:
  ac: 10
  alignment: -6
  attacks:
    - damage: 2d4
      mode: weapon
      type: physical
  collect: 1
  color: bright_green
  corpse:
    sleep: 1
  elf: 1
  geno: 1
  glyph: '@'
  hitdice: 5
  humanoid: 1
  infravisible: 1
  infravision: 1
  mr: 10
  name: Green-elf
  nutrition: 350
  omnivore: 1
  rarity: 2
  resist:
    sleep: 1
  see_invis: 1
  sgroup: 1
  size: human
  sound: humanoid
  speed: 12
  weight: 800
Grey-elf:
  ac: 10
  alignment: -7
  attacks:
    - damage: 2d4
      mode: weapon
      type: physical
  collect: 1
  color: gray
  corpse:
    sleep: 1
  elf: 1
  geno: 1
  glyph: '@'
  hitdice: 6
  humanoid: 1
  infravisible: 1
  infravision: 1
  mr: 10
  name: Grey-elf
  nutrition: 350
  omnivore: 1
  rarity: 2
  resist:
    sleep: 1
  see_invis: 1
  sgroup: 1
  size: human
  sound: humanoid
  speed: 12
  weight: 800
Hippocrates:
  ac: 0
  alignment: 0
  attacks:
    - damage: 1d6
      mode: weapon
      type: physical
  close: 1
  collect: 1
  color: magenta
  corpse: {}
  glyph: '@'
  hitdice: 20
  human: 1
  humanoid: 1
  infravisible: 1
  magic: 1
  male: 1
  mr: 40
  name: Hippocrates
  nogen: 1
  nopoly: 1
  nutrition: 400
  omnivore: 1
  peaceful: 1
  pname: 1
  resist:
    poison: 1
  size: human
  sound: leader
  speed: 12
  strong: 1
  uniq: 1
  weight: 1450
Ixoth:
  ac: -1
  alignment: -14
  attacks:
    - damage: 8d6
      mode: breathe
      type: fire
    - damage: 4d8
      mode: bite
      type: physical
    - damage: 0d0
      mode: magic
      type: wizardspell
    - damage: 2d4
      mode: claw
      type: physical
    - damage: 2d4
      mode: claw
      type: stealamulet
  carnivore: 1
  color: red
  corpse:
    fire: 1
  fly: 1
  glyph: D
  greedy: 1
  hitdice: 15
  hostile: 1
  infravisible: 1
  jewels: 1
  magic: 1
  mr: 20
  name: Ixoth
  nasty: 1
  nogen: 1
  nohands: 1
  nopoly: 1
  nutrition: 1600
  pname: 1
  resist:
    fire: 1
    stone: 1
  see_invis: 1
  size: gigantic
  sound: nemesis
  speed: 12
  stalk: 1
  strong: 1
  thick_hide: 1
  uniq: 1
  waitforu: 1
  wantsarti: 1
  weight: 4500
Juiblex:
  ac: -7
  acid: 1
  alignment: -15
  amorphous: 1
  amphibious: 1
  attacks:
    - damage: 4d10
      mode: engulf
      type: sickness
    - damage: 3d6
      mode: spit
      type: acid
  color: bright_green
  corpse: {}
  demon: 1
  fly: 1
  glyph: '&'
  hell: 1
  hitdice: 50
  hostile: 1
  infravision: 1
  lord: 1
  male: 1
  mr: 65
  name: Juiblex
  nasty: 1
  nocorpse: 1
  nogen: 1
  nohead: 1
  nopoly: 1
  nutrition: 0
  pname: 1
  pois: 1
  resist:
    acid: 1
    fire: 1
    poison: 1
    stone: 1
  see_invis: 1
  size: large
  sound: gurgle
  speed: 3
  stalk: 1
  uniq: 1
  waitforu: 1
  wantsamul: 1
  weight: 1500
Keystone Kop:
  ac: 10
  alignment: 9
  attacks:
    - damage: 1d4
      mode: weapon
      type: physical
  collect: 1
  color: blue
  corpse: {}
  geno: 1
  glyph: K
  hitdice: 1
  hostile: 1
  human: 1
  humanoid: 1
  infravisible: 1
  lgroup: 1
  male: 1
  mr: 10
  name: Keystone Kop
  nogen: 1
  nutrition: 200
  resist: {}
  size: human
  sound: arrest
  speed: 6
  wander: 1
  weight: 1450
King Arthur:
  ac: 0
  alignment: 20
  attacks:
    - damage: 1d6
      mode: weapon
      type: physical
    - damage: 1d6
      mode: weapon
      type: physical
  close: 1
  collect: 1
  color: magenta
  corpse: {}
  glyph: '@'
  hitdice: 20
  human: 1
  humanoid: 1
  infravisible: 1
  magic: 1
  male: 1
  mr: 40
  name: King Arthur
  nogen: 1
  nopoly: 1
  nutrition: 400
  omnivore: 1
  peaceful: 1
  pname: 1
  resist: {}
  size: human
  sound: leader
  speed: 12
  strong: 1
  uniq: 1
  weight: 1450
Kop Kaptain:
  ac: 10
  alignment: 12
  attacks:
    - damage: 2d6
      mode: weapon
      type: physical
  collect: 1
  color: magenta
  corpse: {}
  geno: 1
  glyph: K
  hitdice: 4
  hostile: 1
  human: 1
  humanoid: 1
  infravisible: 1
  male: 1
  mr: 20
  name: Kop Kaptain
  nogen: 1
  nutrition: 200
  resist: {}
  size: human
  sound: arrest
  speed: 12
  strong: 1
  wander: 1
  weight: 1450
Kop Lieutenant:
  ac: 10
  alignment: 11
  attacks:
    - damage: 1d8
      mode: weapon
      type: physical
  collect: 1
  color: cyan
  corpse: {}
  geno: 1
  glyph: K
  hitdice: 3
  hostile: 1
  human: 1
  humanoid: 1
  infravisible: 1
  male: 1
  mr: 20
  name: Kop Lieutenant
  nogen: 1
  nutrition: 200
  resist: {}
  size: human
  sound: arrest
  speed: 10
  strong: 1
  wander: 1
  weight: 1450
Kop Sergeant:
  ac: 10
  alignment: 10
  attacks:
    - damage: 1d6
      mode: weapon
      type: physical
  collect: 1
  color: blue
  corpse: {}
  geno: 1
  glyph: K
  hitdice: 2
  hostile: 1
  human: 1
  humanoid: 1
  infravisible: 1
  male: 1
  mr: 10
  name: Kop Sergeant
  nogen: 1
  nutrition: 200
  resist: {}
  sgroup: 1
  size: human
  sound: arrest
  speed: 8
  strong: 1
  wander: 1
  weight: 1450
Lord Carnarvon:
  ac: 0
  alignment: 20
  attacks:
    - damage: 1d6
      mode: weapon
      type: physical
  close: 1
  collect: 1
  color: magenta
  corpse: {}
  glyph: '@'
  hitdice: 20
  human: 1
  humanoid: 1
  infravisible: 1
  magic: 1
  male: 1
  mr: 30
  name: Lord Carnarvon
  needpick: 1
  nogen: 1
  nopoly: 1
  nutrition: 400
  omnivore: 1
  peaceful: 1
  pname: 1
  resist: {}
  size: human
  sound: leader
  speed: 12
  strong: 1
  tunnel: 1
  uniq: 1
  weight: 1450
Lord Sato:
  ac: 0
  alignment: 20
  attacks:
    - damage: 1d8
      mode: weapon
      type: physical
    - damage: 1d6
      mode: weapon
      type: physical
  close: 1
  collect: 1
  color: magenta
  corpse: {}
  glyph: '@'
  hitdice: 20
  human: 1
  humanoid: 1
  infravisible: 1
  magic: 1
  male: 1
  mr: 30
  name: Lord Sato
  nogen: 1
  nopoly: 1
  nutrition: 400
  omnivore: 1
  peaceful: 1
  pname: 1
  resist: {}
  size: human
  sound: leader
  speed: 12
  strong: 1
  uniq: 1
  weight: 1450
Lord Surtur:
  ac: 2
  alignment: 12
  attacks:
    - damage: 2d10
      mode: weapon
      type: physical
    - damage: 2d10
      mode: weapon
      type: physical
    - damage: 2d6
      mode: claw
      type: stealamulet
  collect: 1
  color: magenta
  corpse:
    fire: 1
  giant: 1
  glyph: H
  hitdice: 15
  hostile: 1
  humanoid: 1
  infravisible: 1
  infravision: 1
  jewels: 1
  male: 1
  mr: 50
  name: Lord Surtur
  nasty: 1
  nogen: 1
  nopoly: 1
  nutrition: 850
  omnivore: 1
  pname: 1
  resist:
    fire: 1
    stone: 1
  rockthrow: 1
  size: huge
  sound: nemesis
  speed: 12
  stalk: 1
  strong: 1
  uniq: 1
  waitforu: 1
  wantsarti: 1
  weight: 2250
Master Assassin:
  ac: 0
  alignment: 18
  attacks:
    - damage: 2d6
      mode: weapon
      type: poison
    - damage: 2d8
      mode: weapon
      type: physical
    - damage: 2d6
      mode: claw
      type: stealamulet
  collect: 1
  color: magenta
  corpse: {}
  glyph: '@'
  hitdice: 15
  hostile: 1
  human: 1
  humanoid: 1
  infravisible: 1
  magic: 1
  mr: 30
  name: Master Assassin
  nasty: 1
  nogen: 1
  nopoly: 1
  nutrition: 400
  omnivore: 1
  resist:
    stone: 1
  size: human
  sound: nemesis
  speed: 12
  stalk: 1
  strong: 1
  uniq: 1
  waitforu: 1
  wantsarti: 1
  weight: 1450
Master Kaen:
  ac: -10
  alignment: -20
  attacks:
    - damage: 16d2
      mode: claw
      type: physical
    - damage: 16d2
      mode: claw
      type: physical
    - damage: 0d0
      mode: magic
      type: clericalspell
    - damage: 1d4
      mode: claw
      type: stealamulet
  collect: 1
  color: magenta
  corpse:
    poison: 1
  glyph: '@'
  herbivore: 1
  hitdice: 25
  hostile: 1
  human: 1
  humanoid: 1
  infravisible: 1
  magic: 1
  mr: 10
  name: Master Kaen
  nasty: 1
  nogen: 1
  nopoly: 1
  nutrition: 400
  pname: 1
  resist:
    poison: 1
    stone: 1
  see_invis: 1
  size: human
  sound: nemesis
  speed: 12
  stalk: 1
  strong: 1
  uniq: 1
  waitforu: 1
  wantsarti: 1
  weight: 1450
Master of Thieves:
  ac: 0
  alignment: -20
  attacks:
    - damage: 2d6
      mode: weapon
      type: physical
    - damage: 2d6
      mode: weapon
      type: physical
    - damage: 2d4
      mode: claw
      type: stealamulet
  close: 1
  collect: 1
  color: magenta
  corpse: {}
  glyph: '@'
  greedy: 1
  hitdice: 20
  human: 1
  humanoid: 1
  infravisible: 1
  jewels: 1
  magic: 1
  male: 1
  mr: 30
  name: Master of Thieves
  nogen: 1
  nopoly: 1
  nutrition: 400
  omnivore: 1
  peaceful: 1
  resist:
    stone: 1
  size: human
  sound: leader
  speed: 12
  strong: 1
  uniq: 1
  weight: 1450
Medusa:
  ac: 2
  alignment: -15
  amphibious: 1
  attacks:
    - damage: 2d4
      mode: weapon
      type: physical
    - damage: 1d8
      mode: claw
      type: physical
    - damage: 0d0
      mode: gaze
      type: petrify
    - damage: 1d6
      mode: bite
      type: poison
  color: bright_green
  corpse:
    poison: 1
    stone: 1
  female: 1
  fly: 1
  glyph: '@'
  hitdice: 20
  hostile: 1
  humanoid: 1
  infravisible: 1
  mr: 50
  name: Medusa
  nogen: 1
  nopoly: 1
  nutrition: 400
  omnivore: 1
  pname: 1
  pois: 1
  resist:
    poison: 1
    stone: 1
  size: large
  sound: hiss
  speed: 12
  strong: 1
  swim: 1
  uniq: 1
  waitforu: 1
  weight: 1450
Minion of Huhetotl:
  ac: -2
  alignment: -14
  attacks:
    - damage: 8d4
      mode: weapon
      type: physical
    - damage: 4d6
      mode: weapon
      type: physical
    - damage: 0d0
      mode: magic
      type: wizardspell
    - damage: 2d6
      mode: claw
      type: stealamulet
  collect: 1
  color: red
  corpse: {}
  demon: 1
  fly: 1
  glyph: '&'
  hitdice: 16
  hostile: 1
  infravisible: 1
  infravision: 1
  mr: 75
  name: Minion of Huhetotl
  nasty: 1
  nocorpse: 1
  nogen: 1
  nopoly: 1
  nutrition: 400
  pois: 1
  resist:
    fire: 1
    poison: 1
    stone: 1
  see_invis: 1
  size: large
  sound: nemesis
  speed: 12
  stalk: 1
  strong: 1
  uniq: 1
  waitforu: 1
  wantsarti: 1
  weight: 1450
Mordor orc:
  ac: 10
  alignment: -5
  attacks:
    - damage: 1d6
      mode: weapon
      type: physical
  collect: 1
  color: blue
  corpse: {}
  geno: 1
  glyph: o
  greedy: 1
  hitdice: 3
  humanoid: 1
  infravisible: 1
  infravision: 1
  jewels: 1
  lgroup: 1
  mr: 0
  name: Mordor orc
  nutrition: 200
  omnivore: 1
  orc: 1
  rarity: 1
  resist: {}
  size: human
  sound: orc
  speed: 5
  strong: 1
  weight: 1200
Nalzok:
  ac: -2
  alignment: -127
  attacks:
    - damage: 8d4
      mode: weapon
      type: physical
    - damage: 4d6
      mode: weapon
      type: physical
    - damage: 0d0
      mode: magic
      type: wizardspell
    - damage: 2d6
      mode: claw
      type: stealamulet
  collect: 1
  color: red
  corpse: {}
  demon: 1
  fly: 1
  glyph: '&'
  hitdice: 16
  hostile: 1
  infravisible: 1
  infravision: 1
  mr: 85
  name: Nalzok
  nasty: 1
  nocorpse: 1
  nogen: 1
  nopoly: 1
  nutrition: 400
  pname: 1
  pois: 1
  resist:
    fire: 1
    poison: 1
    stone: 1
  see_invis: 1
  size: large
  sound: nemesis
  speed: 12
  stalk: 1
  strong: 1
  uniq: 1
  waitforu: 1
  wantsarti: 1
  weight: 1450
Nazgul:
  ac: 0
  alignment: -17
  attacks:
    - damage: 1d4
      mode: weapon
      type: drain
    - damage: 2d25
      mode: breathe
      type: sleep
  breathless: 1
  collect: 1
  color: magenta
  corpse: {}
  geno: 1
  glyph: W
  hitdice: 13
  hostile: 1
  humanoid: 1
  male: 1
  mr: 25
  name: Nazgul
  nocorpse: 1
  nopoly: 1
  nutrition: 0
  rarity: 1
  resist:
    cold: 1
    poison: 1
    sleep: 1
  size: human
  sound: spell
  speed: 12
  stalk: 1
  strong: 1
  undead: 1
  weight: 1450
Neferet the Green:
  ac: 0
  alignment: 0
  attacks:
    - damage: 1d6
      mode: weapon
      type: physical
    - damage: 2d8
      mode: magic
      type: wizardspell
  close: 1
  collect: 1
  color: green
  corpse: {}
  female: 1
  glyph: '@'
  hitdice: 20
  human: 1
  humanoid: 1
  infravisible: 1
  magic: 1
  mr: 60
  name: Neferet the Green
  nogen: 1
  nopoly: 1
  nutrition: 400
  omnivore: 1
  peaceful: 1
  pname: 1
  resist: {}
  size: human
  sound: leader
  speed: 12
  strong: 1
  uniq: 1
  weight: 1450
Norn:
  ac: 0
  alignment: 0
  attacks:
    - damage: 1d8
      mode: weapon
      type: physical
    - damage: 1d6
      mode: weapon
      type: physical
  close: 1
  collect: 1
  color: magenta
  corpse: {}
  female: 1
  glyph: '@'
  hitdice: 20
  human: 1
  humanoid: 1
  infravisible: 1
  magic: 1
  mr: 80
  name: Norn
  nogen: 1
  nopoly: 1
  nutrition: 400
  omnivore: 1
  peaceful: 1
  resist:
    cold: 1
  size: human
  sound: leader
  speed: 12
  strong: 1
  uniq: 1
  weight: 1450
Olog-hai:
  ac: -4
  alignment: -7
  attacks:
    - damage: 3d6
      mode: weapon
      type: physical
    - damage: 2d8
      mode: claw
      type: physical
    - damage: 2d6
      mode: bite
      type: physical
  carnivore: 1
  collect: 1
  color: magenta
  corpse: {}
  geno: 1
  glyph: T
  hitdice: 13
  hostile: 1
  humanoid: 1
  infravisible: 1
  infravision: 1
  mr: 0
  name: Olog-hai
  nutrition: 400
  rarity: 1
  regen: 1
  resist: {}
  size: large
  sound: grunt
  speed: 12
  stalk: 1
  strong: 1
  weight: 1500
Oracle:
  ac: 0
  alignment: 0
  attacks:
    - damage: 0d4
      mode: passive
      type: magicmissile
  color: bright_blue
  corpse: {}
  female: 1
  glyph: '@'
  hitdice: 12
  human: 1
  humanoid: 1
  infravisible: 1
  mr: 50
  name: Oracle
  nogen: 1
  nopoly: 1
  nutrition: 400
  omnivore: 1
  peaceful: 1
  resist: {}
  size: human
  sound: oracle
  speed: 0
  uniq: 1
  weight: 1450
Orcus:
  ac: -6
  alignment: -20
  attacks:
    - damage: 3d6
      mode: weapon
      type: physical
    - damage: 3d4
      mode: claw
      type: physical
    - damage: 3d4
      mode: claw
      type: physical
    - damage: 8d6
      mode: magic
      type: wizardspell
    - damage: 2d4
      mode: sting
      type: poison
  collect: 1
  color: magenta
  corpse: {}
  demon: 1
  fly: 1
  glyph: '&'
  hell: 1
  hitdice: 66
  hostile: 1
  infravisible: 1
  infravision: 1
  male: 1
  mr: 85
  name: Orcus
  nasty: 1
  nocorpse: 1
  nogen: 1
  nopoly: 1
  nutrition: 500
  pname: 1
  pois: 1
  prince: 1
  resist:
    fire: 1
    poison: 1
  see_invis: 1
  size: huge
  sound: orc
  speed: 9
  stalk: 1
  uniq: 1
  waitforu: 1
  wantsamul: 1
  wantsbook: 1
  weight: 1500
Orion:
  ac: 0
  alignment: 0
  amphibious: 1
  attacks:
    - damage: 1d6
      mode: weapon
      type: physical
  close: 1
  collect: 1
  color: magenta
  corpse: {}
  glyph: '@'
  hitdice: 20
  human: 1
  humanoid: 1
  infravisible: 1
  infravision: 1
  magic: 1
  male: 1
  mr: 30
  name: Orion
  nogen: 1
  nopoly: 1
  nutrition: 400
  omnivore: 1
  peaceful: 1
  pname: 1
  resist: {}
  see_invis: 1
  size: human
  sound: leader
  speed: 12
  strong: 1
  swim: 1
  uniq: 1
  weight: 1450
Pelias:
  ac: 0
  alignment: 0
  attacks:
    - damage: 1d6
      mode: weapon
      type: physical
  close: 1
  collect: 1
  color: magenta
  corpse: {}
  glyph: '@'
  hitdice: 20
  human: 1
  humanoid: 1
  infravisible: 1
  magic: 1
  male: 1
  mr: 30
  name: Pelias
  nogen: 1
  nopoly: 1
  nutrition: 400
  omnivore: 1
  peaceful: 1
  pname: 1
  resist:
    poison: 1
  size: human
  sound: leader
  speed: 12
  strong: 1
  uniq: 1
  weight: 1450
Pestilence:
  ac: -5
  alignment: 0
  attacks:
    - damage: 8d8
      mode: touch
      type: Pestilence
    - damage: 8d8
      mode: touch
      type: Pestilence
  color: magenta
  corpse: {}
  fly: 1
  glyph: '&'
  hitdice: 30
  hostile: 1
  humanoid: 1
  infravisible: 1
  infravision: 1
  mr: 100
  name: Pestilence
  nasty: 1
  nogen: 1
  nopoly: 1
  nutrition: 1
  pname: 1
  regen: 1
  resist:
    cold: 1
    elec: 1
    fire: 1
    poison: 1
    sleep: 1
    stone: 1
  see_invis: 1
  size: human
  sound: rider
  speed: 12
  stalk: 1
  strong: 1
  tport_cntrl: 1
  uniq: 1
  weight: 1450
Scorpius:
  ac: 10
  alignment: -15
  animal: 1
  attacks:
    - damage: 2d6
      mode: claw
      type: physical
    - damage: 2d6
      mode: claw
      type: stealamulet
    - damage: 1d4
      mode: sting
      type: sickness
  carnivore: 1
  collect: 1
  color: magenta
  corpse:
    poison: 1
  glyph: s
  hitdice: 15
  hostile: 1
  magic: 1
  mr: 0
  name: Scorpius
  nasty: 1
  nogen: 1
  nohands: 1
  nopoly: 1
  nutrition: 350
  oviparous: 1
  pname: 1
  pois: 1
  resist:
    poison: 1
    stone: 1
  size: human
  sound: nemesis
  speed: 12
  stalk: 1
  strong: 1
  uniq: 1
  waitforu: 1
  wantsarti: 1
  weight: 750
Shaman Karnov:
  ac: 0
  alignment: 20
  attacks:
    - damage: 2d4
      mode: weapon
      type: physical
  close: 1
  collect: 1
  color: magenta
  corpse: {}
  glyph: '@'
  hitdice: 20
  human: 1
  humanoid: 1
  infravisible: 1
  magic: 1
  male: 1
  mr: 30
  name: Shaman Karnov
  nogen: 1
  nopoly: 1
  nutrition: 400
  omnivore: 1
  peaceful: 1
  pname: 1
  resist: {}
  size: human
  sound: leader
  speed: 12
  strong: 1
  uniq: 1
  weight: 1450
Thoth Amon:
  ac: 0
  alignment: -14
  attacks:
    - damage: 1d6
      mode: weapon
      type: physical
    - damage: 0d0
      mode: magic
      type: wizardspell
    - damage: 0d0
      mode: magic
      type: wizardspell
    - damage: 1d4
      mode: claw
      type: stealamulet
  collect: 1
  color: magenta
  corpse: {}
  glyph: '@'
  hitdice: 16
  hostile: 1
  human: 1
  humanoid: 1
  infravisible: 1
  magic: 1
  male: 1
  mr: 10
  name: Thoth Amon
  nasty: 1
  nocorpse: 1
  nogen: 1
  nopoly: 1
  nutrition: 400
  omnivore: 1
  pname: 1
  resist:
    poison: 1
    stone: 1
  size: human
  sound: nemesis
  speed: 12
  stalk: 1
  strong: 1
  uniq: 1
  waitforu: 1
  wantsarti: 1
  weight: 1450
Twoflower:
  ac: 10
  alignment: 0
  attacks:
    - damage: 1d6
      mode: weapon
      type: physical
    - damage: 1d6
      mode: weapon
      type: physical
  close: 1
  collect: 1
  color: white
  corpse: {}
  glyph: '@'
  hitdice: 20
  human: 1
  humanoid: 1
  infravisible: 1
  magic: 1
  male: 1
  mr: 20
  name: Twoflower
  nogen: 1
  nopoly: 1
  nutrition: 400
  omnivore: 1
  peaceful: 1
  pname: 1
  resist: {}
  size: human
  sound: leader
  speed: 12
  strong: 1
  uniq: 1
  weight: 1450
Uruk-hai:
  ac: 10
  alignment: -4
  attacks:
    - damage: 1d8
      mode: weapon
      type: physical
  collect: 1
  color: black
  corpse: {}
  geno: 1
  glyph: o
  greedy: 1
  hitdice: 3
  humanoid: 1
  infravisible: 1
  infravision: 1
  jewels: 1
  lgroup: 1
  mr: 0
  name: Uruk-hai
  nutrition: 300
  omnivore: 1
  orc: 1
  rarity: 1
  resist: {}
  size: human
  sound: orc
  speed: 7
  strong: 1
  weight: 1300
Vlad the Impaler:
  ac: -3
  alignment: -10
  attacks:
    - damage: 1d10
      mode: weapon
      type: physical
    - damage: 1d10
      mode: bite
      type: drain
  breathless: 1
  color: magenta
  corpse: {}
  fly: 1
  glyph: V
  hitdice: 14
  hostile: 1
  humanoid: 1
  infravisible: 1
  male: 1
  mr: 80
  name: Vlad the Impaler
  nasty: 1
  nocorpse: 1
  nogen: 1
  nopoly: 1
  nutrition: 400
  pname: 1
  pois: 1
  prince: 1
  regen: 1
  resist:
    poison: 1
    sleep: 1
  size: human
  sound: vampire
  speed: 18
  stalk: 1
  strong: 1
  undead: 1
  uniq: 1
  waitforu: 1
  wantscand: 1
  weight: 1450
Wizard of Yendor:
  ac: -8
  alignment: none
  attacks:
    - damage: 2d12
      mode: claw
      type: stealamulet
    - damage: 0d0
      mode: magic
      type: wizardspell
  breathless: 1
  color: magenta
  corpse:
    fire: 1
    poison: 1
  covetous: 1
  fly: 1
  glyph: '@'
  hitdice: 30
  hostile: 1
  human: 1
  humanoid: 1
  infravisible: 1
  magic: 1
  male: 1
  mr: 100
  name: Wizard of Yendor
  nasty: 1
  nogen: 1
  nopoly: 1
  nutrition: 400
  omnivore: 1
  prince: 1
  regen: 1
  resist:
    fire: 1
    poison: 1
  see_invis: 1
  size: human
  sound: cuss
  speed: 12
  strong: 1
  tport: 1
  tport_cntrl: 1
  uniq: 1
  waitforu: 1
  weight: 1450
Woodland-elf:
  ac: 10
  alignment: -5
  attacks:
    - damage: 2d4
      mode: weapon
      type: physical
  collect: 1
  color: green
  corpse:
    sleep: 1
  elf: 1
  geno: 1
  glyph: '@'
  hitdice: 4
  humanoid: 1
  infravisible: 1
  infravision: 1
  mr: 10
  name: Woodland-elf
  nutrition: 350
  omnivore: 1
  rarity: 2
  resist:
    sleep: 1
  see_invis: 1
  sgroup: 1
  size: human
  sound: humanoid
  speed: 12
  weight: 800
Yeenoghu:
  ac: -5
  alignment: -15
  attacks:
    - damage: 3d6
      mode: weapon
      type: physical
    - damage: 2d8
      mode: weapon
      type: conf
    - damage: 1d6
      mode: claw
      type: paralyze
    - damage: 2d6
      mode: magic
      type: magicmissile
  collect: 1
  color: magenta
  corpse: {}
  demon: 1
  fly: 1
  glyph: '&'
  hell: 1
  hitdice: 56
  hostile: 1
  infravisible: 1
  infravision: 1
  lord: 1
  male: 1
  mr: 80
  name: Yeenoghu
  nasty: 1
  nocorpse: 1
  nogen: 1
  nopoly: 1
  nutrition: 500
  pname: 1
  pois: 1
  resist:
    fire: 1
    poison: 1
  see_invis: 1
  size: large
  sound: orc
  speed: 18
  stalk: 1
  uniq: 1
  wantsamul: 1
  weight: 900
abbot:
  ac: 10
  alignment: 0
  attacks:
    - damage: 8d2
      mode: claw
      type: physical
    - damage: 3d2
      mode: kick
      type: stun
    - damage: 0d0
      mode: magic
      type: clericalspell
  collect: 1
  color: white
  corpse: {}
  glyph: '@'
  herbivore: 1
  hitdice: 5
  human: 1
  humanoid: 1
  infravisible: 1
  mr: 20
  name: abbot
  nogen: 1
  nopoly: 1
  nutrition: 400
  peaceful: 1
  resist: {}
  size: human
  sound: guardian
  speed: 12
  strong: 1
  weight: 1450
acid blob:
  ac: 8
  acid: 1
  alignment: 0
  amorphous: 1
  attacks:
    - damage: 1d8
      mode: passive
      type: acid
  breathless: 1
  color: green
  corpse:
    stone: 1
  geno: 1
  glyph: b
  hitdice: 1
  mindless: 1
  mr: 0
  name: acid blob
  neuter: 1
  noeyes: 1
  nohead: 1
  nolimbs: 1
  nutrition: 10
  rarity: 2
  resist:
    acid: 1
    poison: 1
    sleep: 1
    stone: 1
  size: tiny
  sound: silent
  speed: 3
  wander: 1
  weight: 30
acolyte:
  ac: 10
  alignment: 0
  attacks:
    - damage: 1d6
      mode: weapon
      type: physical
    - damage: 0d0
      mode: magic
      type: clericalspell
  collect: 1
  color: white
  corpse: {}
  glyph: '@'
  hitdice: 5
  human: 1
  humanoid: 1
  infravisible: 1
  mr: 20
  name: acolyte
  nogen: 1
  nopoly: 1
  nutrition: 400
  omnivore: 1
  peaceful: 1
  resist: {}
  size: human
  sound: guardian
  speed: 12
  strong: 1
  weight: 1450
air elemental:
  ac: 2
  alignment: 0
  attacks:
    - damage: 1d10
      mode: engulf
      type: physical
  color: cyan
  corpse: {}
  fly: 1
  glyph: E
  hitdice: 8
  mindless: 1
  mr: 30
  name: air elemental
  neuter: 1
  nocorpse: 1
  noeyes: 1
  nohead: 1
  nolimbs: 1
  nutrition: 0
  rarity: 1
  resist:
    poison: 1
    stone: 1
  size: huge
  sound: silent
  speed: 36
  strong: 1
  unsolid: 1
  weight: 0
aligned priest:
  ac: 10
  alignment: 0
  attacks:
    - damage: 4d10
      mode: weapon
      type: physical
    - damage: 1d4
      mode: kick
      type: physical
    - damage: 0d0
      mode: magic
      type: clericalspell
  collect: 1
  color: white
  corpse: {}
  glyph: '@'
  hitdice: 12
  human: 1
  humanoid: 1
  infravisible: 1
  lord: 1
  mr: 50
  name: aligned priest
  nogen: 1
  nopoly: 1
  nutrition: 400
  omnivore: 1
  peaceful: 1
  resist:
    elec: 1
  size: human
  sound: priest
  speed: 12
  weight: 1450
ape:
  ac: 6
  alignment: 0
  animal: 1
  attacks:
    - damage: 1d3
      mode: claw
      type: physical
    - damage: 1d3
      mode: claw
      type: physical
    - damage: 1d6
      mode: bite
      type: physical
  carnivore: 1
  color: brown
  corpse: {}
  geno: 1
  glyph: Y
  hitdice: 4
  humanoid: 1
  infravisible: 1
  mr: 0
  name: ape
  nutrition: 500
  rarity: 2
  resist: {}
  sgroup: 1
  size: large
  sound: growl
  speed: 12
  strong: 1
  weight: 1100
apprentice:
  ac: 10
  alignment: 0
  attacks:
    - damage: 1d6
      mode: weapon
      type: physical
    - damage: 0d0
      mode: magic
      type: wizardspell
  collect: 1
  color: white
  corpse: {}
  glyph: '@'
  hitdice: 5
  human: 1
  humanoid: 1
  infravisible: 1
  magic: 1
  mr: 30
  name: apprentice
  nogen: 1
  nopoly: 1
  nutrition: 400
  omnivore: 1
  peaceful: 1
  resist: {}
  size: human
  sound: guardian
  speed: 12
  strong: 1
  weight: 1450
arch-lich:
  ac: -6
  alignment: -15
  attacks:
    - damage: 5d6
      mode: touch
      type: cold
    - damage: 0d0
      mode: magic
      type: wizardspell
  breathless: 1
  color: magenta
  corpse:
    cold: 1
    fire: 1
  geno: 1
  glyph: L
  hell: 1
  hitdice: 25
  hostile: 1
  humanoid: 1
  infravision: 1
  magic: 1
  mr: 90
  name: arch-lich
  nocorpse: 1
  nutrition: 100
  pois: 1
  rarity: 1
  regen: 1
  resist:
    cold: 1
    elec: 1
    fire: 1
    poison: 1
    sleep: 1
  size: human
  sound: mumble
  speed: 9
  undead: 1
  wantsbook: 1
  weight: 1200
archeologist:
  ac: 10
  alignment: 3
  attacks:
    - damage: 1d6
      mode: weapon
      type: physical
    - damage: 1d6
      mode: weapon
      type: physical
  collect: 1
  color: white
  corpse: {}
  glyph: '@'
  hitdice: 10
  human: 1
  humanoid: 1
  infravisible: 1
  mr: 1
  name: archeologist
  needpick: 1
  nogen: 1
  nopoly: 1
  nutrition: 400
  omnivore: 1
  resist: {}
  size: human
  sound: humanoid
  speed: 12
  strong: 1
  tunnel: 1
  weight: 1450
attendant:
  ac: 10
  alignment: 3
  attacks:
    - damage: 1d6
      mode: weapon
      type: physical
  collect: 1
  color: white
  corpse: {}
  glyph: '@'
  hitdice: 5
  human: 1
  humanoid: 1
  infravisible: 1
  mr: 10
  name: attendant
  nogen: 1
  nopoly: 1
  nutrition: 400
  omnivore: 1
  peaceful: 1
  resist:
    poison: 1
  size: human
  sound: guardian
  speed: 12
  strong: 1
  weight: 1450
baby black dragon:
  ac: 2
  alignment: 0
  attacks:
    - damage: 2d6
      mode: bite
      type: physical
  carnivore: 1
  color: black
  corpse: {}
  fly: 1
  geno: 1
  glyph: D
  greedy: 1
  hitdice: 12
  hostile: 1
  jewels: 1
  mr: 10
  name: baby black dragon
  nohands: 1
  nutrition: 500
  resist:
    disint: 1
  size: huge
  sound: roar
  speed: 9
  strong: 1
  thick_hide: 1
  weight: 1500
baby blue dragon:
  ac: 2
  alignment: 0
  attacks:
    - damage: 2d6
      mode: bite
      type: physical
  carnivore: 1
  color: blue
  corpse: {}
  fly: 1
  geno: 1
  glyph: D
  greedy: 1
  hitdice: 12
  hostile: 1
  jewels: 1
  mr: 10
  name: baby blue dragon
  nohands: 1
  nutrition: 500
  resist:
    elec: 1
  size: huge
  sound: roar
  speed: 9
  strong: 1
  thick_hide: 1
  weight: 1500
baby crocodile:
  ac: 7
  alignment: 0
  amphibious: 1
  animal: 1
  attacks:
    - damage: 1d4
      mode: bite
      type: physical
  carnivore: 1
  color: brown
  corpse: {}
  geno: 1
  glyph: ':'
  hitdice: 3
  hostile: 1
  mr: 0
  name: baby crocodile
  nohands: 1
  nutrition: 200
  resist: {}
  size: medium
  sound: silent
  speed: 6
  swim: 1
  weight: 200
baby gray dragon:
  ac: 2
  alignment: 0
  attacks:
    - damage: 2d6
      mode: bite
      type: physical
  carnivore: 1
  color: gray
  corpse: {}
  fly: 1
  geno: 1
  glyph: D
  greedy: 1
  hitdice: 12
  hostile: 1
  jewels: 1
  mr: 10
  name: baby gray dragon
  nohands: 1
  nutrition: 500
  resist: {}
  size: huge
  sound: roar
  speed: 9
  strong: 1
  thick_hide: 1
  weight: 1500
baby green dragon:
  ac: 2
  alignment: 0
  attacks:
    - damage: 2d6
      mode: bite
      type: physical
  carnivore: 1
  color: green
  corpse: {}
  fly: 1
  geno: 1
  glyph: D
  greedy: 1
  hitdice: 12
  hostile: 1
  jewels: 1
  mr: 10
  name: baby green dragon
  nohands: 1
  nutrition: 500
  pois: 1
  resist:
    poison: 1
  size: huge
  sound: roar
  speed: 9
  strong: 1
  thick_hide: 1
  weight: 1500
baby long worm:
  ac: 5
  alignment: 0
  animal: 1
  attacks:
    - damage: 1d6
      mode: bite
      type: physical
  carnivore: 1
  color: brown
  corpse: {}
  geno: 1
  glyph: w
  hitdice: 8
  hostile: 1
  mr: 0
  name: baby long worm
  nolimbs: 1
  notake: 1
  nutrition: 250
  resist: {}
  size: large
  slithy: 1
  sound: silent
  speed: 3
  weight: 600
baby orange dragon:
  ac: 2
  alignment: 0
  attacks:
    - damage: 2d6
      mode: bite
      type: physical
  carnivore: 1
  color: orange
  corpse: {}
  fly: 1
  geno: 1
  glyph: D
  greedy: 1
  hitdice: 12
  hostile: 1
  jewels: 1
  mr: 10
  name: baby orange dragon
  nohands: 1
  nutrition: 500
  resist:
    sleep: 1
  size: huge
  sound: roar
  speed: 9
  strong: 1
  thick_hide: 1
  weight: 1500
baby purple worm:
  ac: 5
  alignment: 0
  animal: 1
  attacks:
    - damage: 1d6
      mode: bite
      type: physical
  carnivore: 1
  color: magenta
  corpse: {}
  geno: 1
  glyph: w
  hitdice: 8
  hostile: 1
  mr: 0
  name: baby purple worm
  nolimbs: 1
  nutrition: 250
  resist: {}
  size: large
  slithy: 1
  sound: silent
  speed: 3
  weight: 600
baby red dragon:
  ac: 2
  alignment: 0
  attacks:
    - damage: 2d6
      mode: bite
      type: physical
  carnivore: 1
  color: red
  corpse: {}
  fly: 1
  geno: 1
  glyph: D
  greedy: 1
  hitdice: 12
  hostile: 1
  infravisible: 1
  jewels: 1
  mr: 10
  name: baby red dragon
  nohands: 1
  nutrition: 500
  resist:
    fire: 1
  size: huge
  sound: roar
  speed: 9
  strong: 1
  thick_hide: 1
  weight: 1500
baby silver dragon:
  ac: 2
  alignment: 0
  attacks:
    - damage: 2d6
      mode: bite
      type: physical
  carnivore: 1
  color: gray
  corpse: {}
  fly: 1
  geno: 1
  glyph: D
  greedy: 1
  hitdice: 12
  hostile: 1
  jewels: 1
  mr: 10
  name: baby silver dragon
  nohands: 1
  nutrition: 500
  resist: {}
  size: huge
  sound: roar
  speed: 9
  strong: 1
  thick_hide: 1
  weight: 1500
baby white dragon:
  ac: 2
  alignment: 0
  attacks:
    - damage: 2d6
      mode: bite
      type: physical
  carnivore: 1
  color: white
  corpse: {}
  fly: 1
  geno: 1
  glyph: D
  greedy: 1
  hitdice: 12
  hostile: 1
  jewels: 1
  mr: 10
  name: baby white dragon
  nohands: 1
  nutrition: 500
  resist:
    cold: 1
  size: huge
  sound: roar
  speed: 9
  strong: 1
  thick_hide: 1
  weight: 1500
baby yellow dragon:
  ac: 2
  acid: 1
  alignment: 0
  attacks:
    - damage: 2d6
      mode: bite
      type: physical
  carnivore: 1
  color: yellow
  corpse: {}
  fly: 1
  geno: 1
  glyph: D
  greedy: 1
  hitdice: 12
  hostile: 1
  jewels: 1
  mr: 10
  name: baby yellow dragon
  nohands: 1
  nutrition: 500
  resist:
    acid: 1
    stone: 1
  size: huge
  sound: roar
  speed: 9
  strong: 1
  thick_hide: 1
  weight: 1500
balrog:
  ac: -2
  alignment: -14
  attacks:
    - damage: 8d4
      mode: weapon
      type: physical
    - damage: 4d6
      mode: weapon
      type: physical
  collect: 1
  color: red
  corpse: {}
  demon: 1
  fly: 1
  glyph: '&'
  hell: 1
  hitdice: 16
  hostile: 1
  infravisible: 1
  infravision: 1
  mr: 75
  name: balrog
  nasty: 1
  nocorpse: 1
  nutrition: 400
  pois: 1
  rarity: 1
  resist:
    fire: 1
    poison: 1
  see_invis: 1
  size: large
  sound: silent
  speed: 5
  stalk: 1
  strong: 1
  weight: 1450
baluchitherium:
  ac: 5
  alignment: 0
  animal: 1
  attacks:
    - damage: 5d4
      mode: claw
      type: physical
    - damage: 5d4
      mode: claw
      type: physical
  color: gray
  corpse: {}
  geno: 1
  glyph: q
  herbivore: 1
  hitdice: 14
  hostile: 1
  infravisible: 1
  mr: 0
  name: baluchitherium
  nohands: 1
  nutrition: 800
  rarity: 2
  resist: {}
  size: large
  sound: silent
  speed: 12
  strong: 1
  thick_hide: 1
  weight: 3800
barbarian:
  ac: 10
  alignment: 0
  attacks:
    - damage: 1d6
      mode: weapon
      type: physical
    - damage: 1d6
      mode: weapon
      type: physical
  collect: 1
  color: white
  corpse: {}
  glyph: '@'
  hitdice: 10
  human: 1
  humanoid: 1
  infravisible: 1
  mr: 1
  name: barbarian
  nogen: 1
  nopoly: 1
  nutrition: 400
  omnivore: 1
  resist:
    poison: 1
  size: human
  sound: humanoid
  speed: 12
  strong: 1
  weight: 1450
barbed devil:
  ac: 0
  alignment: 8
  attacks:
    - damage: 2d4
      mode: claw
      type: physical
    - damage: 2d4
      mode: claw
      type: physical
    - damage: 3d4
      mode: sting
      type: physical
  color: red
  corpse: {}
  demon: 1
  glyph: '&'
  hell: 1
  hitdice: 8
  hostile: 1
  infravisible: 1
  infravision: 1
  mr: 35
  name: barbed devil
  nasty: 1
  nocorpse: 1
  nutrition: 400
  pois: 1
  rarity: 2
  resist:
    fire: 1
    poison: 1
  sgroup: 1
  size: human
  sound: silent
  speed: 12
  stalk: 1
  thick_hide: 1
  weight: 1450
barrow wight:
  ac: 5
  alignment: -3
  attacks:
    - damage: 0d0
      mode: weapon
      type: drain
    - damage: 0d0
      mode: magic
      type: wizardspell
    - damage: 1d4
      mode: claw
      type: physical
  breathless: 1
  collect: 1
  color: gray
  corpse: {}
  geno: 1
  glyph: W
  hitdice: 3
  hostile: 1
  humanoid: 1
  mr: 5
  name: barrow wight
  nocorpse: 1
  nutrition: 0
  rarity: 1
  resist:
    cold: 1
    poison: 1
    sleep: 1
  size: human
  sound: spell
  speed: 12
  stalk: 1
  undead: 1
  weight: 1200
bat:
  ac: 8
  alignment: 0
  animal: 1
  attacks:
    - damage: 1d4
      mode: bite
      type: physical
  carnivore: 1
  color: brown
  corpse: {}
  fly: 1
  geno: 1
  glyph: B
  hitdice: 0
  infravisible: 1
  mr: 0
  name: bat
  nohands: 1
  nutrition: 20
  rarity: 1
  resist: {}
  sgroup: 1
  size: tiny
  sound: sqeek
  speed: 22
  wander: 1
  weight: 20
black dragon:
  ac: -1
  alignment: -6
  attacks:
    - damage: 4d10
      mode: breathe
      type: disintegration
    - damage: 3d8
      mode: bite
      type: physical
    - damage: 1d4
      mode: claw
      type: physical
    - damage: 1d4
      mode: claw
      type: physical
  carnivore: 1
  color: black
  corpse:
    disint: 1
  fly: 1
  geno: 1
  glyph: D
  greedy: 1
  hitdice: 15
  hostile: 1
  jewels: 1
  magic: 1
  mr: 20
  name: black dragon
  nasty: 1
  nohands: 1
  nutrition: 1500
  oviparous: 1
  rarity: 1
  resist:
    disint: 1
  see_invis: 1
  size: gigantic
  sound: roar
  speed: 9
  strong: 1
  thick_hide: 1
  weight: 4500
black light:
  ac: 0
  alignment: 0
  amorphous: 1
  attacks:
    - damage: 10d12
      mode: explode
      type: hallucination
  breathless: 1
  color: black
  corpse: {}
  fly: 1
  geno: 1
  glyph: y
  hitdice: 5
  hostile: 1
  mindless: 1
  mr: 0
  name: black light
  neuter: 1
  nocorpse: 1
  noeyes: 1
  nohead: 1
  nolimbs: 1
  notake: 1
  nutrition: 0
  rarity: 2
  resist:
    acid: 1
    cold: 1
    disint: 1
    elec: 1
    fire: 1
    poison: 1
    sleep: 1
    stone: 1
  see_invis: 1
  size: small
  sound: silent
  speed: 15
  unsolid: 1
  weight: 0
black naga:
  ac: 2
  acid: 1
  alignment: 4
  attacks:
    - damage: 2d6
      mode: bite
      type: physical
    - damage: 0d0
      mode: spit
      type: acid
  carnivore: 1
  color: black
  corpse:
    poison: 1
    stone: 1
  geno: 1
  glyph: N
  hitdice: 8
  mr: 10
  name: black naga
  nolimbs: 1
  notake: 1
  nutrition: 400
  oviparous: 1
  rarity: 1
  resist:
    acid: 1
    poison: 1
    stone: 1
  size: huge
  slithy: 1
  sound: mumble
  speed: 14
  strong: 1
  thick_hide: 1
  weight: 2600
black naga hatchling:
  ac: 6
  acid: 1
  alignment: 0
  attacks:
    - damage: 1d4
      mode: bite
      type: physical
  carnivore: 1
  color: black
  corpse:
    poison: 1
    stone: 1
  geno: 1
  glyph: N
  hitdice: 3
  mr: 0
  name: black naga hatchling
  nolimbs: 1
  notake: 1
  nutrition: 100
  resist:
    acid: 1
    poison: 1
    stone: 1
  size: large
  slithy: 1
  sound: mumble
  speed: 10
  strong: 1
  thick_hide: 1
  weight: 500
black pudding:
  ac: 6
  acid: 1
  alignment: 0
  amorphous: 1
  attacks:
    - damage: 3d8
      mode: bite
      type: corrode
    - damage: 0d0
      mode: passive
      type: corrode
  breathless: 1
  color: black
  corpse:
    cold: 1
    elec: 1
    poison: 1
  geno: 1
  glyph: P
  hitdice: 10
  hostile: 1
  mindless: 1
  mr: 0
  name: black pudding
  neuter: 1
  noeyes: 1
  nohead: 1
  nolimbs: 1
  nutrition: 250
  omnivore: 1
  rarity: 1
  resist:
    acid: 1
    cold: 1
    elec: 1
    poison: 1
    stone: 1
  size: large
  sound: silent
  speed: 6
  weight: 900
black unicorn:
  ac: 2
  alignment: -7
  attacks:
    - damage: 1d12
      mode: headbutt
      type: physical
    - damage: 1d6
      mode: kick
      type: physical
  color: black
  corpse:
    poison: 1
  geno: 1
  glyph: u
  herbivore: 1
  hitdice: 4
  infravisible: 1
  jewels: 1
  mr: 70
  name: black unicorn
  nohands: 1
  nutrition: 300
  rarity: 1
  resist:
    poison: 1
  size: large
  sound: neigh
  speed: 24
  strong: 1
  wander: 1
  weight: 1300
blue dragon:
  ac: -1
  alignment: -7
  attacks:
    - damage: 4d6
      mode: breathe
      type: electricity
    - damage: 3d8
      mode: bite
      type: physical
    - damage: 1d4
      mode: claw
      type: physical
    - damage: 1d4
      mode: claw
      type: physical
  carnivore: 1
  color: blue
  corpse:
    elec: 1
  fly: 1
  geno: 1
  glyph: D
  greedy: 1
  hitdice: 15
  hostile: 1
  jewels: 1
  magic: 1
  mr: 20
  name: blue dragon
  nasty: 1
  nohands: 1
  nutrition: 1500
  oviparous: 1
  rarity: 1
  resist:
    elec: 1
  see_invis: 1
  size: gigantic
  sound: roar
  speed: 9
  strong: 1
  thick_hide: 1
  weight: 4500
blue jelly:
  ac: 8
  alignment: 0
  amorphous: 1
  attacks:
    - damage: 0d6
      mode: passive
      type: cold
  breathless: 1
  color: blue
  corpse:
    cold: 1
    poison: 1
  geno: 1
  glyph: j
  hitdice: 4
  hostile: 1
  mindless: 1
  mr: 10
  name: blue jelly
  neuter: 1
  noeyes: 1
  nohead: 1
  nolimbs: 1
  notake: 1
  nutrition: 20
  rarity: 2
  resist:
    cold: 1
    poison: 1
  size: medium
  sound: silent
  speed: 0
  weight: 50
bone devil:
  ac: -1
  alignment: -9
  attacks:
    - damage: 3d4
      mode: weapon
      type: physical
    - damage: 2d4
      mode: sting
      type: poison
  collect: 1
  color: gray
  corpse: {}
  demon: 1
  glyph: '&'
  hell: 1
  hitdice: 9
  hostile: 1
  infravisible: 1
  infravision: 1
  mr: 40
  name: bone devil
  nasty: 1
  nocorpse: 1
  nutrition: 400
  pois: 1
  rarity: 2
  resist:
    fire: 1
    poison: 1
  sgroup: 1
  size: large
  sound: silent
  speed: 15
  stalk: 1
  weight: 1450
brown mold:
  ac: 9
  alignment: 0
  attacks:
    - damage: 0d6
      mode: passive
      type: cold
  breathless: 1
  color: brown
  corpse:
    cold: 1
    poison: 1
  geno: 1
  glyph: F
  hitdice: 1
  hostile: 1
  mindless: 1
  mr: 0
  name: brown mold
  neuter: 1
  noeyes: 1
  nohead: 1
  nolimbs: 1
  notake: 1
  nutrition: 30
  rarity: 1
  resist:
    cold: 1
    poison: 1
  size: small
  sound: silent
  speed: 0
  weight: 50
brown pudding:
  ac: 8
  acid: 1
  alignment: 0
  amorphous: 1
  attacks:
    - damage: 0d0
      mode: bite
      type: decay
  breathless: 1
  color: brown
  corpse:
    cold: 1
    elec: 1
    poison: 1
  geno: 1
  glyph: P
  hitdice: 5
  hostile: 1
  mindless: 1
  mr: 0
  name: brown pudding
  neuter: 1
  noeyes: 1
  nohead: 1
  nolimbs: 1
  nutrition: 250
  omnivore: 1
  rarity: 1
  resist:
    acid: 1
    cold: 1
    elec: 1
    poison: 1
    stone: 1
  size: medium
  sound: silent
  speed: 3
  weight: 500
bugbear:
  ac: 5
  alignment: -6
  attacks:
    - damage: 2d4
      mode: weapon
      type: physical
  collect: 1
  color: brown
  corpse: {}
  geno: 1
  glyph: h
  hitdice: 3
  humanoid: 1
  infravisible: 1
  infravision: 1
  mr: 0
  name: bugbear
  nutrition: 250
  omnivore: 1
  rarity: 1
  resist: {}
  size: large
  sound: growl
  speed: 9
  strong: 1
  weight: 1250
captain:
  ac: 10
  alignment: -5
  attacks:
    - damage: 4d4
      mode: weapon
      type: physical
    - damage: 4d4
      mode: weapon
      type: physical
  collect: 1
  color: blue
  corpse: {}
  geno: 1
  glyph: '@'
  hitdice: 12
  hostile: 1
  human: 1
  humanoid: 1
  infravisible: 1
  merc: 1
  mr: 15
  name: captain
  nopoly: 1
  nutrition: 400
  omnivore: 1
  rarity: 1
  resist: {}
  size: human
  sound: soldier
  speed: 10
  stalk: 1
  strong: 1
  weight: 1450
carnivorous ape:
  ac: 6
  alignment: 0
  animal: 1
  attacks:
    - damage: 1d4
      mode: claw
      type: physical
    - damage: 1d4
      mode: claw
      type: physical
    - damage: 1d8
      mode: crush
      type: physical
  carnivore: 1
  color: black
  corpse: {}
  geno: 1
  glyph: Y
  hitdice: 6
  hostile: 1
  humanoid: 1
  infravisible: 1
  mr: 0
  name: carnivorous ape
  nutrition: 550
  rarity: 1
  resist: {}
  size: large
  sound: growl
  speed: 12
  strong: 1
  weight: 1250
cave spider:
  ac: 3
  alignment: 0
  animal: 1
  attacks:
    - damage: 1d2
      mode: bite
      type: physical
  carnivore: 1
  color: gray
  conceal: 1
  corpse:
    poison: 1
  geno: 1
  glyph: s
  hitdice: 1
  hostile: 1
  mr: 0
  name: cave spider
  nohands: 1
  nutrition: 50
  oviparous: 1
  rarity: 2
  resist:
    poison: 1
  sgroup: 1
  size: tiny
  sound: silent
  speed: 12
  weight: 50
caveman:
  ac: 10
  alignment: 1
  attacks:
    - damage: 2d4
      mode: weapon
      type: physical
  collect: 1
  color: white
  corpse: {}
  glyph: '@'
  hitdice: 10
  human: 1
  humanoid: 1
  infravisible: 1
  male: 1
  mr: 0
  name: caveman
  nogen: 1
  nopoly: 1
  nutrition: 400
  omnivore: 1
  resist: {}
  size: human
  sound: humanoid
  speed: 12
  strong: 1
  weight: 1450
cavewoman:
  ac: 10
  alignment: 1
  attacks:
    - damage: 2d4
      mode: weapon
      type: physical
  collect: 1
  color: white
  corpse: {}
  female: 1
  glyph: '@'
  hitdice: 10
  human: 1
  humanoid: 1
  infravisible: 1
  mr: 0
  name: cavewoman
  nogen: 1
  nopoly: 1
  nutrition: 400
  omnivore: 1
  resist: {}
  size: human
  sound: humanoid
  speed: 12
  strong: 1
  weight: 1450
centipede:
  ac: 3
  alignment: 0
  animal: 1
  attacks:
    - damage: 1d3
      mode: bite
      type: poison
  carnivore: 1
  color: yellow
  conceal: 1
  corpse:
    poison: 1
  geno: 1
  glyph: s
  hitdice: 2
  hostile: 1
  mr: 0
  name: centipede
  nohands: 1
  nutrition: 50
  oviparous: 1
  rarity: 1
  resist:
    poison: 1
  size: tiny
  sound: silent
  speed: 4
  weight: 50
chameleon:
  ac: 6
  alignment: 0
  animal: 1
  attacks:
    - damage: 4d2
      mode: bite
      type: physical
  carnivore: 1
  color: brown
  corpse: {}
  geno: 1
  glyph: ':'
  hitdice: 6
  hostile: 1
  mr: 10
  name: chameleon
  nohands: 1
  nopoly: 1
  nutrition: 100
  rarity: 2
  resist: {}
  size: tiny
  sound: silent
  speed: 5
  weight: 100
chickatrice:
  ac: 8
  alignment: 0
  animal: 1
  attacks:
    - damage: 1d2
      mode: bite
      type: physical
    - damage: 0d0
      mode: touch
      type: petrify
    - damage: 0d0
      mode: passive
      type: petrify
  color: brown
  corpse:
    poison: 1
    stone: 1
  geno: 1
  glyph: c
  hitdice: 4
  hostile: 1
  infravisible: 1
  mr: 30
  name: chickatrice
  nohands: 1
  nutrition: 10
  omnivore: 1
  rarity: 1
  resist:
    poison: 1
    stone: 1
  sgroup: 1
  size: tiny
  sound: hiss
  speed: 4
  weight: 10
chieftain:
  ac: 10
  alignment: 0
  attacks:
    - damage: 1d6
      mode: weapon
      type: physical
  collect: 1
  color: white
  corpse: {}
  glyph: '@'
  hitdice: 5
  human: 1
  humanoid: 1
  infravisible: 1
  mr: 10
  name: chieftain
  nogen: 1
  nopoly: 1
  nutrition: 400
  omnivore: 1
  peaceful: 1
  resist:
    poison: 1
  size: human
  sound: guardian
  speed: 12
  strong: 1
  weight: 1450
clay golem:
  ac: 7
  alignment: 0
  attacks:
    - damage: 3d10
      mode: claw
      type: physical
  breathless: 1
  color: brown
  corpse: {}
  glyph: "'"
  hitdice: 11
  hostile: 1
  humanoid: 1
  mindless: 1
  mr: 40
  name: clay golem
  nocorpse: 1
  nutrition: 0
  rarity: 1
  resist:
    poison: 1
    sleep: 1
  size: large
  sound: silent
  speed: 7
  strong: 1
  thick_hide: 1
  weight: 1550
cobra:
  ac: 2
  alignment: 0
  animal: 1
  attacks:
    - damage: 2d4
      mode: bite
      type: poison
    - damage: 0d0
      mode: spit
      type: blind
  carnivore: 1
  color: blue
  conceal: 1
  corpse:
    poison: 1
  geno: 1
  glyph: S
  hitdice: 6
  hostile: 1
  mr: 0
  name: cobra
  nolimbs: 1
  notake: 1
  nutrition: 100
  oviparous: 1
  pois: 1
  rarity: 1
  resist:
    poison: 1
  size: medium
  slithy: 1
  sound: hiss
  speed: 18
  swim: 1
  weight: 250
cockatrice:
  ac: 6
  alignment: 0
  animal: 1
  attacks:
    - damage: 1d3
      mode: bite
      type: physical
    - damage: 0d0
      mode: touch
      type: petrify
    - damage: 0d0
      mode: passive
      type: petrify
  color: yellow
  corpse:
    poison: 1
    stone: 1
  geno: 1
  glyph: c
  hitdice: 5
  hostile: 1
  infravisible: 1
  mr: 30
  name: cockatrice
  nohands: 1
  nutrition: 30
  omnivore: 1
  oviparous: 1
  rarity: 5
  resist:
    poison: 1
    stone: 1
  size: small
  sound: hiss
  speed: 6
  weight: 30
couatl:
  ac: 5
  alignment: 7
  attacks:
    - damage: 2d4
      mode: bite
      type: poison
    - damage: 1d3
      mode: bite
      type: physical
    - damage: 2d4
      mode: crush
      type: wrap
  color: green
  corpse: {}
  fly: 1
  glyph: A
  hitdice: 8
  infravisible: 1
  infravision: 1
  minion: 1
  mr: 30
  name: couatl
  nasty: 1
  nocorpse: 1
  nohell: 1
  nutrition: 400
  pois: 1
  rarity: 1
  resist:
    poison: 1
  sgroup: 1
  size: large
  sound: hiss
  speed: 10
  stalk: 1
  strong: 1
  weight: 900
coyote:
  ac: 7
  alignment: 0
  animal: 1
  attacks:
    - damage: 1d4
      mode: bite
      type: physical
  carnivore: 1
  color: brown
  corpse: {}
  geno: 1
  glyph: d
  hitdice: 1
  hostile: 1
  infravisible: 1
  mr: 0
  name: coyote
  nohands: 1
  nutrition: 250
  rarity: 1
  resist: {}
  sgroup: 1
  size: small
  sound: bark
  speed: 12
  weight: 300
crocodile:
  ac: 5
  alignment: 0
  amphibious: 1
  animal: 1
  attacks:
    - damage: 4d2
      mode: bite
      type: physical
    - damage: 1d12
      mode: claw
      type: physical
  carnivore: 1
  color: brown
  corpse: {}
  geno: 1
  glyph: ':'
  hitdice: 6
  hostile: 1
  mr: 0
  name: crocodile
  nohands: 1
  nutrition: 400
  oviparous: 1
  rarity: 1
  resist: {}
  size: large
  sound: silent
  speed: 9
  strong: 1
  swim: 1
  thick_hide: 1
  weight: 1450
demilich:
  ac: -2
  alignment: -12
  attacks:
    - damage: 3d4
      mode: touch
      type: cold
    - damage: 0d0
      mode: magic
      type: wizardspell
  breathless: 1
  color: red
  corpse:
    cold: 1
  geno: 1
  glyph: L
  hitdice: 14
  hostile: 1
  humanoid: 1
  infravision: 1
  magic: 1
  mr: 60
  name: demilich
  nocorpse: 1
  nutrition: 100
  pois: 1
  rarity: 1
  regen: 1
  resist:
    cold: 1
    poison: 1
    sleep: 1
  size: human
  sound: mumble
  speed: 9
  undead: 1
  weight: 1200
dingo:
  ac: 5
  alignment: 0
  animal: 1
  attacks:
    - damage: 1d6
      mode: bite
      type: physical
  carnivore: 1
  color: yellow
  corpse: {}
  geno: 1
  glyph: d
  hitdice: 4
  hostile: 1
  infravisible: 1
  mr: 0
  name: dingo
  nohands: 1
  nutrition: 200
  rarity: 1
  resist: {}
  size: medium
  sound: bark
  speed: 16
  weight: 400
disenchanter:
  ac: -10
  alignment: -3
  animal: 1
  attacks:
    - damage: 4d4
      mode: claw
      type: disenchant
    - damage: 0d0
      mode: passive
      type: disenchant
  carnivore: 1
  color: blue
  corpse: {}
  geno: 1
  glyph: R
  hell: 1
  hitdice: 12
  hostile: 1
  infravisible: 1
  mr: 0
  name: disenchanter
  nutrition: 200
  rarity: 2
  resist: {}
  size: large
  sound: growl
  speed: 12
  weight: 750
djinni:
  ac: 4
  alignment: 0
  attacks:
    - damage: 2d8
      mode: weapon
      type: physical
  collect: 1
  color: yellow
  corpse: {}
  fly: 1
  glyph: '&'
  hitdice: 7
  humanoid: 1
  infravisible: 1
  mr: 30
  name: djinni
  nocorpse: 1
  nogen: 1
  nopoly: 1
  nutrition: 400
  pois: 1
  resist:
    poison: 1
    stone: 1
  size: human
  sound: djinni
  speed: 12
  stalk: 1
  weight: 1500
dog:
  ac: 5
  alignment: 0
  animal: 1
  attacks:
    - damage: 1d6
      mode: bite
      type: physical
  carnivore: 1
  color: white
  corpse: {}
  domestic: 1
  geno: 1
  glyph: d
  hitdice: 4
  infravisible: 1
  mr: 0
  name: dog
  nohands: 1
  nutrition: 200
  rarity: 1
  resist: {}
  size: medium
  sound: bark
  speed: 16
  weight: 400
doppelganger:
  ac: 5
  alignment: 0
  attacks:
    - damage: 1d12
      mode: weapon
      type: physical
  collect: 1
  color: white
  corpse: {}
  geno: 1
  glyph: '@'
  hitdice: 9
  hostile: 1
  human: 1
  humanoid: 1
  infravisible: 1
  mr: 20
  name: doppelganger
  nopoly: 1
  nutrition: 400
  omnivore: 1
  rarity: 1
  resist:
    sleep: 1
  size: human
  sound: imitate
  speed: 12
  strong: 1
  weight: 1450
dust vortex:
  ac: 2
  alignment: 0
  attacks:
    - damage: 2d8
      mode: engulf
      type: blind
  breathless: 1
  color: brown
  corpse: {}
  fly: 1
  geno: 1
  glyph: v
  hitdice: 4
  hostile: 1
  mindless: 1
  mr: 30
  name: dust vortex
  neuter: 1
  nocorpse: 1
  noeyes: 1
  nohead: 1
  nolimbs: 1
  nutrition: 0
  rarity: 2
  resist:
    poison: 1
    sleep: 1
    stone: 1
  size: huge
  sound: silent
  speed: 20
  weight: 0
dwarf:
  ac: 10
  alignment: 4
  attacks:
    - damage: 1d8
      mode: weapon
      type: physical
  collect: 1
  color: red
  corpse: {}
  dwarf: 1
  geno: 1
  glyph: h
  greedy: 1
  hitdice: 2
  humanoid: 1
  infravisible: 1
  infravision: 1
  jewels: 1
  mr: 10
  name: dwarf
  needpick: 1
  nopoly: 1
  nutrition: 300
  omnivore: 1
  rarity: 3
  resist: {}
  size: human
  sound: humanoid
  speed: 6
  strong: 1
  tunnel: 1
  weight: 900
dwarf king:
  ac: 10
  alignment: 6
  attacks:
    - damage: 2d6
      mode: weapon
      type: physical
    - damage: 2d6
      mode: weapon
      type: physical
  collect: 1
  color: magenta
  corpse: {}
  dwarf: 1
  geno: 1
  glyph: h
  greedy: 1
  hitdice: 6
  humanoid: 1
  infravisible: 1
  infravision: 1
  jewels: 1
  male: 1
  mr: 20
  name: dwarf king
  needpick: 1
  nutrition: 300
  omnivore: 1
  prince: 1
  rarity: 1
  resist: {}
  size: human
  sound: humanoid
  speed: 6
  strong: 1
  tunnel: 1
  weight: 900
dwarf lord:
  ac: 10
  alignment: 5
  attacks:
    - damage: 2d4
      mode: weapon
      type: physical
    - damage: 2d4
      mode: weapon
      type: physical
  collect: 1
  color: blue
  corpse: {}
  dwarf: 1
  geno: 1
  glyph: h
  greedy: 1
  hitdice: 4
  humanoid: 1
  infravisible: 1
  infravision: 1
  jewels: 1
  lord: 1
  male: 1
  mr: 10
  name: dwarf lord
  needpick: 1
  nutrition: 300
  omnivore: 1
  rarity: 2
  resist: {}
  size: human
  sound: humanoid
  speed: 6
  strong: 1
  tunnel: 1
  weight: 900
dwarf mummy:
  ac: 5
  alignment: -4
  attacks:
    - damage: 1d6
      mode: claw
      type: physical
  breathless: 1
  color: red
  corpse: {}
  dwarf: 1
  geno: 1
  glyph: M
  greedy: 1
  hitdice: 5
  hostile: 1
  humanoid: 1
  infravision: 1
  jewels: 1
  mindless: 1
  mr: 20
  name: dwarf mummy
  nocorpse: 1
  nutrition: 150
  pois: 1
  rarity: 1
  resist:
    cold: 1
    poison: 1
    sleep: 1
  size: human
  sound: silent
  speed: 10
  undead: 1
  weight: 900
dwarf zombie:
  ac: 9
  alignment: -3
  attacks:
    - damage: 1d6
      mode: claw
      type: physical
  breathless: 1
  color: red
  corpse: {}
  dwarf: 1
  geno: 1
  glyph: Z
  hitdice: 2
  hostile: 1
  humanoid: 1
  infravision: 1
  mindless: 1
  mr: 0
  name: dwarf zombie
  nocorpse: 1
  nutrition: 150
  pois: 1
  rarity: 1
  resist:
    cold: 1
    poison: 1
    sleep: 1
  sgroup: 1
  size: human
  sound: silent
  speed: 6
  stalk: 1
  undead: 1
  weight: 900
earth elemental:
  ac: 2
  alignment: 0
  attacks:
    - damage: 4d6
      mode: claw
      type: physical
  breathless: 1
  color: brown
  corpse: {}
  glyph: E
  hitdice: 8
  mindless: 1
  mr: 30
  name: earth elemental
  neuter: 1
  nocorpse: 1
  noeyes: 1
  nohead: 1
  nolimbs: 1
  nutrition: 0
  rarity: 1
  resist:
    cold: 1
    fire: 1
    poison: 1
    stone: 1
  size: huge
  sound: silent
  speed: 6
  strong: 1
  thick_hide: 1
  wallwalk: 1
  weight: 2500
electric eel:
  ac: -3
  alignment: 0
  amphibious: 1
  animal: 1
  attacks:
    - damage: 4d6
      mode: bite
      type: electricity
    - damage: 0d0
      mode: touch
      type: wrap
  carnivore: 1
  color: bright_blue
  corpse:
    elec: 1
  geno: 1
  glyph: ;
  hitdice: 7
  hostile: 1
  infravisible: 1
  mr: 0
  name: electric eel
  nogen: 1
  nolimbs: 1
  notake: 1
  nutrition: 250
  oviparous: 1
  resist:
    elec: 1
  size: huge
  slithy: 1
  sound: silent
  speed: 10
  swim: 1
  weight: 200
elf:
  ac: 10
  alignment: -3
  attacks:
    - damage: 1d8
      mode: weapon
      type: physical
  collect: 1
  color: white
  corpse:
    sleep: 1
  elf: 1
  glyph: '@'
  hitdice: 10
  humanoid: 1
  infravisible: 1
  infravision: 1
  mr: 2
  name: elf
  nogen: 1
  nopoly: 1
  nutrition: 350
  omnivore: 1
  resist:
    sleep: 1
  see_invis: 1
  size: human
  sound: humanoid
  speed: 12
  strong: 1
  weight: 800
elf mummy:
  ac: 4
  alignment: -5
  attacks:
    - damage: 2d4
      mode: claw
      type: physical
  breathless: 1
  color: green
  corpse: {}
  elf: 1
  geno: 1
  glyph: M
  hitdice: 6
  hostile: 1
  humanoid: 1
  infravision: 1
  mindless: 1
  mr: 30
  name: elf mummy
  nocorpse: 1
  nutrition: 175
  pois: 1
  rarity: 1
  resist:
    cold: 1
    poison: 1
    sleep: 1
  size: human
  sound: silent
  speed: 12
  undead: 1
  weight: 800
elf zombie:
  ac: 9
  alignment: -3
  attacks:
    - damage: 1d7
      mode: claw
      type: physical
  breathless: 1
  color: green
  corpse: {}
  elf: 1
  geno: 1
  glyph: Z
  hitdice: 3
  hostile: 1
  humanoid: 1
  infravision: 1
  mindless: 1
  mr: 0
  name: elf zombie
  nocorpse: 1
  nutrition: 175
  rarity: 1
  resist:
    cold: 1
    poison: 1
    sleep: 1
  sgroup: 1
  size: human
  sound: silent
  speed: 6
  stalk: 1
  undead: 1
  weight: 800
elf-lord:
  ac: 10
  alignment: -9
  attacks:
    - damage: 2d4
      mode: weapon
      type: physical
    - damage: 2d4
      mode: weapon
      type: physical
  collect: 1
  color: bright_blue
  corpse:
    sleep: 1
  elf: 1
  geno: 1
  glyph: '@'
  hitdice: 8
  humanoid: 1
  infravisible: 1
  infravision: 1
  lord: 1
  male: 1
  mr: 20
  name: elf-lord
  nutrition: 350
  omnivore: 1
  rarity: 2
  resist:
    sleep: 1
  see_invis: 1
  sgroup: 1
  size: human
  sound: humanoid
  speed: 12
  strong: 1
  weight: 800
energy vortex:
  ac: 2
  alignment: 0
  attacks:
    - damage: 1d6
      mode: engulf
      type: electricity
    - damage: 0d0
      mode: engulf
      type: drainenergy
    - damage: 0d4
      mode: passive
      type: electricity
  breathless: 1
  color: bright_blue
  corpse: {}
  fly: 1
  geno: 1
  glyph: v
  hitdice: 6
  hostile: 1
  mindless: 1
  mr: 30
  name: energy vortex
  neuter: 1
  nocorpse: 1
  noeyes: 1
  nohead: 1
  nolimbs: 1
  nutrition: 0
  rarity: 1
  resist:
    disint: 1
    elec: 1
    poison: 1
    sleep: 1
    stone: 1
  size: huge
  sound: silent
  speed: 20
  unsolid: 1
  weight: 0
erinys:
  ac: 2
  alignment: 10
  attacks:
    - damage: 2d4
      mode: weapon
      type: poison
  collect: 1
  color: red
  corpse: {}
  demon: 1
  female: 1
  glyph: '&'
  hell: 1
  hitdice: 7
  hostile: 1
  humanoid: 1
  infravisible: 1
  infravision: 1
  mr: 30
  name: erinys
  nasty: 1
  nocorpse: 1
  nopoly: 1
  nutrition: 400
  pois: 1
  rarity: 2
  resist:
    fire: 1
    poison: 1
  sgroup: 1
  size: human
  sound: silent
  speed: 12
  stalk: 1
  strong: 1
  weight: 1450
ettin:
  ac: 3
  alignment: 0
  animal: 1
  attacks:
    - damage: 2d8
      mode: weapon
      type: physical
    - damage: 3d6
      mode: weapon
      type: physical
  carnivore: 1
  collect: 1
  color: brown
  corpse: {}
  geno: 1
  glyph: H
  hitdice: 10
  hostile: 1
  humanoid: 1
  infravisible: 1
  infravision: 1
  mr: 0
  name: ettin
  nasty: 1
  nutrition: 500
  rarity: 1
  resist: {}
  size: huge
  sound: grunt
  speed: 12
  strong: 1
  weight: 1700
ettin mummy:
  ac: 4
  alignment: -6
  attacks:
    - damage: 2d6
      mode: claw
      type: physical
    - damage: 2d6
      mode: claw
      type: physical
  breathless: 1
  color: blue
  corpse: {}
  geno: 1
  glyph: M
  hitdice: 7
  hostile: 1
  humanoid: 1
  infravision: 1
  mindless: 1
  mr: 30
  name: ettin mummy
  nocorpse: 1
  nutrition: 250
  pois: 1
  rarity: 1
  resist:
    cold: 1
    poison: 1
    sleep: 1
  size: huge
  sound: silent
  speed: 12
  strong: 1
  undead: 1
  weight: 1700
ettin zombie:
  ac: 6
  alignment: -4
  attacks:
    - damage: 1d10
      mode: claw
      type: physical
    - damage: 1d10
      mode: claw
      type: physical
  breathless: 1
  color: blue
  corpse: {}
  geno: 1
  glyph: Z
  hitdice: 6
  hostile: 1
  humanoid: 1
  infravision: 1
  mindless: 1
  mr: 0
  name: ettin zombie
  nocorpse: 1
  nutrition: 250
  rarity: 1
  resist:
    cold: 1
    poison: 1
    sleep: 1
  size: huge
  sound: silent
  speed: 8
  stalk: 1
  strong: 1
  undead: 1
  weight: 1700
fire ant:
  ac: 3
  alignment: 0
  animal: 1
  attacks:
    - damage: 2d4
      mode: bite
      type: physical
    - damage: 2d4
      mode: bite
      type: fire
  carnivore: 1
  color: red
  corpse:
    fire: 1
  geno: 1
  glyph: a
  hitdice: 3
  hostile: 1
  infravisible: 1
  mr: 10
  name: fire ant
  nohands: 1
  nutrition: 10
  oviparous: 1
  rarity: 1
  resist:
    fire: 1
  sgroup: 1
  size: tiny
  sound: silent
  speed: 18
  weight: 30
fire elemental:
  ac: 2
  alignment: 0
  attacks:
    - damage: 3d6
      mode: claw
      type: fire
    - damage: 0d4
      mode: passive
      type: fire
  color: yellow
  corpse: {}
  fly: 1
  glyph: E
  hitdice: 8
  infravisible: 1
  mindless: 1
  mr: 30
  name: fire elemental
  neuter: 1
  nocorpse: 1
  noeyes: 1
  nohead: 1
  nolimbs: 1
  notake: 1
  nutrition: 0
  rarity: 1
  resist:
    fire: 1
    poison: 1
    stone: 1
  size: huge
  sound: silent
  speed: 12
  strong: 1
  unsolid: 1
  weight: 0
fire giant:
  ac: 4
  alignment: 2
  attacks:
    - damage: 2d10
      mode: weapon
      type: physical
  carnivore: 1
  collect: 1
  color: yellow
  corpse:
    fire: 1
  geno: 1
  giant: 1
  glyph: H
  hitdice: 9
  humanoid: 1
  infravisible: 1
  infravision: 1
  jewels: 1
  mr: 5
  name: fire giant
  nasty: 1
  nutrition: 750
  rarity: 1
  resist:
    fire: 1
  rockthrow: 1
  sgroup: 1
  size: huge
  sound: boast
  speed: 12
  strong: 1
  weight: 2250
fire vortex:
  ac: 2
  alignment: 0
  attacks:
    - damage: 1d10
      mode: engulf
      type: fire
    - damage: 0d4
      mode: passive
      type: fire
  breathless: 1
  color: yellow
  corpse: {}
  fly: 1
  geno: 1
  glyph: v
  hell: 1
  hitdice: 8
  hostile: 1
  infravisible: 1
  mindless: 1
  mr: 30
  name: fire vortex
  neuter: 1
  nocorpse: 1
  noeyes: 1
  nohead: 1
  nolimbs: 1
  nutrition: 0
  rarity: 1
  resist:
    fire: 1
    poison: 1
    sleep: 1
    stone: 1
  size: huge
  sound: silent
  speed: 22
  unsolid: 1
  weight: 0
flaming sphere:
  ac: 4
  alignment: 0
  attacks:
    - damage: 4d6
      mode: explode
      type: fire
  breathless: 1
  color: red
  corpse:
    fire: 1
  fly: 1
  geno: 1
  glyph: e
  hitdice: 6
  hostile: 1
  infravisible: 1
  mindless: 1
  mr: 0
  name: flaming sphere
  neuter: 1
  nocorpse: 1
  nohead: 1
  nolimbs: 1
  nutrition: 10
  rarity: 2
  resist:
    fire: 1
  size: small
  sound: silent
  speed: 13
  weight: 10
flesh golem:
  ac: 9
  alignment: 0
  attacks:
    - damage: 2d8
      mode: claw
      type: physical
    - damage: 2d8
      mode: claw
      type: physical
  breathless: 1
  color: red
  corpse:
    cold: 1
    elec: 1
    fire: 1
    poison: 1
    sleep: 1
  glyph: "'"
  hitdice: 9
  hostile: 1
  humanoid: 1
  mindless: 1
  mr: 30
  name: flesh golem
  nutrition: 600
  rarity: 1
  resist:
    cold: 1
    elec: 1
    fire: 1
    poison: 1
    sleep: 1
  size: large
  sound: silent
  speed: 8
  strong: 1
  weight: 1400
floating eye:
  ac: 9
  alignment: 0
  amphibious: 1
  attacks:
    - damage: 0d70
      mode: passive
      type: paralyze
  color: blue
  corpse: {}
  fly: 1
  geno: 1
  glyph: e
  hitdice: 2
  hostile: 1
  infravisible: 1
  mr: 10
  name: floating eye
  neuter: 1
  nohead: 1
  nolimbs: 1
  notake: 1
  nutrition: 10
  rarity: 5
  resist: {}
  size: small
  sound: silent
  speed: 1
  weight: 10
fog cloud:
  ac: 0
  alignment: 0
  amorphous: 1
  attacks:
    - damage: 1d6
      mode: engulf
      type: physical
  breathless: 1
  color: gray
  corpse: {}
  fly: 1
  geno: 1
  glyph: v
  hitdice: 3
  hostile: 1
  mindless: 1
  mr: 0
  name: fog cloud
  neuter: 1
  nocorpse: 1
  noeyes: 1
  nohead: 1
  nolimbs: 1
  nutrition: 0
  rarity: 2
  resist:
    poison: 1
    sleep: 1
    stone: 1
  size: huge
  sound: silent
  speed: 1
  unsolid: 1
  weight: 0
forest centaur:
  ac: 3
  alignment: -1
  attacks:
    - damage: 1d8
      mode: weapon
      type: physical
    - damage: 1d6
      mode: kick
      type: physical
  collect: 1
  color: green
  corpse: {}
  geno: 1
  glyph: C
  greedy: 1
  hitdice: 5
  humanoid: 1
  infravisible: 1
  mr: 10
  name: forest centaur
  nutrition: 600
  omnivore: 1
  rarity: 1
  resist: {}
  size: large
  sound: humanoid
  speed: 18
  strong: 1
  weight: 2550
fox:
  ac: 7
  alignment: 0
  animal: 1
  attacks:
    - damage: 1d3
      mode: bite
      type: physical
  carnivore: 1
  color: red
  corpse: {}
  geno: 1
  glyph: d
  hitdice: 0
  hostile: 1
  infravisible: 1
  mr: 0
  name: fox
  nohands: 1
  nutrition: 250
  rarity: 1
  resist: {}
  size: small
  sound: bark
  speed: 15
  weight: 300
freezing sphere:
  ac: 4
  alignment: 0
  attacks:
    - damage: 4d6
      mode: explode
      type: cold
  breathless: 1
  color: white
  corpse:
    cold: 1
  fly: 1
  geno: 1
  glyph: e
  hitdice: 6
  hostile: 1
  infravisible: 1
  mindless: 1
  mr: 0
  name: freezing sphere
  neuter: 1
  nocorpse: 1
  nohead: 1
  nohell: 1
  nolimbs: 1
  notake: 1
  nutrition: 10
  rarity: 2
  resist:
    cold: 1
  size: small
  sound: silent
  speed: 13
  weight: 10
frost giant:
  ac: 3
  alignment: -3
  attacks:
    - damage: 2d12
      mode: weapon
      type: physical
  carnivore: 1
  collect: 1
  color: white
  corpse:
    cold: 1
  geno: 1
  giant: 1
  glyph: H
  hitdice: 10
  humanoid: 1
  infravisible: 1
  infravision: 1
  jewels: 1
  mr: 10
  name: frost giant
  nasty: 1
  nohell: 1
  nutrition: 750
  rarity: 1
  resist:
    cold: 1
  rockthrow: 1
  sgroup: 1
  size: huge
  sound: boast
  speed: 12
  strong: 1
  weight: 2250
gargoyle:
  ac: -4
  alignment: -9
  attacks:
    - damage: 2d6
      mode: claw
      type: physical
    - damage: 2d6
      mode: claw
      type: physical
    - damage: 2d4
      mode: bite
      type: physical
  breathless: 1
  color: brown
  corpse:
    stone: 1
  geno: 1
  glyph: g
  hitdice: 6
  hostile: 1
  humanoid: 1
  mr: 0
  name: gargoyle
  nutrition: 200
  rarity: 2
  resist:
    stone: 1
  size: human
  sound: grunt
  speed: 10
  strong: 1
  thick_hide: 1
  weight: 1000
garter snake:
  ac: 8
  alignment: 0
  animal: 1
  attacks:
    - damage: 1d2
      mode: bite
      type: physical
  carnivore: 1
  color: green
  conceal: 1
  corpse: {}
  geno: 1
  glyph: S
  hitdice: 1
  lgroup: 1
  mr: 0
  name: garter snake
  nolimbs: 1
  notake: 1
  nutrition: 60
  oviparous: 1
  rarity: 1
  resist: {}
  size: tiny
  slithy: 1
  sound: hiss
  speed: 8
  swim: 1
  weight: 50
gas spore:
  ac: 10
  alignment: 0
  attacks:
    - damage: 4d6
      mode: boom
      type: physical
  breathless: 1
  color: gray
  corpse: {}
  fly: 1
  geno: 1
  glyph: e
  hitdice: 1
  hostile: 1
  mindless: 1
  mr: 0
  name: gas spore
  neuter: 1
  nocorpse: 1
  nohead: 1
  nolimbs: 1
  nutrition: 10
  rarity: 1
  resist: {}
  size: small
  sound: silent
  speed: 3
  weight: 10
gecko:
  ac: 8
  alignment: 0
  animal: 1
  attacks:
    - damage: 1d3
      mode: bite
      type: physical
  carnivore: 1
  color: green
  corpse: {}
  geno: 1
  glyph: ':'
  hitdice: 1
  hostile: 1
  mr: 0
  name: gecko
  nohands: 1
  nutrition: 20
  rarity: 5
  resist: {}
  size: tiny
  sound: sqeek
  speed: 6
  weight: 10
gelatinous cube:
  ac: 8
  acid: 1
  alignment: 0
  attacks:
    - damage: 2d4
      mode: touch
      type: paralyze
    - damage: 1d4
      mode: passive
      type: paralyze
  color: cyan
  corpse:
    cold: 1
    elec: 1
    fire: 1
    sleep: 1
  geno: 1
  glyph: b
  hitdice: 6
  hostile: 1
  mindless: 1
  mr: 0
  name: gelatinous cube
  neuter: 1
  noeyes: 1
  nohead: 1
  nolimbs: 1
  nutrition: 150
  omnivore: 1
  rarity: 2
  resist:
    acid: 1
    cold: 1
    elec: 1
    fire: 1
    poison: 1
    sleep: 1
    stone: 1
  size: large
  sound: silent
  speed: 6
  wander: 1
  weight: 600
ghost:
  ac: -5
  alignment: -5
  attacks:
    - damage: 1d1
      mode: touch
      type: physical
  breathless: 1
  color: gray
  corpse: {}
  fly: 1
  glyph: X
  hitdice: 10
  hostile: 1
  humanoid: 1
  infravision: 1
  mr: 50
  name: ghost
  nocorpse: 1
  nogen: 1
  nopoly: 1
  nutrition: 0
  resist:
    cold: 1
    disint: 1
    poison: 1
    sleep: 1
    stone: 1
  size: human
  sound: silent
  speed: 3
  stalk: 1
  undead: 1
  unsolid: 1
  wallwalk: 1
  weight: 1450
ghoul:
  ac: 10
  alignment: -2
  attacks:
    - damage: 1d2
      mode: claw
      type: paralyze
    - damage: 1d3
      mode: claw
      type: physical
  breathless: 1
  color: black
  corpse: {}
  geno: 1
  glyph: Z
  hitdice: 3
  hostile: 1
  humanoid: 1
  infravision: 1
  mindless: 1
  mr: 0
  name: ghoul
  nocorpse: 1
  nutrition: 50
  pois: 1
  rarity: 1
  resist:
    cold: 1
    poison: 1
    sleep: 1
  size: small
  sound: silent
  speed: 6
  undead: 1
  wander: 1
  weight: 400
giant:
  ac: 0
  alignment: 2
  attacks:
    - damage: 2d10
      mode: weapon
      type: physical
  carnivore: 1
  collect: 1
  color: red
  corpse: {}
  geno: 1
  giant: 1
  glyph: H
  hitdice: 6
  humanoid: 1
  infravisible: 1
  infravision: 1
  jewels: 1
  mr: 0
  name: giant
  nasty: 1
  nogen: 1
  nutrition: 750
  rarity: 1
  resist: {}
  rockthrow: 1
  size: huge
  sound: boast
  speed: 6
  strong: 1
  weight: 2250
giant ant:
  ac: 3
  alignment: 0
  animal: 1
  attacks:
    - damage: 1d4
      mode: bite
      type: physical
  carnivore: 1
  color: brown
  corpse: {}
  geno: 1
  glyph: a
  hitdice: 2
  hostile: 1
  mr: 0
  name: giant ant
  nohands: 1
  nutrition: 10
  oviparous: 1
  rarity: 3
  resist: {}
  sgroup: 1
  size: tiny
  sound: silent
  speed: 18
  weight: 10
giant bat:
  ac: 7
  alignment: 0
  animal: 1
  attacks:
    - damage: 1d6
      mode: bite
      type: physical
  carnivore: 1
  color: red
  corpse: {}
  fly: 1
  geno: 1
  glyph: B
  hitdice: 2
  hostile: 1
  infravisible: 1
  mr: 0
  name: giant bat
  nohands: 1
  nutrition: 30
  rarity: 2
  resist: {}
  size: small
  sound: sqeek
  speed: 22
  wander: 1
  weight: 30
giant beetle:
  ac: 4
  alignment: 0
  animal: 1
  attacks:
    - damage: 3d6
      mode: bite
      type: physical
  carnivore: 1
  color: black
  corpse:
    poison: 1
  geno: 1
  glyph: a
  hitdice: 5
  hostile: 1
  mr: 0
  name: giant beetle
  nohands: 1
  nutrition: 10
  pois: 1
  rarity: 3
  resist:
    poison: 1
  size: large
  sound: silent
  speed: 6
  weight: 10
giant eel:
  ac: -1
  alignment: 0
  amphibious: 1
  animal: 1
  attacks:
    - damage: 3d6
      mode: bite
      type: physical
    - damage: 0d0
      mode: touch
      type: wrap
  carnivore: 1
  color: cyan
  corpse: {}
  geno: 1
  glyph: ;
  hitdice: 5
  hostile: 1
  infravisible: 1
  mr: 0
  name: giant eel
  nogen: 1
  nolimbs: 1
  notake: 1
  nutrition: 250
  oviparous: 1
  resist: {}
  size: huge
  slithy: 1
  sound: silent
  speed: 9
  swim: 1
  weight: 200
giant mimic:
  ac: 7
  alignment: 0
  amorphous: 1
  animal: 1
  attacks:
    - damage: 3d6
      mode: claw
      type: stick
    - damage: 3d6
      mode: claw
      type: stick
  breathless: 1
  carnivore: 1
  cling: 1
  color: magenta
  corpse: {}
  geno: 1
  glyph: m
  hide: 1
  hitdice: 9
  hostile: 1
  mr: 20
  name: giant mimic
  noeyes: 1
  nohead: 1
  nolimbs: 1
  nutrition: 500
  rarity: 1
  resist:
    acid: 1
  size: large
  sound: silent
  speed: 3
  strong: 1
  thick_hide: 1
  weight: 800
giant mummy:
  ac: 3
  alignment: -7
  attacks:
    - damage: 3d4
      mode: claw
      type: physical
    - damage: 3d4
      mode: claw
      type: physical
  breathless: 1
  color: cyan
  corpse: {}
  geno: 1
  giant: 1
  glyph: M
  hitdice: 8
  hostile: 1
  humanoid: 1
  infravision: 1
  jewels: 1
  mindless: 1
  mr: 30
  name: giant mummy
  nocorpse: 1
  nutrition: 375
  pois: 1
  rarity: 1
  resist:
    cold: 1
    poison: 1
    sleep: 1
  size: huge
  sound: silent
  speed: 14
  strong: 1
  undead: 1
  weight: 2050
giant rat:
  ac: 7
  alignment: 0
  animal: 1
  attacks:
    - damage: 1d3
      mode: bite
      type: physical
  carnivore: 1
  color: brown
  corpse: {}
  geno: 1
  glyph: r
  hitdice: 1
  hostile: 1
  infravisible: 1
  mr: 0
  name: giant rat
  nohands: 1
  nutrition: 30
  rarity: 2
  resist: {}
  sgroup: 1
  size: tiny
  sound: sqeek
  speed: 10
  weight: 30
giant spider:
  ac: 4
  alignment: 0
  animal: 1
  attacks:
    - damage: 2d4
      mode: bite
      type: poison
  carnivore: 1
  color: magenta
  corpse:
    poison: 1
  geno: 1
  glyph: s
  hitdice: 5
  hostile: 1
  mr: 0
  name: giant spider
  nohands: 1
  nutrition: 100
  oviparous: 1
  pois: 1
  rarity: 1
  resist:
    poison: 1
  size: large
  sound: silent
  speed: 15
  strong: 1
  weight: 100
giant zombie:
  ac: 6
  alignment: -4
  attacks:
    - damage: 2d8
      mode: claw
      type: physical
    - damage: 2d8
      mode: claw
      type: physical
  breathless: 1
  color: cyan
  corpse: {}
  geno: 1
  giant: 1
  glyph: Z
  hitdice: 8
  hostile: 1
  humanoid: 1
  infravision: 1
  mindless: 1
  mr: 0
  name: giant zombie
  nocorpse: 1
  nutrition: 375
  rarity: 1
  resist:
    cold: 1
    poison: 1
    sleep: 1
  size: huge
  sound: silent
  speed: 8
  stalk: 1
  strong: 1
  undead: 1
  weight: 2050
glass golem:
  ac: 1
  alignment: 0
  attacks:
    - damage: 2d8
      mode: claw
      type: physical
    - damage: 2d8
      mode: claw
      type: physical
  breathless: 1
  color: cyan
  corpse: {}
  glyph: "'"
  hitdice: 16
  hostile: 1
  humanoid: 1
  mindless: 1
  mr: 50
  name: glass golem
  nocorpse: 1
  nutrition: 0
  rarity: 1
  resist:
    acid: 1
    poison: 1
    sleep: 1
  size: large
  sound: silent
  speed: 6
  strong: 1
  thick_hide: 1
  weight: 1800
glass piercer:
  ac: 0
  alignment: 0
  animal: 1
  attacks:
    - damage: 4d6
      mode: bite
      type: physical
  carnivore: 1
  cling: 1
  color: white
  corpse: {}
  geno: 1
  glyph: p
  hide: 1
  hitdice: 7
  hostile: 1
  mr: 0
  name: glass piercer
  noeyes: 1
  nolimbs: 1
  notake: 1
  nutrition: 300
  rarity: 1
  resist:
    acid: 1
  size: medium
  sound: silent
  speed: 1
  weight: 400
gnome:
  ac: 10
  alignment: 0
  attacks:
    - damage: 1d6
      mode: weapon
      type: physical
  collect: 1
  color: brown
  corpse: {}
  geno: 1
  glyph: G
  gnome: 1
  hitdice: 1
  humanoid: 1
  infravisible: 1
  infravision: 1
  mr: 4
  name: gnome
  nopoly: 1
  nutrition: 100
  omnivore: 1
  rarity: 1
  resist: {}
  sgroup: 1
  size: small
  sound: orc
  speed: 6
  weight: 650
gnome king:
  ac: 10
  alignment: 0
  attacks:
    - damage: 2d6
      mode: weapon
      type: physical
  collect: 1
  color: magenta
  corpse: {}
  geno: 1
  glyph: G
  gnome: 1
  hitdice: 5
  humanoid: 1
  infravisible: 1
  infravision: 1
  male: 1
  mr: 20
  name: gnome king
  nutrition: 150
  omnivore: 1
  prince: 1
  rarity: 1
  resist: {}
  size: small
  sound: orc
  speed: 10
  weight: 750
gnome lord:
  ac: 10
  alignment: 0
  attacks:
    - damage: 1d8
      mode: weapon
      type: physical
  collect: 1
  color: blue
  corpse: {}
  geno: 1
  glyph: G
  gnome: 1
  hitdice: 3
  humanoid: 1
  infravisible: 1
  infravision: 1
  lord: 1
  male: 1
  mr: 4
  name: gnome lord
  nutrition: 120
  omnivore: 1
  rarity: 2
  resist: {}
  size: small
  sound: orc
  speed: 8
  weight: 700
gnome mummy:
  ac: 6
  alignment: -3
  attacks:
    - damage: 1d6
      mode: claw
      type: physical
  breathless: 1
  color: red
  corpse: {}
  geno: 1
  glyph: M
  gnome: 1
  hitdice: 4
  hostile: 1
  humanoid: 1
  infravision: 1
  mindless: 1
  mr: 20
  name: gnome mummy
  nocorpse: 1
  nutrition: 50
  pois: 1
  rarity: 1
  resist:
    cold: 1
    poison: 1
    sleep: 1
  size: small
  sound: silent
  speed: 10
  undead: 1
  weight: 650
gnome zombie:
  ac: 10
  alignment: -2
  attacks:
    - damage: 1d5
      mode: claw
      type: physical
  breathless: 1
  color: brown
  corpse: {}
  geno: 1
  glyph: Z
  gnome: 1
  hitdice: 1
  hostile: 1
  humanoid: 1
  infravision: 1
  mindless: 1
  mr: 0
  name: gnome zombie
  nocorpse: 1
  nutrition: 50
  pois: 1
  rarity: 1
  resist:
    cold: 1
    poison: 1
    sleep: 1
  size: small
  sound: silent
  speed: 6
  stalk: 1
  undead: 1
  weight: 650
gnomish wizard:
  ac: 4
  alignment: 0
  attacks:
    - damage: 0d0
      mode: magic
      type: wizardspell
  color: bright_blue
  corpse: {}
  geno: 1
  glyph: G
  gnome: 1
  hitdice: 3
  humanoid: 1
  infravisible: 1
  infravision: 1
  magic: 1
  mr: 10
  name: gnomish wizard
  nutrition: 120
  omnivore: 1
  rarity: 1
  resist: {}
  size: small
  sound: orc
  speed: 10
  weight: 700
goblin:
  ac: 10
  alignment: -3
  attacks:
    - damage: 1d4
      mode: weapon
      type: physical
  collect: 1
  color: gray
  corpse: {}
  geno: 1
  glyph: o
  hitdice: 0
  humanoid: 1
  infravisible: 1
  infravision: 1
  mr: 0
  name: goblin
  nutrition: 100
  omnivore: 1
  orc: 1
  rarity: 2
  resist: {}
  size: small
  sound: orc
  speed: 6
  weight: 400
gold golem:
  ac: 6
  alignment: 0
  attacks:
    - damage: 2d3
      mode: claw
      type: physical
    - damage: 2d3
      mode: claw
      type: physical
  breathless: 1
  color: yellow
  corpse: {}
  glyph: "'"
  hitdice: 5
  hostile: 1
  humanoid: 1
  mindless: 1
  mr: 0
  name: gold golem
  neuter: 1
  nocorpse: 1
  nutrition: 0
  rarity: 1
  resist:
    acid: 1
    poison: 1
    sleep: 1
  size: large
  sound: silent
  speed: 9
  thick_hide: 1
  weight: 450
golden naga:
  ac: 2
  alignment: 5
  attacks:
    - damage: 2d6
      mode: bite
      type: physical
    - damage: 4d6
      mode: magic
      type: wizardspell
  color: yellow
  corpse:
    poison: 1
  geno: 1
  glyph: N
  hitdice: 10
  mr: 70
  name: golden naga
  nolimbs: 1
  notake: 1
  nutrition: 400
  omnivore: 1
  oviparous: 1
  rarity: 1
  resist:
    poison: 1
  size: huge
  slithy: 1
  sound: mumble
  speed: 14
  strong: 1
  thick_hide: 1
  weight: 2600
golden naga hatchling:
  ac: 6
  alignment: 0
  attacks:
    - damage: 1d4
      mode: bite
      type: physical
  color: yellow
  corpse:
    poison: 1
  geno: 1
  glyph: N
  hitdice: 3
  mr: 0
  name: golden naga hatchling
  nolimbs: 1
  notake: 1
  nutrition: 100
  omnivore: 1
  resist:
    poison: 1
  size: large
  slithy: 1
  sound: mumble
  speed: 10
  strong: 1
  thick_hide: 1
  weight: 500
gray dragon:
  ac: -1
  alignment: 4
  attacks:
    - damage: 4d6
      mode: breathe
      type: magicmissile
    - damage: 3d8
      mode: bite
      type: physical
    - damage: 1d4
      mode: claw
      type: physical
    - damage: 1d4
      mode: claw
      type: physical
  carnivore: 1
  color: gray
  corpse: {}
  fly: 1
  geno: 1
  glyph: D
  greedy: 1
  hitdice: 15
  hostile: 1
  jewels: 1
  magic: 1
  mr: 20
  name: gray dragon
  nasty: 1
  nohands: 1
  nutrition: 1500
  oviparous: 1
  rarity: 1
  resist: {}
  see_invis: 1
  size: gigantic
  sound: roar
  speed: 9
  strong: 1
  thick_hide: 1
  weight: 4500
gray ooze:
  ac: 8
  acid: 1
  alignment: 0
  amorphous: 1
  attacks:
    - damage: 2d8
      mode: bite
      type: rust
  breathless: 1
  color: gray
  corpse:
    cold: 1
    fire: 1
    poison: 1
  geno: 1
  glyph: P
  hitdice: 3
  hostile: 1
  mindless: 1
  mr: 0
  name: gray ooze
  neuter: 1
  noeyes: 1
  nohead: 1
  nolimbs: 1
  nutrition: 250
  omnivore: 1
  rarity: 2
  resist:
    acid: 1
    cold: 1
    fire: 1
    poison: 1
    stone: 1
  size: medium
  sound: silent
  speed: 1
  weight: 500
gray unicorn:
  ac: 2
  alignment: 0
  attacks:
    - damage: 1d12
      mode: headbutt
      type: physical
    - damage: 1d6
      mode: kick
      type: physical
  color: gray
  corpse:
    poison: 1
  geno: 1
  glyph: u
  herbivore: 1
  hitdice: 4
  infravisible: 1
  jewels: 1
  mr: 70
  name: gray unicorn
  nohands: 1
  nutrition: 300
  rarity: 1
  resist:
    poison: 1
  size: large
  sound: neigh
  speed: 24
  strong: 1
  wander: 1
  weight: 1300
green dragon:
  ac: -1
  alignment: 6
  attacks:
    - damage: 4d6
      mode: breathe
      type: poison
    - damage: 3d8
      mode: bite
      type: physical
    - damage: 1d4
      mode: claw
      type: physical
    - damage: 1d4
      mode: claw
      type: physical
  carnivore: 1
  color: green
  corpse:
    poison: 1
  fly: 1
  geno: 1
  glyph: D
  greedy: 1
  hitdice: 15
  hostile: 1
  jewels: 1
  magic: 1
  mr: 20
  name: green dragon
  nasty: 1
  nohands: 1
  nutrition: 1500
  oviparous: 1
  pois: 1
  rarity: 1
  resist:
    poison: 1
  see_invis: 1
  size: gigantic
  sound: roar
  speed: 9
  strong: 1
  thick_hide: 1
  weight: 4500
green mold:
  ac: 9
  acid: 1
  alignment: 0
  attacks:
    - damage: 0d4
      mode: passive
      type: acid
  breathless: 1
  color: green
  corpse:
    stone: 1
  geno: 1
  glyph: F
  hitdice: 1
  hostile: 1
  mindless: 1
  mr: 0
  name: green mold
  neuter: 1
  noeyes: 1
  nohead: 1
  nolimbs: 1
  notake: 1
  nutrition: 30
  rarity: 1
  resist:
    acid: 1
    stone: 1
  size: small
  sound: silent
  speed: 0
  weight: 50
green slime:
  ac: 6
  acid: 1
  alignment: 0
  amorphous: 1
  attacks:
    - damage: 1d4
      mode: touch
      type: slime
    - damage: 0d0
      mode: passive
      type: slime
  breathless: 1
  color: green
  corpse: {}
  geno: 1
  glyph: P
  hell: 1
  hitdice: 6
  hostile: 1
  mindless: 1
  mr: 0
  name: green slime
  neuter: 1
  noeyes: 1
  nohead: 1
  nolimbs: 1
  nutrition: 150
  omnivore: 1
  pois: 1
  rarity: 1
  resist:
    acid: 1
    cold: 1
    elec: 1
    poison: 1
    stone: 1
  size: large
  sound: silent
  speed: 6
  weight: 400
gremlin:
  ac: 2
  alignment: -9
  attacks:
    - damage: 1d6
      mode: claw
      type: physical
    - damage: 1d6
      mode: claw
      type: physical
    - damage: 1d4
      mode: bite
      type: physical
    - damage: 0d0
      mode: claw
      type: stealintrinsic
  color: green
  corpse:
    poison: 1
  geno: 1
  glyph: g
  hitdice: 5
  humanoid: 1
  infravisible: 1
  mr: 25
  name: gremlin
  nutrition: 20
  pois: 1
  rarity: 2
  resist:
    poison: 1
  size: small
  sound: laugh
  speed: 12
  stalk: 1
  swim: 1
  weight: 100
grid bug:
  ac: 9
  alignment: 0
  animal: 1
  attacks:
    - damage: 1d1
      mode: bite
      type: electricity
  color: magenta
  corpse: {}
  geno: 1
  glyph: x
  hitdice: 0
  hostile: 1
  infravisible: 1
  mr: 0
  name: grid bug
  nocorpse: 1
  nutrition: 10
  rarity: 3
  resist:
    elec: 1
    poison: 1
  sgroup: 1
  size: tiny
  sound: buzz
  speed: 12
  weight: 15
guard:
  ac: 10
  alignment: 10
  attacks:
    - damage: 4d10
      mode: weapon
      type: physical
  collect: 1
  color: blue
  corpse: {}
  glyph: '@'
  hitdice: 12
  human: 1
  humanoid: 1
  infravisible: 1
  merc: 1
  mr: 40
  name: guard
  nogen: 1
  nopoly: 1
  nutrition: 400
  omnivore: 1
  peaceful: 1
  resist: {}
  size: human
  sound: guard
  speed: 12
  strong: 1
  weight: 1450
guardian naga:
  ac: 0
  alignment: 7
  attacks:
    - damage: 1d6
      mode: bite
      type: paralyze
    - damage: 1d6
      mode: spit
      type: poison
    - damage: 2d4
      mode: crush
      type: physical
  color: green
  corpse:
    poison: 1
  geno: 1
  glyph: N
  hitdice: 12
  mr: 50
  name: guardian naga
  nolimbs: 1
  notake: 1
  nutrition: 400
  omnivore: 1
  oviparous: 1
  pois: 1
  rarity: 1
  resist:
    poison: 1
  size: huge
  slithy: 1
  sound: mumble
  speed: 16
  strong: 1
  thick_hide: 1
  weight: 2600
guardian naga hatchling:
  ac: 6
  alignment: 0
  attacks:
    - damage: 1d4
      mode: bite
      type: physical
  color: green
  corpse:
    poison: 1
  geno: 1
  glyph: N
  hitdice: 3
  mr: 0
  name: guardian naga hatchling
  nolimbs: 1
  notake: 1
  nutrition: 100
  omnivore: 1
  resist:
    poison: 1
  size: large
  slithy: 1
  sound: mumble
  speed: 10
  strong: 1
  thick_hide: 1
  weight: 500
guide:
  ac: 10
  alignment: 0
  attacks:
    - damage: 1d6
      mode: weapon
      type: physical
    - damage: 0d0
      mode: magic
      type: wizardspell
  collect: 1
  color: white
  corpse: {}
  glyph: '@'
  hitdice: 5
  human: 1
  humanoid: 1
  infravisible: 1
  magic: 1
  mr: 20
  name: guide
  nogen: 1
  nopoly: 1
  nutrition: 400
  omnivore: 1
  peaceful: 1
  resist: {}
  size: human
  sound: guardian
  speed: 12
  strong: 1
  weight: 1450
healer:
  ac: 10
  alignment: 0
  attacks:
    - damage: 1d6
      mode: weapon
      type: physical
  collect: 1
  color: white
  corpse: {}
  glyph: '@'
  hitdice: 10
  human: 1
  humanoid: 1
  infravisible: 1
  mr: 1
  name: healer
  nogen: 1
  nopoly: 1
  nutrition: 400
  omnivore: 1
  resist:
    poison: 1
  size: human
  sound: humanoid
  speed: 12
  strong: 1
  weight: 1450
hell hound:
  ac: 2
  alignment: 0
  animal: 1
  attacks:
    - damage: 3d6
      mode: bite
      type: physical
    - damage: 3d6
      mode: breathe
      type: fire
  carnivore: 1
  color: red
  corpse:
    fire: 1
  geno: 1
  glyph: d
  hell: 1
  hitdice: 12
  hostile: 1
  infravisible: 1
  mr: 20
  name: hell hound
  nohands: 1
  nutrition: 300
  rarity: 1
  resist:
    fire: 1
  size: medium
  sound: bark
  speed: 14
  strong: 1
  weight: 600
hell hound pup:
  ac: 4
  alignment: -5
  animal: 1
  attacks:
    - damage: 2d6
      mode: bite
      type: physical
    - damage: 2d6
      mode: breathe
      type: fire
  carnivore: 1
  color: red
  corpse:
    fire: 1
  geno: 1
  glyph: d
  hell: 1
  hitdice: 7
  hostile: 1
  infravisible: 1
  mr: 20
  name: hell hound pup
  nohands: 1
  nutrition: 200
  rarity: 1
  resist:
    fire: 1
  sgroup: 1
  size: small
  sound: bark
  speed: 12
  weight: 200
hezrou:
  ac: -2
  alignment: -10
  attacks:
    - damage: 1d3
      mode: claw
      type: physical
    - damage: 1d3
      mode: claw
      type: physical
    - damage: 4d4
      mode: bite
      type: physical
  color: red
  corpse: {}
  demon: 1
  glyph: '&'
  hell: 1
  hitdice: 9
  hostile: 1
  humanoid: 1
  infravisible: 1
  infravision: 1
  mr: 55
  name: hezrou
  nasty: 1
  nocorpse: 1
  nutrition: 400
  pois: 1
  rarity: 2
  resist:
    fire: 1
    poison: 1
  sgroup: 1
  size: large
  sound: silent
  speed: 6
  stalk: 1
  weight: 1450
high priest:
  ac: 7
  alignment: 0
  attacks:
    - damage: 4d10
      mode: weapon
      type: physical
    - damage: 2d8
      mode: kick
      type: physical
    - damage: 2d8
      mode: magic
      type: clericalspell
    - damage: 2d8
      mode: magic
      type: clericalspell
  collect: 1
  color: white
  corpse: {}
  glyph: '@'
  hitdice: 25
  human: 1
  humanoid: 1
  infravisible: 1
  magic: 1
  minion: 1
  mr: 70
  name: high priest
  nasty: 1
  nogen: 1
  nopoly: 1
  nutrition: 400
  omnivore: 1
  prince: 1
  resist:
    elec: 1
    fire: 1
    poison: 1
    sleep: 1
  see_invis: 1
  size: human
  sound: priest
  speed: 15
  uniq: 1
  weight: 1450
hill giant:
  ac: 6
  alignment: -2
  attacks:
    - damage: 2d8
      mode: weapon
      type: physical
  carnivore: 1
  collect: 1
  color: cyan
  corpse: {}
  geno: 1
  giant: 1
  glyph: H
  hitdice: 8
  humanoid: 1
  infravisible: 1
  infravision: 1
  jewels: 1
  mr: 0
  name: hill giant
  nasty: 1
  nutrition: 700
  rarity: 1
  resist: {}
  rockthrow: 1
  sgroup: 1
  size: huge
  sound: boast
  speed: 10
  strong: 1
  weight: 2200
hill orc:
  ac: 10
  alignment: -4
  attacks:
    - damage: 1d6
      mode: weapon
      type: physical
  collect: 1
  color: yellow
  corpse: {}
  geno: 1
  glyph: o
  greedy: 1
  hitdice: 2
  humanoid: 1
  infravisible: 1
  infravision: 1
  jewels: 1
  lgroup: 1
  mr: 0
  name: hill orc
  nutrition: 200
  omnivore: 1
  orc: 1
  rarity: 2
  resist: {}
  size: human
  sound: orc
  speed: 9
  strong: 1
  weight: 1000
hobbit:
  ac: 10
  alignment: 6
  attacks:
    - damage: 1d6
      mode: weapon
      type: physical
  collect: 1
  color: green
  corpse: {}
  geno: 1
  glyph: h
  hitdice: 1
  humanoid: 1
  infravisible: 1
  infravision: 1
  mr: 0
  name: hobbit
  nutrition: 200
  omnivore: 1
  rarity: 2
  resist: {}
  size: small
  sound: humanoid
  speed: 9
  weight: 500
hobgoblin:
  ac: 10
  alignment: -4
  attacks:
    - damage: 1d6
      mode: weapon
      type: physical
  collect: 1
  color: brown
  corpse: {}
  geno: 1
  glyph: o
  hitdice: 1
  humanoid: 1
  infravisible: 1
  infravision: 1
  mr: 0
  name: hobgoblin
  nutrition: 200
  omnivore: 1
  orc: 1
  rarity: 2
  resist: {}
  size: human
  sound: orc
  speed: 9
  strong: 1
  weight: 1000
homunculus:
  ac: 6
  alignment: -7
  attacks:
    - damage: 1d3
      mode: bite
      type: sleep
  color: green
  corpse:
    poison: 1
    sleep: 1
  fly: 1
  geno: 1
  glyph: i
  hitdice: 2
  infravisible: 1
  infravision: 1
  mr: 10
  name: homunculus
  nutrition: 100
  pois: 1
  rarity: 2
  resist:
    poison: 1
    sleep: 1
  size: tiny
  sound: silent
  speed: 12
  stalk: 1
  weight: 60
horned devil:
  ac: -5
  alignment: 11
  attacks:
    - damage: 1d4
      mode: weapon
      type: physical
    - damage: 1d4
      mode: claw
      type: physical
    - damage: 2d3
      mode: bite
      type: physical
    - damage: 1d3
      mode: sting
      type: physical
  color: brown
  corpse: {}
  demon: 1
  glyph: '&'
  hell: 1
  hitdice: 6
  hostile: 1
  infravisible: 1
  infravision: 1
  mr: 50
  name: horned devil
  nasty: 1
  nocorpse: 1
  nutrition: 400
  pois: 1
  rarity: 2
  resist:
    fire: 1
    poison: 1
  size: human
  sound: silent
  speed: 9
  stalk: 1
  thick_hide: 1
  weight: 1450
horse:
  ac: 5
  alignment: 0
  animal: 1
  attacks:
    - damage: 1d8
      mode: kick
      type: physical
    - damage: 1d3
      mode: bite
      type: physical
  color: brown
  corpse: {}
  domestic: 1
  geno: 1
  glyph: u
  herbivore: 1
  hitdice: 5
  infravisible: 1
  mr: 0
  name: horse
  nohands: 1
  nutrition: 300
  rarity: 2
  resist: {}
  size: large
  sound: neigh
  speed: 20
  strong: 1
  wander: 1
  weight: 1500
housecat:
  ac: 5
  alignment: 0
  animal: 1
  attacks:
    - damage: 1d6
      mode: bite
      type: physical
  carnivore: 1
  color: white
  corpse: {}
  domestic: 1
  geno: 1
  glyph: f
  hitdice: 4
  infravisible: 1
  mr: 0
  name: housecat
  nohands: 1
  nutrition: 200
  rarity: 1
  resist: {}
  size: small
  sound: mew
  speed: 16
  weight: 200
human:
  ac: 10
  alignment: 0
  attacks:
    - damage: 1d6
      mode: weapon
      type: physical
  collect: 1
  color: white
  corpse: {}
  glyph: '@'
  hitdice: 0
  human: 1
  humanoid: 1
  infravisible: 1
  mr: 0
  name: human
  nogen: 1
  nopoly: 1
  nutrition: 400
  omnivore: 1
  resist: {}
  size: human
  sound: humanoid
  speed: 12
  strong: 1
  weight: 1450
human mummy:
  ac: 4
  alignment: -5
  attacks:
    - damage: 2d4
      mode: claw
      type: physical
    - damage: 2d4
      mode: claw
      type: physical
  breathless: 1
  color: gray
  corpse: {}
  geno: 1
  glyph: M
  hitdice: 6
  hostile: 1
  humanoid: 1
  infravision: 1
  mindless: 1
  mr: 30
  name: human mummy
  nocorpse: 1
  nutrition: 200
  pois: 1
  rarity: 1
  resist:
    cold: 1
    poison: 1
    sleep: 1
  size: human
  sound: silent
  speed: 12
  undead: 1
  weight: 1450
human zombie:
  ac: 8
  alignment: -3
  attacks:
    - damage: 1d8
      mode: claw
      type: physical
  breathless: 1
  color: white
  corpse: {}
  geno: 1
  glyph: Z
  hitdice: 4
  hostile: 1
  humanoid: 1
  infravision: 1
  mindless: 1
  mr: 0
  name: human zombie
  nocorpse: 1
  nutrition: 200
  rarity: 1
  resist:
    cold: 1
    poison: 1
    sleep: 1
  sgroup: 1
  size: human
  sound: silent
  speed: 6
  stalk: 1
  undead: 1
  weight: 1450
hunter:
  ac: 10
  alignment: -7
  attacks:
    - damage: 1d4
      mode: weapon
      type: physical
  collect: 1
  color: white
  corpse: {}
  glyph: '@'
  hitdice: 5
  human: 1
  humanoid: 1
  infravisible: 1
  infravision: 1
  mr: 10
  name: hunter
  nogen: 1
  nopoly: 1
  nutrition: 400
  omnivore: 1
  peaceful: 1
  resist: {}
  see_invis: 1
  size: human
  sound: guardian
  speed: 12
  strong: 1
  weight: 1450
ice devil:
  ac: -4
  alignment: -12
  attacks:
    - damage: 1d4
      mode: claw
      type: physical
    - damage: 1d4
      mode: claw
      type: physical
    - damage: 2d4
      mode: bite
      type: physical
    - damage: 3d4
      mode: sting
      type: cold
  color: white
  corpse: {}
  demon: 1
  glyph: '&'
  hell: 1
  hitdice: 11
  hostile: 1
  infravisible: 1
  infravision: 1
  mr: 55
  name: ice devil
  nasty: 1
  nocorpse: 1
  nutrition: 400
  pois: 1
  rarity: 2
  resist:
    cold: 1
    fire: 1
    poison: 1
  see_invis: 1
  size: large
  sound: silent
  speed: 6
  stalk: 1
  weight: 1450
ice troll:
  ac: 2
  alignment: -3
  attacks:
    - damage: 2d6
      mode: weapon
      type: physical
    - damage: 2d6
      mode: claw
      type: cold
    - damage: 2d6
      mode: bite
      type: physical
  carnivore: 1
  color: white
  corpse:
    cold: 1
  geno: 1
  glyph: T
  hitdice: 9
  hostile: 1
  humanoid: 1
  infravisible: 1
  infravision: 1
  mr: 20
  name: ice troll
  nohell: 1
  nutrition: 300
  rarity: 1
  regen: 1
  resist:
    cold: 1
  size: large
  sound: grunt
  speed: 10
  stalk: 1
  strong: 1
  weight: 1000
ice vortex:
  ac: 2
  alignment: 0
  attacks:
    - damage: 1d6
      mode: engulf
      type: cold
  breathless: 1
  color: cyan
  corpse: {}
  fly: 1
  geno: 1
  glyph: v
  hitdice: 5
  hostile: 1
  infravisible: 1
  mindless: 1
  mr: 30
  name: ice vortex
  neuter: 1
  nocorpse: 1
  noeyes: 1
  nohead: 1
  nohell: 1
  nolimbs: 1
  nutrition: 0
  rarity: 1
  resist:
    cold: 1
    poison: 1
    sleep: 1
    stone: 1
  size: huge
  sound: silent
  speed: 20
  weight: 0
iguana:
  ac: 7
  alignment: 0
  animal: 1
  attacks:
    - damage: 1d4
      mode: bite
      type: physical
  carnivore: 1
  color: brown
  corpse: {}
  geno: 1
  glyph: ':'
  hitdice: 2
  hostile: 1
  mr: 0
  name: iguana
  nohands: 1
  nutrition: 30
  rarity: 5
  resist: {}
  size: tiny
  sound: silent
  speed: 6
  weight: 30
imp:
  ac: 2
  alignment: -7
  attacks:
    - damage: 1d4
      mode: claw
      type: physical
  color: red
  corpse: {}
  geno: 1
  glyph: i
  hitdice: 3
  infravisible: 1
  infravision: 1
  mr: 20
  name: imp
  nutrition: 10
  rarity: 1
  regen: 1
  resist: {}
  size: tiny
  sound: cuss
  speed: 12
  stalk: 1
  wander: 1
  weight: 20
incubus:
  ac: 0
  alignment: -9
  attacks:
    - damage: 0d0
      mode: bite
      type: succubus
    - damage: 1d3
      mode: claw
      type: physical
    - damage: 1d3
      mode: claw
      type: physical
  color: gray
  corpse: {}
  demon: 1
  fly: 1
  glyph: '&'
  hitdice: 6
  hostile: 1
  humanoid: 1
  infravisible: 1
  infravision: 1
  male: 1
  mr: 70
  name: incubus
  nasty: 1
  nocorpse: 1
  nutrition: 400
  pois: 1
  rarity: 1
  resist:
    fire: 1
    poison: 1
  size: human
  sound: seduce
  speed: 12
  stalk: 1
  weight: 1450
iron golem:
  ac: 3
  alignment: 0
  attacks:
    - damage: 4d10
      mode: weapon
      type: physical
    - damage: 4d6
      mode: breathe
      type: poison
  breathless: 1
  collect: 1
  color: cyan
  corpse: {}
  glyph: "'"
  hitdice: 18
  hostile: 1
  humanoid: 1
  mindless: 1
  mr: 60
  name: iron golem
  nocorpse: 1
  nutrition: 0
  pois: 1
  rarity: 1
  resist:
    cold: 1
    elec: 1
    fire: 1
    poison: 1
    sleep: 1
  size: large
  sound: silent
  speed: 6
  strong: 1
  thick_hide: 1
  weight: 2000
iron piercer:
  ac: 0
  alignment: 0
  animal: 1
  attacks:
    - damage: 3d6
      mode: bite
      type: physical
  carnivore: 1
  cling: 1
  color: cyan
  corpse: {}
  geno: 1
  glyph: p
  hide: 1
  hitdice: 5
  hostile: 1
  mr: 0
  name: iron piercer
  noeyes: 1
  nolimbs: 1
  notake: 1
  nutrition: 300
  rarity: 2
  resist: {}
  size: medium
  sound: silent
  speed: 1
  weight: 400
jabberwock:
  ac: -2
  alignment: 0
  animal: 1
  attacks:
    - damage: 2d10
      mode: bite
      type: physical
    - damage: 2d10
      mode: bite
      type: physical
    - damage: 2d10
      mode: claw
      type: physical
    - damage: 2d10
      mode: claw
      type: physical
  carnivore: 1
  collect: 1
  color: orange
  corpse: {}
  fly: 1
  geno: 1
  glyph: J
  hitdice: 15
  hostile: 1
  infravisible: 1
  mr: 50
  name: jabberwock
  nasty: 1
  nutrition: 600
  rarity: 1
  resist: {}
  size: large
  sound: burble
  speed: 12
  strong: 1
  weight: 1300
jackal:
  ac: 7
  alignment: 0
  animal: 1
  attacks:
    - damage: 1d2
      mode: bite
      type: physical
  carnivore: 1
  color: brown
  corpse: {}
  geno: 1
  glyph: d
  hitdice: 0
  hostile: 1
  infravisible: 1
  mr: 0
  name: jackal
  nohands: 1
  nutrition: 250
  rarity: 3
  resist: {}
  sgroup: 1
  size: small
  sound: bark
  speed: 12
  weight: 300
jaguar:
  ac: 6
  alignment: 0
  animal: 1
  attacks:
    - damage: 1d4
      mode: claw
      type: physical
    - damage: 1d4
      mode: claw
      type: physical
    - damage: 1d8
      mode: bite
      type: physical
  carnivore: 1
  color: brown
  corpse: {}
  geno: 1
  glyph: f
  hitdice: 4
  hostile: 1
  infravisible: 1
  mr: 0
  name: jaguar
  nohands: 1
  nutrition: 300
  rarity: 2
  resist: {}
  size: large
  sound: growl
  speed: 15
  weight: 600
jellyfish:
  ac: 6
  alignment: 0
  amphibious: 1
  attacks:
    - damage: 3d3
      mode: sting
      type: poison
  color: blue
  corpse:
    poison: 1
  geno: 1
  glyph: ;
  hitdice: 3
  hostile: 1
  mr: 0
  name: jellyfish
  nogen: 1
  nolimbs: 1
  notake: 1
  nutrition: 20
  pois: 1
  resist:
    poison: 1
  size: small
  slithy: 1
  sound: silent
  speed: 3
  swim: 1
  weight: 80
ki-rin:
  ac: -5
  alignment: 15
  attacks:
    - damage: 2d4
      mode: kick
      type: physical
    - damage: 2d4
      mode: kick
      type: physical
    - damage: 3d6
      mode: headbutt
      type: physical
    - damage: 2d6
      mode: magic
      type: wizardspell
  color: yellow
  corpse: {}
  fly: 1
  glyph: A
  hitdice: 16
  infravisible: 1
  infravision: 1
  lord: 1
  minion: 1
  mr: 90
  name: ki-rin
  nasty: 1
  nocorpse: 1
  nohell: 1
  nopoly: 1
  nutrition: 400
  rarity: 1
  resist: {}
  see_invis: 1
  size: large
  sound: neigh
  speed: 18
  stalk: 1
  strong: 1
  weight: 1450
killer bee:
  ac: -1
  alignment: 0
  animal: 1
  attacks:
    - damage: 1d3
      mode: sting
      type: poison
  color: yellow
  corpse:
    poison: 1
  female: 1
  fly: 1
  geno: 1
  glyph: a
  hitdice: 1
  hostile: 1
  lgroup: 1
  mr: 0
  name: killer bee
  nohands: 1
  nutrition: 5
  pois: 1
  rarity: 2
  resist:
    poison: 1
  size: tiny
  sound: buzz
  speed: 18
  weight: 1
kitten:
  ac: 6
  alignment: 0
  animal: 1
  attacks:
    - damage: 1d6
      mode: bite
      type: physical
  carnivore: 1
  color: white
  corpse: {}
  domestic: 1
  geno: 1
  glyph: f
  hitdice: 2
  infravisible: 1
  mr: 0
  name: kitten
  nohands: 1
  nutrition: 150
  rarity: 1
  resist: {}
  size: small
  sound: mew
  speed: 18
  wander: 1
  weight: 150
knight:
  ac: 10
  alignment: 3
  attacks:
    - damage: 1d6
      mode: weapon
      type: physical
    - damage: 1d6
      mode: weapon
      type: physical
  collect: 1
  color: white
  corpse: {}
  glyph: '@'
  hitdice: 10
  human: 1
  humanoid: 1
  infravisible: 1
  mr: 1
  name: knight
  nogen: 1
  nopoly: 1
  nutrition: 400
  omnivore: 1
  resist: {}
  size: human
  sound: humanoid
  speed: 12
  strong: 1
  weight: 1450
kobold:
  ac: 10
  alignment: -2
  attacks:
    - damage: 1d4
      mode: weapon
      type: physical
  collect: 1
  color: brown
  corpse: {}
  geno: 1
  glyph: k
  hitdice: 0
  hostile: 1
  humanoid: 1
  infravisible: 1
  infravision: 1
  mr: 0
  name: kobold
  nutrition: 100
  omnivore: 1
  pois: 1
  rarity: 1
  resist:
    poison: 1
  size: small
  sound: orc
  speed: 6
  weight: 400
kobold lord:
  ac: 10
  alignment: -4
  attacks:
    - damage: 2d4
      mode: weapon
      type: physical
  collect: 1
  color: magenta
  corpse: {}
  geno: 1
  glyph: k
  hitdice: 2
  hostile: 1
  humanoid: 1
  infravisible: 1
  infravision: 1
  lord: 1
  male: 1
  mr: 0
  name: kobold lord
  nutrition: 200
  omnivore: 1
  pois: 1
  rarity: 1
  resist:
    poison: 1
  size: small
  sound: orc
  speed: 6
  weight: 500
kobold mummy:
  ac: 6
  alignment: -2
  attacks:
    - damage: 1d4
      mode: claw
      type: physical
  breathless: 1
  color: brown
  corpse: {}
  geno: 1
  glyph: M
  hitdice: 3
  hostile: 1
  humanoid: 1
  infravision: 1
  mindless: 1
  mr: 20
  name: kobold mummy
  nocorpse: 1
  nutrition: 50
  pois: 1
  rarity: 1
  resist:
    cold: 1
    poison: 1
    sleep: 1
  size: small
  sound: silent
  speed: 8
  undead: 1
  weight: 400
kobold shaman:
  ac: 6
  alignment: -4
  attacks:
    - damage: 0d0
      mode: magic
      type: wizardspell
  color: bright_blue
  corpse: {}
  geno: 1
  glyph: k
  hitdice: 2
  hostile: 1
  humanoid: 1
  infravisible: 1
  infravision: 1
  magic: 1
  mr: 10
  name: kobold shaman
  nutrition: 150
  omnivore: 1
  pois: 1
  rarity: 1
  resist:
    poison: 1
  size: small
  sound: orc
  speed: 6
  weight: 450
kobold zombie:
  ac: 10
  alignment: -2
  attacks:
    - damage: 1d4
      mode: claw
      type: physical
  breathless: 1
  color: brown
  corpse: {}
  geno: 1
  glyph: Z
  hitdice: 0
  hostile: 1
  humanoid: 1
  infravision: 1
  mindless: 1
  mr: 0
  name: kobold zombie
  nocorpse: 1
  nutrition: 50
  pois: 1
  rarity: 1
  resist:
    cold: 1
    poison: 1
    sleep: 1
  size: small
  sound: silent
  speed: 6
  stalk: 1
  undead: 1
  weight: 400
kraken:
  ac: 6
  alignment: -3
  amphibious: 1
  animal: 1
  attacks:
    - damage: 2d4
      mode: claw
      type: physical
    - damage: 2d4
      mode: claw
      type: physical
    - damage: 2d6
      mode: crush
      type: wrap
    - damage: 5d4
      mode: bite
      type: physical
  carnivore: 1
  color: red
  corpse: {}
  geno: 1
  glyph: ;
  hitdice: 20
  hostile: 1
  infravisible: 1
  mr: 0
  name: kraken
  nogen: 1
  nohands: 1
  nopoly: 1
  nutrition: 1000
  resist: {}
  size: huge
  sound: silent
  speed: 3
  strong: 1
  swim: 1
  weight: 1800
large cat:
  ac: 4
  alignment: 0
  animal: 1
  attacks:
    - damage: 2d4
      mode: bite
      type: physical
  carnivore: 1
  color: white
  corpse: {}
  domestic: 1
  geno: 1
  glyph: f
  hitdice: 6
  infravisible: 1
  mr: 0
  name: large cat
  nohands: 1
  nutrition: 250
  rarity: 1
  resist: {}
  size: small
  sound: mew
  speed: 15
  strong: 1
  weight: 250
large dog:
  ac: 4
  alignment: 0
  animal: 1
  attacks:
    - damage: 2d4
      mode: bite
      type: physical
  carnivore: 1
  color: white
  corpse: {}
  domestic: 1
  geno: 1
  glyph: d
  hitdice: 6
  infravisible: 1
  mr: 0
  name: large dog
  nohands: 1
  nutrition: 250
  rarity: 1
  resist: {}
  size: medium
  sound: bark
  speed: 15
  strong: 1
  weight: 800
large kobold:
  ac: 10
  alignment: -3
  attacks:
    - damage: 1d6
      mode: weapon
      type: physical
  collect: 1
  color: red
  corpse: {}
  geno: 1
  glyph: k
  hitdice: 1
  hostile: 1
  humanoid: 1
  infravisible: 1
  infravision: 1
  mr: 0
  name: large kobold
  nutrition: 150
  omnivore: 1
  pois: 1
  rarity: 1
  resist:
    poison: 1
  size: small
  sound: orc
  speed: 6
  weight: 450
large mimic:
  ac: 7
  alignment: 0
  amorphous: 1
  animal: 1
  attacks:
    - damage: 3d4
      mode: claw
      type: stick
  breathless: 1
  carnivore: 1
  cling: 1
  color: red
  corpse: {}
  geno: 1
  glyph: m
  hide: 1
  hitdice: 8
  hostile: 1
  mr: 10
  name: large mimic
  noeyes: 1
  nohead: 1
  nolimbs: 1
  nutrition: 400
  rarity: 1
  resist:
    acid: 1
  size: large
  sound: silent
  speed: 3
  strong: 1
  thick_hide: 1
  weight: 600
leather golem:
  ac: 6
  alignment: 0
  attacks:
    - damage: 1d6
      mode: claw
      type: physical
    - damage: 1d6
      mode: claw
      type: physical
  breathless: 1
  color: brown
  corpse: {}
  glyph: "'"
  hitdice: 6
  hostile: 1
  humanoid: 1
  mindless: 1
  mr: 0
  name: leather golem
  neuter: 1
  nocorpse: 1
  nutrition: 0
  rarity: 1
  resist:
    poison: 1
    sleep: 1
  size: large
  sound: silent
  speed: 6
  weight: 800
lemure:
  ac: 7
  alignment: -7
  attacks:
    - damage: 1d3
      mode: claw
      type: physical
  color: brown
  corpse:
    sleep: 1
  geno: 1
  glyph: i
  hell: 1
  hitdice: 3
  hostile: 1
  infravisible: 1
  infravision: 1
  lgroup: 1
  mr: 0
  name: lemure
  neuter: 1
  nocorpse: 1
  nutrition: 100
  pois: 1
  rarity: 1
  regen: 1
  resist:
    poison: 1
    sleep: 1
  size: medium
  sound: silent
  speed: 3
  stalk: 1
  wander: 1
  weight: 150
leocrotta:
  ac: 4
  alignment: 0
  animal: 1
  attacks:
    - damage: 2d6
      mode: claw
      type: physical
    - damage: 2d6
      mode: bite
      type: physical
    - damage: 2d6
      mode: claw
      type: physical
  color: red
  corpse: {}
  geno: 1
  glyph: q
  hitdice: 6
  hostile: 1
  infravisible: 1
  mr: 10
  name: leocrotta
  nohands: 1
  nutrition: 500
  omnivore: 1
  rarity: 2
  resist: {}
  size: large
  sound: imitate
  speed: 18
  strong: 1
  weight: 1200
leprechaun:
  ac: 8
  alignment: 0
  attacks:
    - damage: 1d2
      mode: claw
      type: stealgold
  color: green
  corpse: {}
  geno: 1
  glyph: l
  greedy: 1
  hitdice: 5
  hostile: 1
  humanoid: 1
  infravisible: 1
  mr: 20
  name: leprechaun
  nutrition: 30
  rarity: 4
  resist: {}
  size: tiny
  sound: laugh
  speed: 15
  tport: 1
  weight: 60
lich:
  ac: 0
  alignment: -9
  attacks:
    - damage: 1d10
      mode: touch
      type: cold
    - damage: 0d0
      mode: magic
      type: wizardspell
  breathless: 1
  color: brown
  corpse:
    cold: 1
  geno: 1
  glyph: L
  hitdice: 11
  hostile: 1
  humanoid: 1
  infravision: 1
  magic: 1
  mr: 30
  name: lich
  nocorpse: 1
  nutrition: 100
  pois: 1
  rarity: 1
  regen: 1
  resist:
    cold: 1
    poison: 1
    sleep: 1
  size: human
  sound: mumble
  speed: 6
  undead: 1
  weight: 1200
lichen:
  ac: 9
  alignment: 0
  attacks:
    - damage: 0d0
      mode: touch
      type: stick
  breathless: 1
  color: bright_green
  corpse: {}
  geno: 1
  glyph: F
  hitdice: 0
  hostile: 1
  mindless: 1
  mr: 0
  name: lichen
  neuter: 1
  noeyes: 1
  nohead: 1
  nolimbs: 1
  notake: 1
  nutrition: 200
  rarity: 4
  resist: {}
  size: small
  sound: silent
  speed: 1
  weight: 20
lieutenant:
  ac: 10
  alignment: -4
  attacks:
    - damage: 3d4
      mode: weapon
      type: physical
    - damage: 3d4
      mode: weapon
      type: physical
  collect: 1
  color: green
  corpse: {}
  geno: 1
  glyph: '@'
  hitdice: 10
  hostile: 1
  human: 1
  humanoid: 1
  infravisible: 1
  merc: 1
  mr: 15
  name: lieutenant
  nopoly: 1
  nutrition: 400
  omnivore: 1
  rarity: 1
  resist: {}
  size: human
  sound: soldier
  speed: 10
  stalk: 1
  strong: 1
  weight: 1450
little dog:
  ac: 6
  alignment: 0
  animal: 1
  attacks:
    - damage: 1d6
      mode: bite
      type: physical
  carnivore: 1
  color: white
  corpse: {}
  domestic: 1
  geno: 1
  glyph: d
  hitdice: 2
  infravisible: 1
  mr: 0
  name: little dog
  nohands: 1
  nutrition: 150
  rarity: 1
  resist: {}
  size: small
  sound: bark
  speed: 18
  weight: 150
lizard:
  ac: 6
  alignment: 0
  animal: 1
  attacks:
    - damage: 1d6
      mode: bite
      type: physical
  carnivore: 1
  color: green
  corpse:
    stone: 1
  geno: 1
  glyph: ':'
  hitdice: 5
  hostile: 1
  mr: 10
  name: lizard
  nohands: 1
  nutrition: 40
  rarity: 5
  resist:
    stone: 1
  size: tiny
  sound: silent
  speed: 6
  weight: 10
long worm:
  ac: 5
  alignment: 0
  animal: 1
  attacks:
    - damage: 1d4
      mode: bite
      type: physical
  carnivore: 1
  color: brown
  corpse: {}
  geno: 1
  glyph: w
  hitdice: 8
  hostile: 1
  mr: 10
  name: long worm
  nasty: 1
  nolimbs: 1
  notake: 1
  nutrition: 500
  oviparous: 1
  rarity: 2
  resist: {}
  size: gigantic
  slithy: 1
  sound: silent
  speed: 3
  strong: 1
  weight: 1500
lurker above:
  ac: 3
  alignment: 0
  animal: 1
  attacks:
    - damage: 1d8
      mode: engulf
      type: digest
  carnivore: 1
  color: gray
  corpse: {}
  fly: 1
  geno: 1
  glyph: t
  hide: 1
  hitdice: 10
  hostile: 1
  mr: 0
  name: lurker above
  noeyes: 1
  nohead: 1
  nolimbs: 1
  nutrition: 350
  rarity: 2
  resist: {}
  size: huge
  sound: silent
  speed: 3
  stalk: 1
  strong: 1
  weight: 800
lynx:
  ac: 6
  alignment: 0
  animal: 1
  attacks:
    - damage: 1d4
      mode: claw
      type: physical
    - damage: 1d4
      mode: claw
      type: physical
    - damage: 1d10
      mode: bite
      type: physical
  carnivore: 1
  color: cyan
  corpse: {}
  geno: 1
  glyph: f
  hitdice: 5
  hostile: 1
  infravisible: 1
  mr: 0
  name: lynx
  nohands: 1
  nutrition: 300
  rarity: 1
  resist: {}
  size: small
  sound: growl
  speed: 15
  weight: 600
mail daemon:
  ac: 10
  alignment: 0
  breathless: 1
  color: bright_blue
  corpse: {}
  fly: 1
  glyph: '&'
  hitdice: 56
  humanoid: 1
  infravisible: 1
  infravision: 1
  mr: 127
  name: mail daemon
  nocorpse: 1
  nogen: 1
  nopoly: 1
  nutrition: 300
  peaceful: 1
  pois: 1
  resist:
    cold: 1
    elec: 1
    fire: 1
    poison: 1
    sleep: 1
    stone: 1
  see_invis: 1
  size: human
  sound: silent
  speed: 24
  stalk: 1
  swim: 1
  weight: 600
manes:
  ac: 7
  alignment: -7
  attacks:
    - damage: 1d3
      mode: claw
      type: physical
    - damage: 1d3
      mode: claw
      type: physical
    - damage: 1d4
      mode: bite
      type: physical
  color: red
  corpse: {}
  geno: 1
  glyph: i
  hitdice: 1
  hostile: 1
  infravisible: 1
  infravision: 1
  lgroup: 1
  mr: 0
  name: manes
  nocorpse: 1
  nutrition: 100
  pois: 1
  rarity: 1
  resist:
    poison: 1
    sleep: 1
  size: small
  sound: silent
  speed: 3
  stalk: 1
  weight: 100
marilith:
  ac: -6
  alignment: -12
  attacks:
    - damage: 2d4
      mode: weapon
      type: physical
    - damage: 2d4
      mode: weapon
      type: physical
    - damage: 2d4
      mode: claw
      type: physical
    - damage: 2d4
      mode: claw
      type: physical
    - damage: 2d4
      mode: claw
      type: physical
    - damage: 2d4
      mode: claw
      type: physical
  collect: 1
  color: red
  corpse: {}
  demon: 1
  female: 1
  glyph: '&'
  hell: 1
  hitdice: 7
  hostile: 1
  humanoid: 1
  infravisible: 1
  infravision: 1
  mr: 80
  name: marilith
  nasty: 1
  nocorpse: 1
  nutrition: 400
  pois: 1
  rarity: 1
  resist:
    fire: 1
    poison: 1
  see_invis: 1
  size: large
  slithy: 1
  sound: cuss
  speed: 12
  stalk: 1
  weight: 1450
master lich:
  ac: -4
  alignment: -15
  attacks:
    - damage: 3d6
      mode: touch
      type: cold
    - damage: 0d0
      mode: magic
      type: wizardspell
  breathless: 1
  color: magenta
  corpse:
    cold: 1
    fire: 1
  geno: 1
  glyph: L
  hell: 1
  hitdice: 17
  hostile: 1
  humanoid: 1
  infravision: 1
  magic: 1
  mr: 90
  name: master lich
  nocorpse: 1
  nutrition: 100
  pois: 1
  rarity: 1
  regen: 1
  resist:
    cold: 1
    fire: 1
    poison: 1
    sleep: 1
  size: human
  sound: mumble
  speed: 9
  undead: 1
  wantsbook: 1
  weight: 1200
master mind flayer:
  ac: 0
  alignment: -8
  attacks:
    - damage: 1d8
      mode: weapon
      type: physical
    - damage: 2d1
      mode: tentacle
      type: eatbrain
    - damage: 2d1
      mode: tentacle
      type: eatbrain
    - damage: 2d1
      mode: tentacle
      type: eatbrain
    - damage: 2d1
      mode: tentacle
      type: eatbrain
    - damage: 2d1
      mode: tentacle
      type: eatbrain
  collect: 1
  color: magenta
  corpse: {}
  fly: 1
  geno: 1
  glyph: h
  greedy: 1
  hitdice: 13
  hostile: 1
  humanoid: 1
  infravisible: 1
  infravision: 1
  jewels: 1
  mr: 90
  name: master mind flayer
  nasty: 1
  nutrition: 400
  omnivore: 1
  rarity: 1
  resist: {}
  see_invis: 1
  size: human
  sound: hiss
  speed: 12
  weight: 1450
mastodon:
  ac: 5
  alignment: 0
  animal: 1
  attacks:
    - damage: 4d8
      mode: headbutt
      type: physical
    - damage: 4d8
      mode: headbutt
      type: physical
  color: black
  corpse: {}
  geno: 1
  glyph: q
  herbivore: 1
  hitdice: 20
  hostile: 1
  infravisible: 1
  mr: 0
  name: mastodon
  nohands: 1
  nutrition: 800
  rarity: 1
  resist: {}
  size: large
  sound: silent
  speed: 12
  strong: 1
  thick_hide: 1
  weight: 3800
mind flayer:
  ac: 5
  alignment: -8
  attacks:
    - damage: 1d4
      mode: weapon
      type: physical
    - damage: 2d1
      mode: tentacle
      type: eatbrain
    - damage: 2d1
      mode: tentacle
      type: eatbrain
    - damage: 2d1
      mode: tentacle
      type: eatbrain
  collect: 1
  color: magenta
  corpse: {}
  fly: 1
  geno: 1
  glyph: h
  greedy: 1
  hitdice: 9
  hostile: 1
  humanoid: 1
  infravisible: 1
  infravision: 1
  jewels: 1
  mr: 90
  name: mind flayer
  nasty: 1
  nutrition: 400
  omnivore: 1
  rarity: 1
  resist: {}
  see_invis: 1
  size: human
  sound: hiss
  speed: 12
  weight: 1450
minotaur:
  ac: 6
  alignment: 0
  animal: 1
  attacks:
    - damage: 3d10
      mode: claw
      type: physical
    - damage: 3d10
      mode: claw
      type: physical
    - damage: 2d8
      mode: headbutt
      type: physical
  carnivore: 1
  color: brown
  corpse: {}
  geno: 1
  glyph: H
  hitdice: 15
  hostile: 1
  humanoid: 1
  infravisible: 1
  infravision: 1
  mr: 0
  name: minotaur
  nasty: 1
  nogen: 1
  nutrition: 700
  resist: {}
  size: large
  sound: silent
  speed: 15
  strong: 1
  weight: 1500
monk:
  ac: 10
  alignment: 0
  attacks:
    - damage: 1d8
      mode: claw
      type: physical
    - damage: 1d8
      mode: kick
      type: physical
  collect: 1
  color: white
  corpse: {}
  glyph: '@'
  herbivore: 1
  hitdice: 10
  human: 1
  humanoid: 1
  infravisible: 1
  male: 1
  mr: 2
  name: monk
  nogen: 1
  nopoly: 1
  nutrition: 400
  resist: {}
  size: human
  sound: humanoid
  speed: 12
  strong: 1
  weight: 1450
monkey:
  ac: 6
  alignment: 0
  animal: 1
  attacks:
    - damage: 0d0
      mode: claw
      type: stealitem
    - damage: 1d3
      mode: bite
      type: physical
  carnivore: 1
  color: gray
  corpse: {}
  geno: 1
  glyph: Y
  hitdice: 2
  humanoid: 1
  infravisible: 1
  mr: 0
  name: monkey
  nutrition: 50
  rarity: 1
  resist: {}
  size: small
  sound: growl
  speed: 12
  weight: 100
mountain centaur:
  ac: 2
  alignment: -3
  attacks:
    - damage: 1d10
      mode: weapon
      type: physical
    - damage: 1d6
      mode: kick
      type: physical
    - damage: 1d6
      mode: kick
      type: physical
  collect: 1
  color: cyan
  corpse: {}
  geno: 1
  glyph: C
  greedy: 1
  hitdice: 6
  humanoid: 1
  infravisible: 1
  mr: 10
  name: mountain centaur
  nutrition: 500
  omnivore: 1
  rarity: 1
  resist: {}
  size: large
  sound: humanoid
  speed: 20
  strong: 1
  weight: 2550
mountain nymph:
  ac: 9
  alignment: 0
  attacks:
    - damage: 0d0
      mode: claw
      type: stealitem
    - damage: 0d0
      mode: claw
      type: seduce
  collect: 1
  color: brown
  corpse: {}
  female: 1
  geno: 1
  glyph: n
  hitdice: 3
  hostile: 1
  humanoid: 1
  infravisible: 1
  mr: 20
  name: mountain nymph
  nutrition: 300
  rarity: 2
  resist: {}
  size: human
  sound: seduce
  speed: 12
  tport: 1
  weight: 600
mumak:
  ac: 0
  alignment: -2
  animal: 1
  attacks:
    - damage: 4d12
      mode: headbutt
      type: physical
    - damage: 2d6
      mode: bite
      type: physical
  color: gray
  corpse: {}
  geno: 1
  glyph: q
  herbivore: 1
  hitdice: 5
  hostile: 1
  infravisible: 1
  mr: 0
  name: mumak
  nohands: 1
  nutrition: 500
  rarity: 1
  resist: {}
  size: large
  sound: roar
  speed: 9
  strong: 1
  thick_hide: 1
  weight: 2500
nalfeshnee:
  ac: -1
  alignment: -11
  attacks:
    - damage: 1d4
      mode: claw
      type: physical
    - damage: 1d4
      mode: claw
      type: physical
    - damage: 2d4
      mode: bite
      type: physical
    - damage: 0d0
      mode: magic
      type: wizardspell
  color: red
  corpse: {}
  demon: 1
  glyph: '&'
  hell: 1
  hitdice: 11
  hostile: 1
  humanoid: 1
  infravisible: 1
  infravision: 1
  mr: 65
  name: nalfeshnee
  nasty: 1
  nocorpse: 1
  nutrition: 400
  pois: 1
  rarity: 1
  resist:
    fire: 1
    poison: 1
  size: large
  sound: spell
  speed: 9
  stalk: 1
  weight: 1450
neanderthal:
  ac: 10
  alignment: 1
  attacks:
    - damage: 2d4
      mode: weapon
      type: physical
  collect: 1
  color: white
  corpse: {}
  glyph: '@'
  hitdice: 5
  human: 1
  humanoid: 1
  infravisible: 1
  mr: 10
  name: neanderthal
  nogen: 1
  nopoly: 1
  nutrition: 400
  omnivore: 1
  peaceful: 1
  resist: {}
  size: human
  sound: guardian
  speed: 12
  strong: 1
  weight: 1450
newt:
  ac: 8
  alignment: 0
  amphibious: 1
  animal: 1
  attacks:
    - damage: 1d2
      mode: bite
      type: physical
  carnivore: 1
  color: yellow
  corpse: {}
  geno: 1
  glyph: ':'
  hitdice: 0
  hostile: 1
  mr: 0
  name: newt
  nohands: 1
  nutrition: 20
  rarity: 5
  resist: {}
  size: tiny
  sound: silent
  speed: 6
  swim: 1
  weight: 10
ninja:
  ac: 10
  alignment: 3
  attacks:
    - damage: 1d8
      mode: weapon
      type: physical
    - damage: 1d8
      mode: weapon
      type: physical
  collect: 1
  color: white
  corpse: {}
  glyph: '@'
  hitdice: 5
  hostile: 1
  human: 1
  humanoid: 1
  infravisible: 1
  mr: 10
  name: ninja
  nogen: 1
  nopoly: 1
  nutrition: 400
  omnivore: 1
  resist: {}
  size: human
  sound: humanoid
  speed: 12
  strong: 1
  weight: 1450
nurse:
  ac: 0
  alignment: 0
  attacks:
    - damage: 2d6
      mode: claw
      type: heal
  color: white
  corpse:
    poison: 1
  geno: 1
  glyph: '@'
  hitdice: 11
  hostile: 1
  human: 1
  humanoid: 1
  infravisible: 1
  mr: 0
  name: nurse
  nopoly: 1
  nutrition: 400
  omnivore: 1
  rarity: 3
  resist:
    poison: 1
  size: human
  sound: nurse
  speed: 6
  weight: 1450
ochre jelly:
  ac: 8
  acid: 1
  alignment: 0
  amorphous: 1
  attacks:
    - damage: 3d6
      mode: engulf
      type: acid
    - damage: 3d6
      mode: passive
      type: acid
  breathless: 1
  color: brown
  corpse: {}
  geno: 1
  glyph: j
  hitdice: 6
  hostile: 1
  mindless: 1
  mr: 20
  name: ochre jelly
  neuter: 1
  noeyes: 1
  nohead: 1
  nolimbs: 1
  notake: 1
  nutrition: 20
  rarity: 2
  resist:
    acid: 1
    stone: 1
  size: medium
  sound: silent
  speed: 3
  weight: 50
ogre:
  ac: 5
  alignment: -3
  attacks:
    - damage: 2d5
      mode: weapon
      type: physical
  carnivore: 1
  collect: 1
  color: brown
  corpse: {}
  geno: 1
  glyph: O
  greedy: 1
  hitdice: 5
  humanoid: 1
  infravisible: 1
  infravision: 1
  jewels: 1
  mr: 0
  name: ogre
  nutrition: 500
  rarity: 1
  resist: {}
  sgroup: 1
  size: large
  sound: grunt
  speed: 10
  strong: 1
  weight: 1600
ogre king:
  ac: 4
  alignment: -7
  attacks:
    - damage: 3d5
      mode: weapon
      type: physical
  carnivore: 1
  collect: 1
  color: magenta
  corpse: {}
  geno: 1
  glyph: O
  greedy: 1
  hitdice: 9
  humanoid: 1
  infravisible: 1
  infravision: 1
  jewels: 1
  male: 1
  mr: 60
  name: ogre king
  nutrition: 750
  prince: 1
  rarity: 2
  resist: {}
  size: large
  sound: grunt
  speed: 14
  strong: 1
  weight: 1700
ogre lord:
  ac: 3
  alignment: -5
  attacks:
    - damage: 2d6
      mode: weapon
      type: physical
  carnivore: 1
  collect: 1
  color: red
  corpse: {}
  geno: 1
  glyph: O
  greedy: 1
  hitdice: 7
  humanoid: 1
  infravisible: 1
  infravision: 1
  jewels: 1
  lord: 1
  male: 1
  mr: 30
  name: ogre lord
  nutrition: 700
  rarity: 2
  resist: {}
  size: large
  sound: grunt
  speed: 12
  strong: 1
  weight: 1700
orange dragon:
  ac: -1
  alignment: 5
  attacks:
    - damage: 4d25
      mode: breathe
      type: sleep
    - damage: 3d8
      mode: bite
      type: physical
    - damage: 1d4
      mode: claw
      type: physical
    - damage: 1d4
      mode: claw
      type: physical
  carnivore: 1
  color: orange
  corpse:
    sleep: 1
  fly: 1
  geno: 1
  glyph: D
  greedy: 1
  hitdice: 15
  hostile: 1
  jewels: 1
  magic: 1
  mr: 20
  name: orange dragon
  nasty: 1
  nohands: 1
  nutrition: 1500
  oviparous: 1
  rarity: 1
  resist:
    sleep: 1
  see_invis: 1
  size: gigantic
  sound: roar
  speed: 9
  strong: 1
  thick_hide: 1
  weight: 4500
orc:
  ac: 10
  alignment: -3
  attacks:
    - damage: 1d8
      mode: weapon
      type: physical
  collect: 1
  color: red
  corpse: {}
  geno: 1
  glyph: o
  greedy: 1
  hitdice: 1
  humanoid: 1
  infravisible: 1
  infravision: 1
  jewels: 1
  lgroup: 1
  mr: 0
  name: orc
  nogen: 1
  nopoly: 1
  nutrition: 150
  omnivore: 1
  orc: 1
  resist: {}
  size: human
  sound: orc
  speed: 9
  strong: 1
  weight: 850
orc mummy:
  ac: 5
  alignment: -4
  attacks:
    - damage: 1d6
      mode: claw
      type: physical
  breathless: 1
  color: gray
  corpse: {}
  geno: 1
  glyph: M
  greedy: 1
  hitdice: 5
  hostile: 1
  humanoid: 1
  infravision: 1
  jewels: 1
  mindless: 1
  mr: 20
  name: orc mummy
  nocorpse: 1
  nutrition: 75
  orc: 1
  pois: 1
  rarity: 1
  resist:
    cold: 1
    poison: 1
    sleep: 1
  size: human
  sound: silent
  speed: 10
  undead: 1
  weight: 850
orc shaman:
  ac: 5
  alignment: -5
  attacks:
    - damage: 0d0
      mode: magic
      type: wizardspell
  color: bright_blue
  corpse: {}
  geno: 1
  glyph: o
  greedy: 1
  hitdice: 3
  humanoid: 1
  infravisible: 1
  infravision: 1
  jewels: 1
  magic: 1
  mr: 10
  name: orc shaman
  nutrition: 300
  omnivore: 1
  orc: 1
  rarity: 1
  resist: {}
  size: human
  sound: orc
  speed: 9
  strong: 1
  weight: 1000
orc zombie:
  ac: 9
  alignment: -3
  attacks:
    - damage: 1d6
      mode: claw
      type: physical
  breathless: 1
  color: gray
  corpse: {}
  geno: 1
  glyph: Z
  hitdice: 2
  hostile: 1
  humanoid: 1
  infravision: 1
  mindless: 1
  mr: 0
  name: orc zombie
  nocorpse: 1
  nutrition: 75
  orc: 1
  pois: 1
  rarity: 1
  resist:
    cold: 1
    poison: 1
    sleep: 1
  sgroup: 1
  size: human
  sound: silent
  speed: 6
  stalk: 1
  undead: 1
  weight: 850
orc-captain:
  ac: 10
  alignment: -5
  attacks:
    - damage: 2d4
      mode: weapon
      type: physical
    - damage: 2d4
      mode: weapon
      type: physical
  collect: 1
  color: magenta
  corpse: {}
  geno: 1
  glyph: o
  greedy: 1
  hitdice: 5
  humanoid: 1
  infravisible: 1
  infravision: 1
  jewels: 1
  mr: 0
  name: orc-captain
  nutrition: 350
  omnivore: 1
  orc: 1
  rarity: 1
  resist: {}
  size: human
  sound: orc
  speed: 5
  strong: 1
  weight: 1350
owlbear:
  ac: 5
  alignment: 0
  animal: 1
  attacks:
    - damage: 1d6
      mode: claw
      type: physical
    - damage: 1d6
      mode: claw
      type: physical
    - damage: 2d8
      mode: crush
      type: physical
  carnivore: 1
  color: brown
  corpse: {}
  geno: 1
  glyph: Y
  hitdice: 5
  hostile: 1
  humanoid: 1
  infravisible: 1
  mr: 0
  name: owlbear
  nasty: 1
  nutrition: 700
  rarity: 3
  resist: {}
  size: large
  sound: roar
  speed: 12
  strong: 1
  weight: 1700
page:
  ac: 10
  alignment: 3
  attacks:
    - damage: 1d6
      mode: weapon
      type: physical
    - damage: 1d6
      mode: weapon
      type: physical
  collect: 1
  color: white
  corpse: {}
  glyph: '@'
  hitdice: 5
  human: 1
  humanoid: 1
  infravisible: 1
  mr: 10
  name: page
  nogen: 1
  nopoly: 1
  nutrition: 400
  omnivore: 1
  peaceful: 1
  resist: {}
  size: human
  sound: guardian
  speed: 12
  strong: 1
  weight: 1450
panther:
  ac: 6
  alignment: 0
  animal: 1
  attacks:
    - damage: 1d6
      mode: claw
      type: physical
    - damage: 1d6
      mode: claw
      type: physical
    - damage: 1d10
      mode: bite
      type: physical
  carnivore: 1
  color: black
  corpse: {}
  geno: 1
  glyph: f
  hitdice: 5
  hostile: 1
  infravisible: 1
  mr: 0
  name: panther
  nohands: 1
  nutrition: 300
  rarity: 1
  resist: {}
  size: large
  sound: growl
  speed: 15
  weight: 600
paper golem:
  ac: 10
  alignment: 0
  attacks:
    - damage: 1d3
      mode: claw
      type: physical
  breathless: 1
  color: white
  corpse: {}
  glyph: "'"
  hitdice: 3
  hostile: 1
  humanoid: 1
  mindless: 1
  mr: 0
  name: paper golem
  neuter: 1
  nocorpse: 1
  nutrition: 0
  rarity: 1
  resist:
    poison: 1
    sleep: 1
  size: large
  sound: silent
  speed: 12
  weight: 400
piranha:
  ac: 4
  alignment: 0
  amphibious: 1
  animal: 1
  attacks:
    - damage: 2d6
      mode: bite
      type: physical
  carnivore: 1
  color: red
  corpse: {}
  geno: 1
  glyph: ;
  hitdice: 5
  hostile: 1
  mr: 0
  name: piranha
  nogen: 1
  nolimbs: 1
  notake: 1
  nutrition: 30
  oviparous: 1
  resist: {}
  sgroup: 1
  size: small
  slithy: 1
  sound: silent
  speed: 12
  swim: 1
  weight: 60
pit fiend:
  ac: -3
  alignment: -13
  attacks:
    - damage: 4d2
      mode: weapon
      type: physical
    - damage: 4d2
      mode: weapon
      type: physical
    - damage: 2d4
      mode: crush
      type: physical
  collect: 1
  color: red
  corpse: {}
  demon: 1
  glyph: '&'
  hell: 1
  hitdice: 13
  hostile: 1
  infravisible: 1
  infravision: 1
  mr: 65
  name: pit fiend
  nasty: 1
  nocorpse: 1
  nutrition: 400
  pois: 1
  rarity: 2
  resist:
    fire: 1
    poison: 1
  see_invis: 1
  size: large
  sound: growl
  speed: 6
  stalk: 1
  weight: 1450
pit viper:
  ac: 2
  alignment: 0
  animal: 1
  attacks:
    - damage: 1d4
      mode: bite
      type: poison
    - damage: 1d4
      mode: bite
      type: poison
  carnivore: 1
  color: blue
  conceal: 1
  corpse:
    poison: 1
  geno: 1
  glyph: S
  hitdice: 6
  hostile: 1
  infravision: 1
  mr: 0
  name: pit viper
  nolimbs: 1
  notake: 1
  nutrition: 60
  oviparous: 1
  pois: 1
  rarity: 1
  resist:
    poison: 1
  size: medium
  slithy: 1
  sound: hiss
  speed: 15
  swim: 1
  weight: 100
plains centaur:
  ac: 4
  alignment: 0
  attacks:
    - damage: 1d6
      mode: weapon
      type: physical
    - damage: 1d6
      mode: kick
      type: physical
  collect: 1
  color: brown
  corpse: {}
  geno: 1
  glyph: C
  greedy: 1
  hitdice: 4
  humanoid: 1
  infravisible: 1
  mr: 0
  name: plains centaur
  nutrition: 500
  omnivore: 1
  rarity: 1
  resist: {}
  size: large
  sound: humanoid
  speed: 18
  strong: 1
  weight: 2500
pony:
  ac: 6
  alignment: 0
  animal: 1
  attacks:
    - damage: 1d6
      mode: kick
      type: physical
    - damage: 1d2
      mode: bite
      type: physical
  color: brown
  corpse: {}
  domestic: 1
  geno: 1
  glyph: u
  herbivore: 1
  hitdice: 3
  infravisible: 1
  mr: 0
  name: pony
  nohands: 1
  nutrition: 250
  rarity: 2
  resist: {}
  size: medium
  sound: neigh
  speed: 16
  strong: 1
  wander: 1
  weight: 1300
priest:
  ac: 10
  alignment: 0
  attacks:
    - damage: 1d6
      mode: weapon
      type: physical
  collect: 1
  color: white
  corpse: {}
  glyph: '@'
  hitdice: 10
  human: 1
  humanoid: 1
  infravisible: 1
  male: 1
  mr: 2
  name: priest
  nogen: 1
  nopoly: 1
  nutrition: 400
  omnivore: 1
  resist: {}
  size: human
  sound: humanoid
  speed: 12
  strong: 1
  weight: 1450
priestess:
  ac: 10
  alignment: 0
  attacks:
    - damage: 1d6
      mode: weapon
      type: physical
  collect: 1
  color: white
  corpse: {}
  female: 1
  glyph: '@'
  hitdice: 10
  human: 1
  humanoid: 1
  infravisible: 1
  mr: 2
  name: priestess
  nogen: 1
  nopoly: 1
  nutrition: 400
  omnivore: 1
  resist: {}
  size: human
  sound: humanoid
  speed: 12
  strong: 1
  weight: 1450
prisoner:
  ac: 10
  alignment: 0
  attacks:
    - damage: 1d6
      mode: weapon
      type: physical
  close: 1
  collect: 1
  color: white
  corpse: {}
  glyph: '@'
  hitdice: 12
  human: 1
  humanoid: 1
  infravisible: 1
  mr: 0
  name: prisoner
  nogen: 1
  nopoly: 1
  nutrition: 400
  omnivore: 1
  peaceful: 1
  resist: {}
  size: human
  sound: djinni
  speed: 12
  strong: 1
  weight: 1450
purple worm:
  ac: 6
  alignment: 0
  animal: 1
  attacks:
    - damage: 2d8
      mode: bite
      type: physical
    - damage: 1d10
      mode: engulf
      type: digest
  carnivore: 1
  color: magenta
  corpse: {}
  geno: 1
  glyph: w
  hitdice: 15
  hostile: 1
  mr: 20
  name: purple worm
  nasty: 1
  nolimbs: 1
  nutrition: 700
  oviparous: 1
  rarity: 2
  resist: {}
  size: gigantic
  slithy: 1
  sound: silent
  speed: 9
  strong: 1
  weight: 2700
pyrolisk:
  ac: 6
  alignment: 0
  animal: 1
  attacks:
    - damage: 2d6
      mode: gaze
      type: fire
  color: red
  corpse:
    fire: 1
    poison: 1
  geno: 1
  glyph: c
  hitdice: 6
  hostile: 1
  infravisible: 1
  mr: 30
  name: pyrolisk
  nohands: 1
  nutrition: 30
  omnivore: 1
  oviparous: 1
  rarity: 1
  resist:
    fire: 1
    poison: 1
  size: small
  sound: hiss
  speed: 6
  weight: 30
python:
  ac: 5
  alignment: 0
  animal: 1
  attacks:
    - damage: 1d4
      mode: bite
      type: physical
    - damage: 0d0
      mode: touch
      type: physical
    - damage: 1d4
      mode: crush
      type: wrap
    - damage: 2d4
      mode: crush
      type: physical
  carnivore: 1
  color: magenta
  corpse: {}
  geno: 1
  glyph: S
  hitdice: 6
  hostile: 1
  infravision: 1
  mr: 0
  name: python
  nolimbs: 1
  notake: 1
  nutrition: 100
  oviparous: 1
  rarity: 1
  resist: {}
  size: large
  slithy: 1
  sound: hiss
  speed: 3
  strong: 1
  swim: 1
  weight: 250
quantum mechanic:
  ac: 3
  alignment: 0
  attacks:
    - damage: 1d4
      mode: claw
      type: teleport
  color: cyan
  corpse: {}
  geno: 1
  glyph: Q
  hitdice: 7
  hostile: 1
  humanoid: 1
  infravisible: 1
  mr: 10
  name: quantum mechanic
  nutrition: 20
  omnivore: 1
  pois: 1
  rarity: 3
  resist:
    poison: 1
  size: human
  sound: humanoid
  speed: 12
  tport: 1
  weight: 1450
quasit:
  ac: 2
  alignment: -7
  attacks:
    - damage: 1d2
      mode: claw
      type: poisondex
    - damage: 1d2
      mode: claw
      type: poisondex
    - damage: 1d4
      mode: bite
      type: physical
  color: blue
  corpse:
    poison: 1
  geno: 1
  glyph: i
  hitdice: 3
  infravisible: 1
  infravision: 1
  mr: 20
  name: quasit
  nutrition: 200
  rarity: 2
  regen: 1
  resist:
    poison: 1
  size: small
  sound: silent
  speed: 15
  stalk: 1
  weight: 200
queen bee:
  ac: -4
  alignment: 0
  animal: 1
  attacks:
    - damage: 1d8
      mode: sting
      type: poison
  color: magenta
  corpse:
    poison: 1
  female: 1
  fly: 1
  geno: 1
  glyph: a
  hitdice: 9
  hostile: 1
  mr: 0
  name: queen bee
  nogen: 1
  nohands: 1
  nutrition: 5
  oviparous: 1
  pois: 1
  prince: 1
  resist:
    poison: 1
  size: tiny
  sound: buzz
  speed: 24
  weight: 1
quivering blob:
  ac: 8
  alignment: 0
  attacks:
    - damage: 1d8
      mode: touch
      type: physical
  color: white
  corpse:
    poison: 1
  geno: 1
  glyph: b
  hitdice: 5
  hostile: 1
  mindless: 1
  mr: 0
  name: quivering blob
  neuter: 1
  noeyes: 1
  nohead: 1
  nolimbs: 1
  nutrition: 100
  rarity: 2
  resist:
    poison: 1
    sleep: 1
  size: small
  sound: silent
  speed: 1
  wander: 1
  weight: 200
rabid rat:
  ac: 6
  alignment: 0
  animal: 1
  attacks:
    - damage: 2d4
      mode: bite
      type: poisoncon
  carnivore: 1
  color: brown
  corpse: {}
  geno: 1
  glyph: r
  hitdice: 2
  hostile: 1
  infravisible: 1
  mr: 0
  name: rabid rat
  nohands: 1
  nutrition: 5
  pois: 1
  rarity: 1
  resist:
    poison: 1
  size: tiny
  sound: sqeek
  speed: 12
  weight: 30
ranger:
  ac: 10
  alignment: -3
  attacks:
    - damage: 1d4
      mode: weapon
      type: physical
  collect: 1
  color: white
  corpse: {}
  glyph: '@'
  hitdice: 10
  human: 1
  humanoid: 1
  infravisible: 1
  mr: 2
  name: ranger
  nogen: 1
  nopoly: 1
  nutrition: 400
  omnivore: 1
  resist: {}
  size: human
  sound: humanoid
  speed: 12
  strong: 1
  weight: 1450
raven:
  ac: 6
  alignment: 0
  animal: 1
  attacks:
    - damage: 1d6
      mode: bite
      type: physical
    - damage: 1d6
      mode: claw
      type: blind
  carnivore: 1
  color: black
  corpse: {}
  fly: 1
  geno: 1
  glyph: B
  hitdice: 4
  hostile: 1
  infravisible: 1
  mr: 0
  name: raven
  nohands: 1
  nutrition: 20
  rarity: 2
  resist: {}
  size: small
  sound: sqawk
  speed: 20
  wander: 1
  weight: 40
red dragon:
  ac: -1
  alignment: -4
  attacks:
    - damage: 6d6
      mode: breathe
      type: fire
    - damage: 3d8
      mode: bite
      type: physical
    - damage: 1d4
      mode: claw
      type: physical
    - damage: 1d4
      mode: claw
      type: physical
  carnivore: 1
  color: red
  corpse:
    fire: 1
  fly: 1
  geno: 1
  glyph: D
  greedy: 1
  hitdice: 15
  hostile: 1
  infravisible: 1
  jewels: 1
  magic: 1
  mr: 20
  name: red dragon
  nasty: 1
  nohands: 1
  nutrition: 1500
  oviparous: 1
  rarity: 1
  resist:
    fire: 1
  see_invis: 1
  size: gigantic
  sound: roar
  speed: 9
  strong: 1
  thick_hide: 1
  weight: 4500
red mold:
  ac: 9
  alignment: 0
  attacks:
    - damage: 0d4
      mode: passive
      type: fire
  breathless: 1
  color: red
  corpse:
    fire: 1
    poison: 1
  geno: 1
  glyph: F
  hitdice: 1
  hostile: 1
  infravisible: 1
  mindless: 1
  mr: 0
  name: red mold
  neuter: 1
  noeyes: 1
  nohead: 1
  nolimbs: 1
  notake: 1
  nutrition: 30
  rarity: 1
  resist:
    fire: 1
    poison: 1
  size: small
  sound: silent
  speed: 0
  weight: 50
red naga:
  ac: 4
  alignment: -4
  attacks:
    - damage: 2d4
      mode: bite
      type: physical
    - damage: 2d6
      mode: breathe
      type: fire
  color: red
  corpse:
    fire: 1
    poison: 1
  geno: 1
  glyph: N
  hitdice: 6
  infravisible: 1
  mr: 0
  name: red naga
  nolimbs: 1
  notake: 1
  nutrition: 400
  omnivore: 1
  oviparous: 1
  rarity: 1
  resist:
    fire: 1
    poison: 1
  size: huge
  slithy: 1
  sound: mumble
  speed: 12
  strong: 1
  thick_hide: 1
  weight: 2600
red naga hatchling:
  ac: 6
  alignment: 0
  attacks:
    - damage: 1d4
      mode: bite
      type: physical
  color: red
  corpse:
    fire: 1
    poison: 1
  geno: 1
  glyph: N
  hitdice: 3
  infravisible: 1
  mr: 0
  name: red naga hatchling
  nolimbs: 1
  notake: 1
  nutrition: 100
  omnivore: 1
  resist:
    fire: 1
    poison: 1
  size: large
  slithy: 1
  sound: mumble
  speed: 10
  strong: 1
  thick_hide: 1
  weight: 500
rock mole:
  ac: 0
  alignment: 0
  animal: 1
  attacks:
    - damage: 1d6
      mode: bite
      type: physical
  collect: 1
  color: gray
  corpse: {}
  geno: 1
  glyph: r
  greedy: 1
  hitdice: 3
  hostile: 1
  infravisible: 1
  jewels: 1
  metallivore: 1
  mr: 20
  name: rock mole
  nohands: 1
  nutrition: 30
  rarity: 2
  resist: {}
  size: small
  sound: silent
  speed: 3
  tunnel: 1
  weight: 30
rock piercer:
  ac: 3
  alignment: 0
  animal: 1
  attacks:
    - damage: 2d6
      mode: bite
      type: physical
  carnivore: 1
  cling: 1
  color: gray
  corpse: {}
  geno: 1
  glyph: p
  hide: 1
  hitdice: 3
  hostile: 1
  mr: 0
  name: rock piercer
  noeyes: 1
  nolimbs: 1
  notake: 1
  nutrition: 200
  rarity: 4
  resist: {}
  size: small
  sound: silent
  speed: 1
  weight: 200
rock troll:
  ac: 0
  alignment: -3
  attacks:
    - damage: 3d6
      mode: weapon
      type: physical
    - damage: 2d8
      mode: claw
      type: physical
    - damage: 2d6
      mode: bite
      type: physical
  carnivore: 1
  collect: 1
  color: cyan
  corpse: {}
  geno: 1
  glyph: T
  hitdice: 9
  hostile: 1
  humanoid: 1
  infravisible: 1
  infravision: 1
  mr: 0
  name: rock troll
  nutrition: 300
  rarity: 1
  regen: 1
  resist: {}
  size: large
  sound: grunt
  speed: 12
  stalk: 1
  strong: 1
  weight: 1200
rogue:
  ac: 10
  alignment: -3
  attacks:
    - damage: 1d6
      mode: weapon
      type: physical
    - damage: 1d6
      mode: weapon
      type: physical
  collect: 1
  color: white
  corpse: {}
  glyph: '@'
  greedy: 1
  hitdice: 10
  human: 1
  humanoid: 1
  infravisible: 1
  jewels: 1
  mr: 1
  name: rogue
  nogen: 1
  nopoly: 1
  nutrition: 400
  omnivore: 1
  resist: {}
  size: human
  sound: humanoid
  speed: 12
  strong: 1
  weight: 1450
rope golem:
  ac: 8
  alignment: 0
  attacks:
    - damage: 1d4
      mode: claw
      type: physical
    - damage: 1d4
      mode: claw
      type: physical
    - damage: 6d1
      mode: crush
      type: physical
  breathless: 1
  color: brown
  corpse: {}
  glyph: "'"
  hitdice: 4
  hostile: 1
  humanoid: 1
  mindless: 1
  mr: 0
  name: rope golem
  neuter: 1
  nocorpse: 1
  nutrition: 0
  rarity: 1
  resist:
    poison: 1
    sleep: 1
  size: large
  sound: silent
  speed: 9
  weight: 450
roshi:
  ac: 10
  alignment: 3
  attacks:
    - damage: 1d8
      mode: weapon
      type: physical
    - damage: 1d8
      mode: weapon
      type: physical
  collect: 1
  color: white
  corpse: {}
  glyph: '@'
  hitdice: 5
  human: 1
  humanoid: 1
  infravisible: 1
  mr: 10
  name: roshi
  nogen: 1
  nopoly: 1
  nutrition: 400
  omnivore: 1
  peaceful: 1
  resist: {}
  size: human
  sound: guardian
  speed: 12
  strong: 1
  weight: 1450
rothe:
  ac: 7
  alignment: 0
  animal: 1
  attacks:
    - damage: 1d3
      mode: claw
      type: physical
    - damage: 1d3
      mode: bite
      type: physical
    - damage: 1d8
      mode: bite
      type: physical
  color: brown
  corpse: {}
  geno: 1
  glyph: q
  hitdice: 2
  hostile: 1
  infravisible: 1
  mr: 0
  name: rothe
  nohands: 1
  nutrition: 100
  omnivore: 1
  rarity: 4
  resist: {}
  sgroup: 1
  size: large
  sound: silent
  speed: 9
  weight: 400
rust monster:
  ac: 2
  alignment: 0
  animal: 1
  attacks:
    - damage: 0d0
      mode: touch
      type: rust
    - damage: 0d0
      mode: touch
      type: rust
    - damage: 0d0
      mode: passive
      type: rust
  color: brown
  corpse: {}
  geno: 1
  glyph: R
  hitdice: 5
  hostile: 1
  infravisible: 1
  metallivore: 1
  mr: 0
  name: rust monster
  nohands: 1
  nutrition: 250
  rarity: 2
  resist: {}
  size: medium
  sound: silent
  speed: 18
  swim: 1
  weight: 1000
salamander:
  ac: -1
  alignment: -9
  attacks:
    - damage: 2d8
      mode: weapon
      type: physical
    - damage: 1d6
      mode: touch
      type: fire
    - damage: 2d6
      mode: crush
      type: physical
    - damage: 3d6
      mode: crush
      type: fire
  collect: 1
  color: orange
  corpse:
    fire: 1
  glyph: ':'
  hell: 1
  hitdice: 8
  hostile: 1
  humanoid: 1
  infravisible: 1
  magic: 1
  mr: 0
  name: salamander
  nutrition: 400
  pois: 1
  rarity: 1
  resist:
    fire: 1
    sleep: 1
  size: human
  slithy: 1
  sound: mumble
  speed: 12
  stalk: 1
  thick_hide: 1
  weight: 1500
samurai:
  ac: 10
  alignment: 3
  attacks:
    - damage: 1d8
      mode: weapon
      type: physical
    - damage: 1d8
      mode: weapon
      type: physical
  collect: 1
  color: white
  corpse: {}
  glyph: '@'
  hitdice: 10
  human: 1
  humanoid: 1
  infravisible: 1
  mr: 1
  name: samurai
  nogen: 1
  nopoly: 1
  nutrition: 400
  omnivore: 1
  resist: {}
  size: human
  sound: humanoid
  speed: 12
  strong: 1
  weight: 1450
sandestin:
  ac: 4
  alignment: -5
  attacks:
    - damage: 2d6
      mode: weapon
      type: physical
    - damage: 2d6
      mode: weapon
      type: physical
  collect: 1
  color: gray
  corpse: {}
  glyph: '&'
  hell: 1
  hitdice: 13
  humanoid: 1
  infravisible: 1
  infravision: 1
  mr: 60
  name: sandestin
  nocorpse: 1
  nopoly: 1
  nutrition: 400
  rarity: 1
  resist:
    stone: 1
  size: human
  sound: cuss
  speed: 12
  stalk: 1
  strong: 1
  weight: 1500
sasquatch:
  ac: 6
  alignment: 2
  animal: 1
  attacks:
    - damage: 1d6
      mode: claw
      type: physical
    - damage: 1d6
      mode: claw
      type: physical
    - damage: 1d8
      mode: kick
      type: physical
  color: gray
  corpse: {}
  geno: 1
  glyph: Y
  hitdice: 7
  humanoid: 1
  infravisible: 1
  mr: 0
  name: sasquatch
  nutrition: 750
  omnivore: 1
  rarity: 1
  resist: {}
  see_invis: 1
  size: large
  sound: growl
  speed: 15
  strong: 1
  weight: 1550
scorpion:
  ac: 3
  alignment: 0
  animal: 1
  attacks:
    - damage: 1d2
      mode: claw
      type: physical
    - damage: 1d2
      mode: claw
      type: physical
    - damage: 1d4
      mode: sting
      type: poison
  carnivore: 1
  color: red
  conceal: 1
  corpse:
    poison: 1
  geno: 1
  glyph: s
  hitdice: 5
  hostile: 1
  mr: 0
  name: scorpion
  nohands: 1
  nutrition: 100
  oviparous: 1
  pois: 1
  rarity: 2
  resist:
    poison: 1
  size: small
  sound: silent
  speed: 15
  weight: 50
sergeant:
  ac: 10
  alignment: -3
  attacks:
    - damage: 2d6
      mode: weapon
      type: physical
  collect: 1
  color: red
  corpse: {}
  geno: 1
  glyph: '@'
  hitdice: 8
  hostile: 1
  human: 1
  humanoid: 1
  infravisible: 1
  merc: 1
  mr: 5
  name: sergeant
  nopoly: 1
  nutrition: 400
  omnivore: 1
  rarity: 1
  resist: {}
  sgroup: 1
  size: human
  sound: soldier
  speed: 10
  stalk: 1
  strong: 1
  weight: 1450
sewer rat:
  ac: 7
  alignment: 0
  animal: 1
  attacks:
    - damage: 1d3
      mode: bite
      type: physical
  carnivore: 1
  color: brown
  corpse: {}
  geno: 1
  glyph: r
  hitdice: 0
  hostile: 1
  infravisible: 1
  mr: 0
  name: sewer rat
  nohands: 1
  nutrition: 12
  rarity: 1
  resist: {}
  sgroup: 1
  size: tiny
  sound: sqeek
  speed: 12
  weight: 20
shade:
  ac: 10
  alignment: 0
  attacks:
    - damage: 2d6
      mode: touch
      type: paralyze
    - damage: 1d6
      mode: touch
      type: slow
  breathless: 1
  color: black
  corpse: {}
  fly: 1
  glyph: X
  hitdice: 12
  hostile: 1
  humanoid: 1
  infravision: 1
  mr: 0
  name: shade
  nasty: 1
  nocorpse: 1
  nogen: 1
  nopoly: 1
  nutrition: 0
  resist:
    cold: 1
    disint: 1
    poison: 1
    sleep: 1
    stone: 1
  see_invis: 1
  size: human
  sound: wail
  speed: 10
  stalk: 1
  undead: 1
  unsolid: 1
  wallwalk: 1
  wander: 1
  weight: 1450
shark:
  ac: 2
  alignment: 0
  amphibious: 1
  animal: 1
  attacks:
    - damage: 5d6
      mode: bite
      type: physical
  carnivore: 1
  color: gray
  corpse: {}
  geno: 1
  glyph: ;
  hitdice: 7
  hostile: 1
  mr: 0
  name: shark
  nogen: 1
  nolimbs: 1
  notake: 1
  nutrition: 350
  oviparous: 1
  resist: {}
  size: large
  slithy: 1
  sound: silent
  speed: 12
  swim: 1
  thick_hide: 1
  weight: 500
shocking sphere:
  ac: 4
  alignment: 0
  attacks:
    - damage: 4d6
      mode: explode
      type: electricity
  breathless: 1
  color: bright_blue
  corpse:
    elec: 1
  fly: 1
  geno: 1
  glyph: e
  hitdice: 6
  hostile: 1
  infravisible: 1
  mindless: 1
  mr: 0
  name: shocking sphere
  neuter: 1
  nocorpse: 1
  nohead: 1
  nolimbs: 1
  nutrition: 10
  rarity: 2
  resist:
    elec: 1
  size: small
  sound: silent
  speed: 13
  weight: 10
shopkeeper:
  ac: 0
  alignment: 0
  attacks:
    - damage: 4d4
      mode: weapon
      type: physical
    - damage: 4d4
      mode: weapon
      type: physical
  collect: 1
  color: white
  corpse: {}
  glyph: '@'
  hitdice: 12
  human: 1
  humanoid: 1
  infravisible: 1
  magic: 1
  mr: 50
  name: shopkeeper
  nogen: 1
  nopoly: 1
  nutrition: 400
  omnivore: 1
  peaceful: 1
  resist: {}
  size: human
  sound: sell
  speed: 18
  strong: 1
  weight: 1450
shrieker:
  ac: 7
  alignment: 0
  breathless: 1
  color: magenta
  corpse:
    poison: 1
  geno: 1
  glyph: F
  hitdice: 3
  hostile: 1
  mindless: 1
  mr: 0
  name: shrieker
  neuter: 1
  noeyes: 1
  nohead: 1
  nolimbs: 1
  notake: 1
  nutrition: 100
  rarity: 1
  resist:
    poison: 1
  size: small
  sound: shriek
  speed: 1
  weight: 100
silver dragon:
  ac: -1
  alignment: 4
  attacks:
    - damage: 4d6
      mode: breathe
      type: cold
    - damage: 3d8
      mode: bite
      type: physical
    - damage: 1d4
      mode: claw
      type: physical
    - damage: 1d4
      mode: claw
      type: physical
  carnivore: 1
  color: gray
  corpse: {}
  fly: 1
  geno: 1
  glyph: D
  greedy: 1
  hitdice: 15
  hostile: 1
  jewels: 1
  magic: 1
  mr: 20
  name: silver dragon
  nasty: 1
  nohands: 1
  nutrition: 1500
  oviparous: 1
  rarity: 1
  resist:
    cold: 1
  see_invis: 1
  size: gigantic
  sound: roar
  speed: 9
  strong: 1
  thick_hide: 1
  weight: 4500
skeleton:
  ac: 4
  alignment: 0
  attacks:
    - damage: 2d6
      mode: weapon
      type: physical
    - damage: 1d6
      mode: touch
      type: slow
  breathless: 1
  collect: 1
  color: white
  corpse: {}
  glyph: Z
  hitdice: 12
  hostile: 1
  humanoid: 1
  infravision: 1
  mindless: 1
  mr: 0
  name: skeleton
  nasty: 1
  nocorpse: 1
  nogen: 1
  nutrition: 5
  resist:
    cold: 1
    poison: 1
    sleep: 1
    stone: 1
  size: human
  sound: bones
  speed: 8
  strong: 1
  thick_hide: 1
  undead: 1
  wander: 1
  weight: 300
small mimic:
  ac: 7
  alignment: 0
  amorphous: 1
  animal: 1
  attacks:
    - damage: 3d4
      mode: claw
      type: physical
  breathless: 1
  carnivore: 1
  color: brown
  corpse: {}
  geno: 1
  glyph: m
  hide: 1
  hitdice: 7
  hostile: 1
  mr: 0
  name: small mimic
  noeyes: 1
  nohead: 1
  nolimbs: 1
  nutrition: 200
  rarity: 2
  resist:
    acid: 1
  size: medium
  sound: silent
  speed: 3
  thick_hide: 1
  weight: 300
snake:
  ac: 3
  alignment: 0
  animal: 1
  attacks:
    - damage: 1d6
      mode: bite
      type: poison
  carnivore: 1
  color: brown
  conceal: 1
  corpse:
    poison: 1
  geno: 1
  glyph: S
  hitdice: 4
  hostile: 1
  mr: 0
  name: snake
  nolimbs: 1
  notake: 1
  nutrition: 80
  oviparous: 1
  pois: 1
  rarity: 2
  resist:
    poison: 1
  size: small
  slithy: 1
  sound: hiss
  speed: 15
  swim: 1
  weight: 100
soldier:
  ac: 10
  alignment: -2
  attacks:
    - damage: 1d8
      mode: weapon
      type: physical
  collect: 1
  color: gray
  corpse: {}
  geno: 1
  glyph: '@'
  hitdice: 6
  hostile: 1
  human: 1
  humanoid: 1
  infravisible: 1
  merc: 1
  mr: 0
  name: soldier
  nopoly: 1
  nutrition: 400
  omnivore: 1
  rarity: 1
  resist: {}
  sgroup: 1
  size: human
  sound: soldier
  speed: 10
  stalk: 1
  strong: 1
  weight: 1450
soldier ant:
  ac: 3
  alignment: 0
  animal: 1
  attacks:
    - damage: 2d4
      mode: bite
      type: physical
    - damage: 3d4
      mode: sting
      type: poison
  carnivore: 1
  color: blue
  corpse:
    poison: 1
  geno: 1
  glyph: a
  hitdice: 3
  hostile: 1
  mr: 0
  name: soldier ant
  nohands: 1
  nutrition: 5
  oviparous: 1
  pois: 1
  rarity: 2
  resist:
    poison: 1
  sgroup: 1
  size: tiny
  sound: silent
  speed: 18
  weight: 20
spotted jelly:
  ac: 8
  acid: 1
  alignment: 0
  amorphous: 1
  attacks:
    - damage: 0d6
      mode: passive
      type: acid
  breathless: 1
  color: green
  corpse: {}
  geno: 1
  glyph: j
  hitdice: 5
  hostile: 1
  mindless: 1
  mr: 10
  name: spotted jelly
  neuter: 1
  noeyes: 1
  nohead: 1
  nolimbs: 1
  notake: 1
  nutrition: 20
  rarity: 1
  resist:
    acid: 1
    stone: 1
  size: medium
  sound: silent
  speed: 0
  weight: 50
stalker:
  ac: 3
  alignment: 0
  animal: 1
  attacks:
    - damage: 4d4
      mode: claw
      type: physical
  color: white
  corpse: {}
  fly: 1
  geno: 1
  glyph: E
  hitdice: 8
  hostile: 1
  infravision: 1
  mr: 0
  name: stalker
  nutrition: 400
  rarity: 3
  resist: {}
  see_invis: 1
  size: large
  sound: silent
  speed: 12
  stalk: 1
  strong: 1
  wander: 1
  weight: 900
steam vortex:
  ac: 2
  alignment: 0
  attacks:
    - damage: 1d8
      mode: engulf
      type: fire
  breathless: 1
  color: blue
  corpse: {}
  fly: 1
  geno: 1
  glyph: v
  hell: 1
  hitdice: 7
  hostile: 1
  infravisible: 1
  mindless: 1
  mr: 30
  name: steam vortex
  neuter: 1
  nocorpse: 1
  noeyes: 1
  nohead: 1
  nolimbs: 1
  nutrition: 0
  rarity: 2
  resist:
    fire: 1
    poison: 1
    sleep: 1
    stone: 1
  size: huge
  sound: silent
  speed: 22
  unsolid: 1
  weight: 0
stone giant:
  ac: 0
  alignment: 2
  attacks:
    - damage: 2d10
      mode: weapon
      type: physical
  carnivore: 1
  collect: 1
  color: gray
  corpse: {}
  geno: 1
  giant: 1
  glyph: H
  hitdice: 6
  humanoid: 1
  infravisible: 1
  infravision: 1
  jewels: 1
  mr: 0
  name: stone giant
  nasty: 1
  nutrition: 750
  rarity: 1
  resist: {}
  rockthrow: 1
  sgroup: 1
  size: huge
  sound: boast
  speed: 6
  strong: 1
  weight: 2250
stone golem:
  ac: 5
  alignment: 0
  attacks:
    - damage: 3d8
      mode: claw
      type: physical
  breathless: 1
  color: gray
  corpse: {}
  glyph: "'"
  hitdice: 14
  hostile: 1
  humanoid: 1
  mindless: 1
  mr: 50
  name: stone golem
  nocorpse: 1
  nutrition: 0
  rarity: 1
  resist:
    poison: 1
    sleep: 1
    stone: 1
  size: large
  sound: silent
  speed: 6
  strong: 1
  thick_hide: 1
  weight: 1900
storm giant:
  ac: 3
  alignment: -3
  attacks:
    - damage: 2d12
      mode: weapon
      type: physical
  carnivore: 1
  collect: 1
  color: blue
  corpse:
    elec: 1
  geno: 1
  giant: 1
  glyph: H
  hitdice: 16
  humanoid: 1
  infravisible: 1
  infravision: 1
  jewels: 1
  mr: 10
  name: storm giant
  nasty: 1
  nutrition: 750
  rarity: 1
  resist:
    elec: 1
  rockthrow: 1
  sgroup: 1
  size: huge
  sound: boast
  speed: 12
  strong: 1
  weight: 2250
straw golem:
  ac: 10
  alignment: 0
  attacks:
    - damage: 1d2
      mode: claw
      type: physical
    - damage: 1d2
      mode: claw
      type: physical
  breathless: 1
  color: yellow
  corpse: {}
  glyph: "'"
  hitdice: 3
  hostile: 1
  humanoid: 1
  mindless: 1
  mr: 0
  name: straw golem
  neuter: 1
  nocorpse: 1
  nutrition: 0
  rarity: 1
  resist:
    poison: 1
    sleep: 1
  size: large
  sound: silent
  speed: 12
  weight: 400
student:
  ac: 10
  alignment: 3
  attacks:
    - damage: 1d6
      mode: weapon
      type: physical
  collect: 1
  color: white
  corpse: {}
  glyph: '@'
  hitdice: 5
  human: 1
  humanoid: 1
  infravisible: 1
  mr: 10
  name: student
  needpick: 1
  nogen: 1
  nopoly: 1
  nutrition: 400
  omnivore: 1
  peaceful: 1
  resist: {}
  size: human
  sound: guardian
  speed: 12
  strong: 1
  tunnel: 1
  weight: 1450
succubus:
  ac: 0
  alignment: -9
  attacks:
    - damage: 0d0
      mode: bite
      type: succubus
    - damage: 1d3
      mode: claw
      type: physical
    - damage: 1d3
      mode: claw
      type: physical
  color: gray
  corpse: {}
  demon: 1
  female: 1
  fly: 1
  glyph: '&'
  hitdice: 6
  hostile: 1
  humanoid: 1
  infravisible: 1
  infravision: 1
  mr: 70
  name: succubus
  nasty: 1
  nocorpse: 1
  nutrition: 400
  pois: 1
  rarity: 1
  resist:
    fire: 1
    poison: 1
  size: human
  sound: seduce
  speed: 12
  stalk: 1
  weight: 1450
tengu:
  ac: 5
  alignment: 7
  attacks:
    - damage: 1d7
      mode: bite
      type: physical
  color: cyan
  corpse:
    poison: 1
  geno: 1
  glyph: i
  hitdice: 6
  infravisible: 1
  infravision: 1
  mr: 30
  name: tengu
  nutrition: 200
  rarity: 3
  resist:
    poison: 1
  size: small
  sound: sqawk
  speed: 13
  stalk: 1
  tport: 1
  tport_cntrl: 1
  weight: 300
thug:
  ac: 10
  alignment: -3
  attacks:
    - damage: 1d6
      mode: weapon
      type: physical
    - damage: 1d6
      mode: weapon
      type: physical
  collect: 1
  color: white
  corpse: {}
  glyph: '@'
  greedy: 1
  hitdice: 5
  human: 1
  humanoid: 1
  infravisible: 1
  mr: 10
  name: thug
  nogen: 1
  nopoly: 1
  nutrition: 400
  omnivore: 1
  peaceful: 1
  resist: {}
  size: human
  sound: guardian
  speed: 12
  strong: 1
  weight: 1450
tiger:
  ac: 6
  alignment: 0
  animal: 1
  attacks:
    - damage: 2d4
      mode: claw
      type: physical
    - damage: 2d4
      mode: claw
      type: physical
    - damage: 1d10
      mode: bite
      type: physical
  carnivore: 1
  color: yellow
  corpse: {}
  geno: 1
  glyph: f
  hitdice: 6
  hostile: 1
  infravisible: 1
  mr: 0
  name: tiger
  nohands: 1
  nutrition: 300
  rarity: 2
  resist: {}
  size: large
  sound: growl
  speed: 12
  weight: 600
titan:
  ac: -3
  alignment: 9
  attacks:
    - damage: 2d8
      mode: weapon
      type: physical
    - damage: 0d0
      mode: magic
      type: wizardspell
  collect: 1
  color: magenta
  corpse: {}
  fly: 1
  glyph: H
  hitdice: 16
  humanoid: 1
  infravisible: 1
  infravision: 1
  magic: 1
  mr: 70
  name: titan
  nasty: 1
  nutrition: 900
  omnivore: 1
  rarity: 1
  resist: {}
  rockthrow: 1
  size: huge
  sound: spell
  speed: 18
  strong: 1
  weight: 2300
titanothere:
  ac: 6
  alignment: 0
  animal: 1
  attacks:
    - damage: 2d8
      mode: claw
      type: physical
  color: gray
  corpse: {}
  geno: 1
  glyph: q
  herbivore: 1
  hitdice: 12
  hostile: 1
  infravisible: 1
  mr: 0
  name: titanothere
  nohands: 1
  nutrition: 650
  rarity: 2
  resist: {}
  size: large
  sound: silent
  speed: 12
  strong: 1
  thick_hide: 1
  weight: 2650
tourist:
  ac: 10
  alignment: 0
  attacks:
    - damage: 1d6
      mode: weapon
      type: physical
    - damage: 1d6
      mode: weapon
      type: physical
  collect: 1
  color: white
  corpse: {}
  glyph: '@'
  hitdice: 10
  human: 1
  humanoid: 1
  infravisible: 1
  mr: 1
  name: tourist
  nogen: 1
  nopoly: 1
  nutrition: 400
  omnivore: 1
  resist: {}
  size: human
  sound: humanoid
  speed: 12
  strong: 1
  weight: 1450
trapper:
  ac: 3
  alignment: 0
  animal: 1
  attacks:
    - damage: 1d10
      mode: engulf
      type: digest
  carnivore: 1
  color: green
  corpse: {}
  geno: 1
  glyph: t
  hide: 1
  hitdice: 12
  hostile: 1
  mr: 0
  name: trapper
  noeyes: 1
  nohead: 1
  nolimbs: 1
  nutrition: 350
  rarity: 2
  resist: {}
  size: huge
  sound: silent
  speed: 3
  stalk: 1
  strong: 1
  weight: 800
troll:
  ac: 4
  alignment: -3
  attacks:
    - damage: 4d2
      mode: weapon
      type: physical
    - damage: 4d2
      mode: claw
      type: physical
    - damage: 2d6
      mode: bite
      type: physical
  carnivore: 1
  color: brown
  corpse: {}
  geno: 1
  glyph: T
  hitdice: 7
  hostile: 1
  humanoid: 1
  infravisible: 1
  infravision: 1
  mr: 0
  name: troll
  nutrition: 350
  rarity: 2
  regen: 1
  resist: {}
  size: large
  sound: grunt
  speed: 12
  stalk: 1
  strong: 1
  weight: 800
umber hulk:
  ac: 2
  alignment: 0
  attacks:
    - damage: 3d4
      mode: claw
      type: physical
    - damage: 3d4
      mode: claw
      type: physical
    - damage: 2d5
      mode: bite
      type: physical
    - damage: 0d0
      mode: gaze
      type: conf
  carnivore: 1
  color: brown
  corpse: {}
  geno: 1
  glyph: U
  hitdice: 9
  infravisible: 1
  mr: 25
  name: umber hulk
  nutrition: 500
  rarity: 2
  resist: {}
  size: large
  sound: silent
  speed: 6
  strong: 1
  tunnel: 1
  weight: 1200
valkyrie:
  ac: 10
  alignment: -1
  attacks:
    - damage: 1d8
      mode: weapon
      type: physical
    - damage: 1d8
      mode: weapon
      type: physical
  collect: 1
  color: white
  corpse: {}
  female: 1
  glyph: '@'
  hitdice: 10
  human: 1
  humanoid: 1
  infravisible: 1
  mr: 1
  name: valkyrie
  nogen: 1
  nopoly: 1
  nutrition: 400
  omnivore: 1
  resist:
    cold: 1
  size: human
  sound: humanoid
  speed: 12
  strong: 1
  weight: 1450
vampire:
  ac: 1
  alignment: -8
  attacks:
    - damage: 1d6
      mode: claw
      type: physical
    - damage: 1d6
      mode: bite
      type: drain
  breathless: 1
  color: red
  corpse: {}
  fly: 1
  geno: 1
  glyph: V
  hitdice: 10
  hostile: 1
  humanoid: 1
  infravisible: 1
  mr: 25
  name: vampire
  nasty: 1
  nocorpse: 1
  nutrition: 400
  pois: 1
  rarity: 1
  regen: 1
  resist:
    poison: 1
    sleep: 1
  size: human
  sound: vampire
  speed: 12
  stalk: 1
  strong: 1
  undead: 1
  weight: 1450
vampire bat:
  ac: 6
  alignment: 0
  animal: 1
  attacks:
    - damage: 1d6
      mode: bite
      type: physical
    - damage: 0d0
      mode: bite
      type: poison
  color: black
  corpse: {}
  fly: 1
  geno: 1
  glyph: B
  hitdice: 5
  hostile: 1
  infravisible: 1
  mr: 0
  name: vampire bat
  nohands: 1
  nutrition: 20
  omnivore: 1
  pois: 1
  rarity: 2
  regen: 1
  resist:
    poison: 1
    sleep: 1
  size: small
  sound: sqeek
  speed: 20
  weight: 30
vampire lord:
  ac: 0
  alignment: -9
  attacks:
    - damage: 1d8
      mode: claw
      type: physical
    - damage: 1d8
      mode: bite
      type: drain
  breathless: 1
  color: blue
  corpse: {}
  fly: 1
  geno: 1
  glyph: V
  hitdice: 12
  hostile: 1
  humanoid: 1
  infravisible: 1
  lord: 1
  male: 1
  mr: 50
  name: vampire lord
  nasty: 1
  nocorpse: 1
  nutrition: 400
  pois: 1
  rarity: 1
  regen: 1
  resist:
    poison: 1
    sleep: 1
  size: human
  sound: vampire
  speed: 14
  stalk: 1
  strong: 1
  undead: 1
  weight: 1450
violet fungus:
  ac: 7
  alignment: 0
  attacks:
    - damage: 1d4
      mode: touch
      type: physical
    - damage: 0d0
      mode: touch
      type: stick
  breathless: 1
  color: magenta
  corpse:
    poison: 1
  geno: 1
  glyph: F
  hitdice: 3
  hostile: 1
  mindless: 1
  mr: 0
  name: violet fungus
  neuter: 1
  noeyes: 1
  nohead: 1
  nolimbs: 1
  notake: 1
  nutrition: 100
  rarity: 2
  resist:
    poison: 1
  size: small
  sound: silent
  speed: 1
  weight: 100
vrock:
  ac: 0
  alignment: -9
  attacks:
    - damage: 1d4
      mode: claw
      type: physical
    - damage: 1d4
      mode: claw
      type: physical
    - damage: 1d8
      mode: claw
      type: physical
    - damage: 1d8
      mode: claw
      type: physical
    - damage: 1d6
      mode: bite
      type: physical
  color: red
  corpse: {}
  demon: 1
  glyph: '&'
  hell: 1
  hitdice: 8
  hostile: 1
  infravisible: 1
  infravision: 1
  mr: 50
  name: vrock
  nasty: 1
  nocorpse: 1
  nutrition: 400
  pois: 1
  rarity: 2
  resist:
    fire: 1
    poison: 1
  sgroup: 1
  size: large
  sound: silent
  speed: 12
  stalk: 1
  weight: 1450
warg:
  ac: 4
  alignment: -5
  animal: 1
  attacks:
    - damage: 2d6
      mode: bite
      type: physical
  carnivore: 1
  color: brown
  corpse: {}
  geno: 1
  glyph: d
  hitdice: 7
  hostile: 1
  infravisible: 1
  mr: 0
  name: warg
  nohands: 1
  nutrition: 350
  rarity: 2
  resist: {}
  sgroup: 1
  size: medium
  sound: bark
  speed: 12
  weight: 850
warhorse:
  ac: 4
  alignment: 0
  animal: 1
  attacks:
    - damage: 1d10
      mode: kick
      type: physical
    - damage: 1d4
      mode: bite
      type: physical
  color: brown
  corpse: {}
  domestic: 1
  geno: 1
  glyph: u
  herbivore: 1
  hitdice: 7
  infravisible: 1
  mr: 0
  name: warhorse
  nohands: 1
  nutrition: 350
  rarity: 2
  resist: {}
  size: large
  sound: neigh
  speed: 24
  strong: 1
  wander: 1
  weight: 1800
warrior:
  ac: 10
  alignment: -1
  attacks:
    - damage: 1d8
      mode: weapon
      type: physical
    - damage: 1d8
      mode: weapon
      type: physical
  collect: 1
  color: white
  corpse: {}
  female: 1
  glyph: '@'
  hitdice: 5
  human: 1
  humanoid: 1
  infravisible: 1
  mr: 10
  name: warrior
  nogen: 1
  nopoly: 1
  nutrition: 400
  omnivore: 1
  peaceful: 1
  resist: {}
  size: human
  sound: guardian
  speed: 12
  strong: 1
  weight: 1450
watch captain:
  ac: 10
  alignment: -4
  attacks:
    - damage: 3d4
      mode: weapon
      type: physical
    - damage: 3d4
      mode: weapon
      type: physical
  collect: 1
  color: green
  corpse: {}
  geno: 1
  glyph: '@'
  hitdice: 10
  human: 1
  humanoid: 1
  infravisible: 1
  merc: 1
  mr: 15
  name: watch captain
  nogen: 1
  nopoly: 1
  nutrition: 400
  omnivore: 1
  peaceful: 1
  rarity: 1
  resist: {}
  size: human
  sound: soldier
  speed: 10
  stalk: 1
  strong: 1
  weight: 1450
watchman:
  ac: 10
  alignment: -2
  attacks:
    - damage: 1d8
      mode: weapon
      type: physical
  collect: 1
  color: gray
  corpse: {}
  geno: 1
  glyph: '@'
  hitdice: 6
  human: 1
  humanoid: 1
  infravisible: 1
  merc: 1
  mr: 0
  name: watchman
  nogen: 1
  nopoly: 1
  nutrition: 400
  omnivore: 1
  peaceful: 1
  rarity: 1
  resist: {}
  sgroup: 1
  size: human
  sound: soldier
  speed: 10
  stalk: 1
  strong: 1
  weight: 1450
water demon:
  ac: -4
  alignment: -7
  attacks:
    - damage: 1d3
      mode: weapon
      type: physical
    - damage: 1d3
      mode: claw
      type: physical
    - damage: 1d3
      mode: bite
      type: physical
  collect: 1
  color: blue
  corpse: {}
  demon: 1
  glyph: '&'
  hitdice: 8
  hostile: 1
  humanoid: 1
  infravisible: 1
  infravision: 1
  mr: 30
  name: water demon
  nasty: 1
  nocorpse: 1
  nogen: 1
  nopoly: 1
  nutrition: 400
  pois: 1
  resist:
    fire: 1
    poison: 1
  size: human
  sound: djinni
  speed: 12
  stalk: 1
  swim: 1
  weight: 1450
water elemental:
  ac: 2
  alignment: 0
  amphibious: 1
  attacks:
    - damage: 5d6
      mode: claw
      type: physical
  color: blue
  corpse: {}
  glyph: E
  hitdice: 8
  mindless: 1
  mr: 30
  name: water elemental
  neuter: 1
  nocorpse: 1
  noeyes: 1
  nohead: 1
  nolimbs: 1
  nutrition: 0
  rarity: 1
  resist:
    poison: 1
    stone: 1
  size: huge
  sound: silent
  speed: 6
  strong: 1
  swim: 1
  weight: 2500
water moccasin:
  ac: 3
  alignment: 0
  animal: 1
  attacks:
    - damage: 1d6
      mode: bite
      type: poison
  carnivore: 1
  color: red
  conceal: 1
  corpse:
    poison: 1
  geno: 1
  glyph: S
  hitdice: 4
  hostile: 1
  lgroup: 1
  mr: 0
  name: water moccasin
  nogen: 1
  nolimbs: 1
  notake: 1
  nutrition: 80
  oviparous: 1
  pois: 1
  resist:
    poison: 1
  size: small
  slithy: 1
  sound: hiss
  speed: 15
  swim: 1
  weight: 150
water nymph:
  ac: 9
  alignment: 0
  attacks:
    - damage: 0d0
      mode: claw
      type: stealitem
    - damage: 0d0
      mode: claw
      type: seduce
  collect: 1
  color: blue
  corpse: {}
  female: 1
  geno: 1
  glyph: n
  hitdice: 3
  hostile: 1
  humanoid: 1
  infravisible: 1
  mr: 20
  name: water nymph
  nutrition: 300
  rarity: 2
  resist: {}
  size: human
  sound: seduce
  speed: 12
  swim: 1
  tport: 1
  weight: 600
water troll:
  ac: 4
  alignment: -3
  attacks:
    - damage: 2d8
      mode: weapon
      type: physical
    - damage: 2d8
      mode: claw
      type: physical
    - damage: 2d6
      mode: bite
      type: physical
  carnivore: 1
  color: blue
  corpse: {}
  geno: 1
  glyph: T
  hitdice: 11
  hostile: 1
  humanoid: 1
  infravisible: 1
  infravision: 1
  mr: 40
  name: water troll
  nogen: 1
  nutrition: 350
  regen: 1
  resist: {}
  size: large
  sound: grunt
  speed: 14
  stalk: 1
  strong: 1
  swim: 1
  weight: 1200
werejackal:
  ac: 10
  alignment: -7
  attacks:
    - damage: 2d4
      mode: weapon
      type: physical
  collect: 1
  color: red
  corpse: {}
  glyph: '@'
  hitdice: 2
  hostile: 1
  human: 1
  humanoid: 1
  infravisible: 1
  mr: 10
  name: werejackal
  nopoly: 1
  nutrition: 400
  omnivore: 1
  pois: 1
  rarity: 1
  regen: 1
  resist:
    poison: 1
  size: human
  sound: were
  speed: 12
  weight: 1450
  were: 1
wererat:
  ac: 10
  alignment: -7
  attacks:
    - damage: 2d4
      mode: weapon
      type: physical
  collect: 1
  color: brown
  corpse: {}
  glyph: '@'
  hitdice: 2
  hostile: 1
  human: 1
  humanoid: 1
  infravisible: 1
  mr: 10
  name: wererat
  nopoly: 1
  nutrition: 400
  omnivore: 1
  pois: 1
  rarity: 1
  regen: 1
  resist:
    poison: 1
  size: human
  sound: were
  speed: 12
  weight: 1450
  were: 1
werewolf:
  ac: 10
  alignment: -7
  attacks:
    - damage: 2d4
      mode: weapon
      type: physical
  collect: 1
  color: orange
  corpse: {}
  glyph: '@'
  hitdice: 5
  hostile: 1
  human: 1
  humanoid: 1
  infravisible: 1
  mr: 20
  name: werewolf
  nopoly: 1
  nutrition: 400
  omnivore: 1
  pois: 1
  rarity: 1
  regen: 1
  resist:
    poison: 1
  size: human
  sound: were
  speed: 12
  weight: 1450
  were: 1
white dragon:
  ac: -1
  alignment: -5
  attacks:
    - damage: 4d6
      mode: breathe
      type: cold
    - damage: 3d8
      mode: bite
      type: physical
    - damage: 1d4
      mode: claw
      type: physical
    - damage: 1d4
      mode: claw
      type: physical
  carnivore: 1
  color: white
  corpse:
    cold: 1
  fly: 1
  geno: 1
  glyph: D
  greedy: 1
  hitdice: 15
  hostile: 1
  jewels: 1
  magic: 1
  mr: 20
  name: white dragon
  nasty: 1
  nohands: 1
  nutrition: 1500
  oviparous: 1
  rarity: 1
  resist:
    cold: 1
  see_invis: 1
  size: gigantic
  sound: roar
  speed: 9
  strong: 1
  thick_hide: 1
  weight: 4500
white unicorn:
  ac: 2
  alignment: 7
  attacks:
    - damage: 1d12
      mode: headbutt
      type: physical
    - damage: 1d6
      mode: kick
      type: physical
  color: white
  corpse:
    poison: 1
  geno: 1
  glyph: u
  herbivore: 1
  hitdice: 4
  infravisible: 1
  jewels: 1
  mr: 70
  name: white unicorn
  nohands: 1
  nutrition: 300
  rarity: 2
  resist:
    poison: 1
  size: large
  sound: neigh
  speed: 24
  strong: 1
  wander: 1
  weight: 1300
winged gargoyle:
  ac: -2
  alignment: -12
  attacks:
    - damage: 3d6
      mode: claw
      type: physical
    - damage: 3d6
      mode: claw
      type: physical
    - damage: 3d4
      mode: bite
      type: physical
  breathless: 1
  color: magenta
  corpse:
    stone: 1
  fly: 1
  geno: 1
  glyph: g
  hitdice: 9
  hostile: 1
  humanoid: 1
  lord: 1
  magic: 1
  mr: 0
  name: winged gargoyle
  nutrition: 300
  oviparous: 1
  rarity: 1
  resist:
    stone: 1
  size: human
  sound: grunt
  speed: 15
  strong: 1
  thick_hide: 1
  weight: 1200
winter wolf:
  ac: 4
  alignment: 0
  animal: 1
  attacks:
    - damage: 2d6
      mode: bite
      type: physical
    - damage: 2d6
      mode: breathe
      type: cold
  carnivore: 1
  color: cyan
  corpse:
    cold: 1
  geno: 1
  glyph: d
  hitdice: 7
  hostile: 1
  mr: 20
  name: winter wolf
  nohands: 1
  nohell: 1
  nutrition: 300
  rarity: 1
  resist:
    cold: 1
  size: large
  sound: bark
  speed: 12
  strong: 1
  weight: 700
winter wolf cub:
  ac: 4
  alignment: -5
  animal: 1
  attacks:
    - damage: 1d8
      mode: bite
      type: physical
    - damage: 1d8
      mode: breathe
      type: cold
  carnivore: 1
  color: cyan
  corpse:
    cold: 1
  geno: 1
  glyph: d
  hitdice: 5
  hostile: 1
  mr: 0
  name: winter wolf cub
  nohands: 1
  nohell: 1
  nutrition: 200
  rarity: 2
  resist:
    cold: 1
  sgroup: 1
  size: small
  sound: bark
  speed: 12
  weight: 250
wizard:
  ac: 10
  alignment: 0
  attacks:
    - damage: 1d6
      mode: weapon
      type: physical
  collect: 1
  color: white
  corpse: {}
  glyph: '@'
  hitdice: 10
  human: 1
  humanoid: 1
  infravisible: 1
  magic: 1
  mr: 3
  name: wizard
  nogen: 1
  nopoly: 1
  nutrition: 400
  omnivore: 1
  resist: {}
  size: human
  sound: humanoid
  speed: 12
  strong: 1
  weight: 1450
wolf:
  ac: 4
  alignment: 0
  animal: 1
  attacks:
    - damage: 2d4
      mode: bite
      type: physical
  carnivore: 1
  color: brown
  corpse: {}
  geno: 1
  glyph: d
  hitdice: 5
  hostile: 1
  infravisible: 1
  mr: 0
  name: wolf
  nohands: 1
  nutrition: 250
  rarity: 2
  resist: {}
  sgroup: 1
  size: medium
  sound: bark
  speed: 12
  weight: 500
wood golem:
  ac: 4
  alignment: 0
  attacks:
    - damage: 3d4
      mode: claw
      type: physical
  breathless: 1
  color: brown
  corpse: {}
  glyph: "'"
  hitdice: 7
  hostile: 1
  humanoid: 1
  mindless: 1
  mr: 0
  name: wood golem
  neuter: 1
  nocorpse: 1
  nutrition: 0
  rarity: 1
  resist:
    poison: 1
    sleep: 1
  size: large
  sound: silent
  speed: 3
  thick_hide: 1
  weight: 900
wood nymph:
  ac: 9
  alignment: 0
  attacks:
    - damage: 0d0
      mode: claw
      type: stealitem
    - damage: 0d0
      mode: claw
      type: seduce
  collect: 1
  color: green
  corpse: {}
  female: 1
  geno: 1
  glyph: n
  hitdice: 3
  hostile: 1
  humanoid: 1
  infravisible: 1
  mr: 20
  name: wood nymph
  nutrition: 300
  rarity: 2
  resist: {}
  size: human
  sound: seduce
  speed: 12
  tport: 1
  weight: 600
woodchuck:
  ac: 0
  alignment: 0
  animal: 1
  attacks:
    - damage: 1d6
      mode: bite
      type: physical
  color: brown
  corpse: {}
  geno: 1
  glyph: r
  herbivore: 1
  hitdice: 3
  hostile: 1
  infravisible: 1
  mr: 20
  name: woodchuck
  nogen: 1
  nohands: 1
  nutrition: 30
  resist: {}
  size: small
  sound: silent
  speed: 3
  swim: 1
  tunnel: 1
  wander: 1
  weight: 30
wraith:
  ac: 4
  alignment: -6
  attacks:
    - damage: 1d6
      mode: touch
      type: drain
  breathless: 1
  color: black
  corpse: {}
  fly: 1
  geno: 1
  glyph: W
  hitdice: 6
  hostile: 1
  humanoid: 1
  mr: 15
  name: wraith
  nutrition: 0
  rarity: 2
  resist:
    cold: 1
    poison: 1
    sleep: 1
    stone: 1
  size: human
  sound: silent
  speed: 12
  stalk: 1
  undead: 1
  unsolid: 1
  weight: 0
wumpus:
  ac: 2
  alignment: 0
  animal: 1
  attacks:
    - damage: 3d6
      mode: bite
      type: physical
  cling: 1
  color: cyan
  corpse: {}
  geno: 1
  glyph: q
  hitdice: 8
  hostile: 1
  infravisible: 1
  mr: 10
  name: wumpus
  nohands: 1
  nutrition: 500
  omnivore: 1
  rarity: 1
  resist: {}
  size: large
  sound: burble
  speed: 3
  strong: 1
  weight: 2500
xan:
  ac: -4
  alignment: 0
  animal: 1
  attacks:
    - damage: 1d4
      mode: sting
      type: legs
  color: red
  corpse:
    poison: 1
  fly: 1
  geno: 1
  glyph: x
  hitdice: 7
  hostile: 1
  infravisible: 1
  mr: 0
  name: xan
  nohands: 1
  nutrition: 300
  pois: 1
  rarity: 3
  resist:
    poison: 1
  size: tiny
  sound: buzz
  speed: 18
  weight: 300
xorn:
  ac: -2
  alignment: 0
  attacks:
    - damage: 1d3
      mode: claw
      type: physical
    - damage: 1d3
      mode: claw
      type: physical
    - damage: 1d3
      mode: claw
      type: physical
    - damage: 4d6
      mode: bite
      type: physical
  breathless: 1
  color: brown
  corpse:
    stone: 1
  geno: 1
  glyph: X
  hitdice: 8
  hostile: 1
  metallivore: 1
  mr: 20
  name: xorn
  nutrition: 700
  rarity: 1
  resist:
    cold: 1
    fire: 1
    stone: 1
  size: medium
  sound: roar
  speed: 9
  strong: 1
  thick_hide: 1
  wallwalk: 1
  weight: 1200
yellow dragon:
  ac: -1
  acid: 1
  alignment: 7
  attacks:
    - damage: 4d6
      mode: breathe
      type: acid
    - damage: 3d8
      mode: bite
      type: physical
    - damage: 1d4
      mode: claw
      type: physical
    - damage: 1d4
      mode: claw
      type: physical
  carnivore: 1
  color: yellow
  corpse:
    stone: 1
  fly: 1
  geno: 1
  glyph: D
  greedy: 1
  hitdice: 15
  hostile: 1
  jewels: 1
  magic: 1
  mr: 20
  name: yellow dragon
  nasty: 1
  nohands: 1
  nutrition: 1500
  oviparous: 1
  rarity: 1
  resist:
    acid: 1
    stone: 1
  see_invis: 1
  size: gigantic
  sound: roar
  speed: 9
  strong: 1
  thick_hide: 1
  weight: 4500
yellow light:
  ac: 0
  alignment: 0
  amorphous: 1
  attacks:
    - damage: 10d20
      mode: explode
      type: blind
  breathless: 1
  color: yellow
  corpse: {}
  fly: 1
  geno: 1
  glyph: y
  hitdice: 3
  hostile: 1
  infravisible: 1
  mindless: 1
  mr: 0
  name: yellow light
  neuter: 1
  nocorpse: 1
  noeyes: 1
  nohead: 1
  nolimbs: 1
  notake: 1
  nutrition: 0
  rarity: 4
  resist:
    acid: 1
    cold: 1
    disint: 1
    elec: 1
    fire: 1
    poison: 1
    sleep: 1
    stone: 1
  size: small
  sound: silent
  speed: 15
  unsolid: 1
  weight: 0
yellow mold:
  ac: 9
  alignment: 0
  attacks:
    - damage: 0d4
      mode: passive
      type: stun
  breathless: 1
  color: yellow
  corpse:
    poison: 1
  geno: 1
  glyph: F
  hitdice: 1
  hostile: 1
  mindless: 1
  mr: 0
  name: yellow mold
  neuter: 1
  noeyes: 1
  nohead: 1
  nolimbs: 1
  notake: 1
  nutrition: 30
  pois: 1
  rarity: 2
  resist:
    poison: 1
  size: small
  sound: silent
  speed: 0
  weight: 50
yeti:
  ac: 6
  alignment: 0
  animal: 1
  attacks:
    - damage: 1d6
      mode: claw
      type: physical
    - damage: 1d6
      mode: claw
      type: physical
    - damage: 1d4
      mode: bite
      type: physical
  carnivore: 1
  color: white
  corpse:
    cold: 1
  geno: 1
  glyph: Y
  hitdice: 5
  hostile: 1
  humanoid: 1
  infravisible: 1
  mr: 0
  name: yeti
  nutrition: 700
  rarity: 2
  resist:
    cold: 1
  size: large
  sound: growl
  speed: 15
  strong: 1
  weight: 1600
zruty:
  ac: 3
  alignment: 0
  animal: 1
  attacks:
    - damage: 3d4
      mode: claw
      type: physical
    - damage: 3d4
      mode: claw
      type: physical
    - damage: 3d6
      mode: bite
      type: physical
  carnivore: 1
  color: brown
  corpse: {}
  geno: 1
  glyph: z
  hitdice: 9
  hostile: 1
  humanoid: 1
  infravisible: 1
  mr: 0
  name: zruty
  nutrition: 600
  rarity: 2
  resist: {}
  size: large
  sound: silent
  speed: 8
  strong: 1
  weight: 1200
