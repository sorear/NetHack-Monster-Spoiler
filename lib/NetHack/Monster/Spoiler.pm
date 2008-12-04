package NetHack::Monster::Spoiler;
use Moose;
use YAML::Any qw(Load);
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
        my $data;
        close DATA;
        my $h = Load($data);

        for my $name (keys %$h) {
            $h->{$name} = NetHack::Monster::Spoiler->new(%{ $h->{$name} });
        }

        $h;
    }
);

has [qw/absent_from_gehennom acidic_corpse always_hostile always_peaceful
  can_eat_metal can_eat_rock can_fly can_swim cannot_pickup_items
  clings_to_ceiling corpse_nutrition extra_nasty follows_stair_users
  food_makes_peaceful gehennom_exclusive has_infravision has_proper_name
  has_teleport_control has_teleportitis has_thick_hide hides_on_ceiling
  hides_under_item humanoid_body ignores_walls immobile_until_disturbed
  immobile_until_seen infravision_detectable invalid_polymorph_target
  is_always_female is_always_male is_amorphous is_amphibious is_animal
  is_breathless is_carnivorous is_demon is_dwarf is_elf is_genderless
  is_genocidable is_giant is_gnome is_herbivorous is_human is_lycanthrope
  is_mercenary is_mindless is_minion is_orc is_rank_lord is_rank_prince
  is_undead is_unique is_very_strong is_wanderer lacks_eyes lacks_hands
  lacks_head lacks_limbs large_group lays_eggs made_of_gas never_drops_corpse
  not_randomly_generated poisonous_corpse regenerates_quickly sees_invisible
  serpentine_body small_group throws_boulders tunnels_with_pick wants_amulet
  wants_bell wants_book wants_candelabrum wants_gems wants_gold
  wants_magic_items wants_quest_artifact wants_wargear/] => (
    is      => 'ro',
    isa     => 'Bool',
    default => 0,
);

has [qw/weight speed rarity nutrition mr hitdice ac/] => (
    is      => 'ro',
    isa     => 'Int',
    default => 0,
);

has alignment => (
    is      => 'ro',
    isa     => 'Str'
);

has [qw/sound size name glyph color/] => (
    is      => 'ro',
    isa     => 'Str',
);

has [qw/resist corpse/] => (
    is      => 'ro',
    isa     => 'HashRef',
);

has attacks => (
    is      => 'ro',
    isa     => 'ArrayRef',
);

sub match {
    my ($self, %props) = @_;

    for my $field (keys %props) {
        return 0 unless $self->$field() eq $props{$field};
    }

    return 1;
}

my @numcolor = qw(black red green brown blue magenta cyan gray none orange bright_green yellow bright_blue bright_magenta bright_cyan white);

sub lookup {
    my ($class, %props) = @_;

    $props{color} = $numcolor[$props{color}] if $props{color} =~ /^[0-9]+$/;

    my @cand = grep { $_->match(%props) } @{$class->list};

    if (!wantarray) {
        return @cand == 1 ? $cand[0] : undef;
    } else {
        return @cand;
    }
}

__PACKAGE__->meta->make_immutable;
no Moose;

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
  absent_from_gehennom: 1
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
  color: yellow
  corpse: {}
  corpse_nutrition: 400
  extra_nasty: 1
  follows_stair_users: 1
  glyph: A
  has_infravision: 1
  hitdice: 10
  humanoid_body: 1
  infravision_detectable: 1
  is_minion: 1
  mr: 30
  name: Aleax
  never_drops_corpse: 1
  rarity: 1
  resist:
    cold: 1
    elec: 1
    poison: 1
    sleep: 1
  sees_invisible: 1
  size: human
  sound: imitate
  speed: 8
  wants_wargear: 1
  weight: 1450
Angel:
  absent_from_gehennom: 1
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
  can_fly: 1
  color: white
  corpse: {}
  corpse_nutrition: 400
  extra_nasty: 1
  follows_stair_users: 1
  glyph: A
  has_infravision: 1
  hitdice: 14
  humanoid_body: 1
  infravision_detectable: 1
  invalid_polymorph_target: 1
  is_minion: 1
  is_very_strong: 1
  mr: 55
  name: Angel
  never_drops_corpse: 1
  rarity: 1
  resist:
    cold: 1
    elec: 1
    poison: 1
    sleep: 1
  sees_invisible: 1
  size: human
  sound: cuss
  speed: 10
  wants_wargear: 1
  weight: 1450
Arch Priest:
  ac: 7
  alignment: 0
  always_peaceful: 1
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
  color: white
  corpse: {}
  corpse_nutrition: 400
  glyph: '@'
  hitdice: 25
  humanoid_body: 1
  immobile_until_disturbed: 1
  infravision_detectable: 1
  invalid_polymorph_target: 1
  is_carnivorous: 1
  is_herbivorous: 1
  is_human: 1
  is_unique: 1
  is_very_strong: 1
  mr: 70
  name: Arch Priest
  not_randomly_generated: 1
  resist:
    elec: 1
    fire: 1
    poison: 1
    sleep: 1
  sees_invisible: 1
  size: human
  sound: leader
  speed: 12
  wants_magic_items: 1
  wants_wargear: 1
  weight: 1450
Archon:
  absent_from_gehennom: 1
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
  can_fly: 1
  color: magenta
  corpse: {}
  corpse_nutrition: 400
  extra_nasty: 1
  follows_stair_users: 1
  glyph: A
  has_infravision: 1
  hitdice: 19
  humanoid_body: 1
  infravision_detectable: 1
  invalid_polymorph_target: 1
  is_minion: 1
  is_rank_lord: 1
  is_very_strong: 1
  mr: 80
  name: Archon
  never_drops_corpse: 1
  rarity: 1
  regenerates_quickly: 1
  resist:
    cold: 1
    elec: 1
    fire: 1
    poison: 1
    sleep: 1
  sees_invisible: 1
  size: large
  sound: cuss
  speed: 16
  wants_magic_items: 1
  wants_wargear: 1
  weight: 1450
Ashikaga Takauji:
  ac: 0
  alignment: -13
  always_hostile: 1
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
  color: magenta
  corpse: {}
  corpse_nutrition: 400
  extra_nasty: 1
  follows_stair_users: 1
  glyph: '@'
  has_proper_name: 1
  hitdice: 15
  humanoid_body: 1
  immobile_until_seen: 1
  infravision_detectable: 1
  invalid_polymorph_target: 1
  is_always_male: 1
  is_carnivorous: 1
  is_herbivorous: 1
  is_human: 1
  is_unique: 1
  is_very_strong: 1
  mr: 40
  name: Ashikaga Takauji
  never_drops_corpse: 1
  not_randomly_generated: 1
  resist:
    stone: 1
  size: human
  sound: nemesis
  speed: 12
  wants_magic_items: 1
  wants_quest_artifact: 1
  wants_wargear: 1
  weight: 1450
Asmodeus:
  ac: -7
  alignment: 20
  always_hostile: 1
  attacks:
    - damage: 4d4
      mode: claw
      type: physical
    - damage: 6d6
      mode: magic
      type: cold
  can_fly: 1
  color: magenta
  corpse: {}
  corpse_nutrition: 500
  extra_nasty: 1
  follows_stair_users: 1
  gehennom_exclusive: 1
  glyph: '&'
  has_infravision: 1
  has_proper_name: 1
  hitdice: 105
  humanoid_body: 1
  immobile_until_seen: 1
  infravision_detectable: 1
  invalid_polymorph_target: 1
  is_always_male: 1
  is_demon: 1
  is_rank_prince: 1
  is_unique: 1
  is_very_strong: 1
  mr: 90
  name: Asmodeus
  never_drops_corpse: 1
  not_randomly_generated: 1
  poisonous_corpse: 1
  resist:
    cold: 1
    fire: 1
    poison: 1
  sees_invisible: 1
  size: huge
  sound: bribe
  speed: 12
  wants_amulet: 1
  weight: 1500
Baalzebub:
  ac: -5
  alignment: 20
  always_hostile: 1
  attacks:
    - damage: 2d6
      mode: bite
      type: poison
    - damage: 2d6
      mode: gaze
      type: stun
  can_fly: 1
  color: magenta
  corpse: {}
  corpse_nutrition: 500
  extra_nasty: 1
  follows_stair_users: 1
  gehennom_exclusive: 1
  glyph: '&'
  has_infravision: 1
  has_proper_name: 1
  hitdice: 89
  immobile_until_seen: 1
  infravision_detectable: 1
  invalid_polymorph_target: 1
  is_always_male: 1
  is_demon: 1
  is_rank_prince: 1
  is_unique: 1
  mr: 85
  name: Baalzebub
  never_drops_corpse: 1
  not_randomly_generated: 1
  poisonous_corpse: 1
  resist:
    fire: 1
    poison: 1
  sees_invisible: 1
  size: large
  sound: bribe
  speed: 9
  wants_amulet: 1
  weight: 1500
Chromatic Dragon:
  ac: 0
  alignment: -14
  always_hostile: 1
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
  color: magenta
  corpse:
    cold: 1
    disint: 1
    elec: 1
    fire: 1
    poison: 1
    sleep: 1
    stone: 1
  corpse_nutrition: 1700
  extra_nasty: 1
  follows_stair_users: 1
  glyph: D
  has_thick_hide: 1
  hitdice: 16
  immobile_until_seen: 1
  infravision_detectable: 1
  invalid_polymorph_target: 1
  is_always_female: 1
  is_carnivorous: 1
  is_unique: 1
  is_very_strong: 1
  lacks_hands: 1
  mr: 30
  name: Chromatic Dragon
  not_randomly_generated: 1
  poisonous_corpse: 1
  resist:
    acid: 1
    cold: 1
    disint: 1
    elec: 1
    fire: 1
    poison: 1
    sleep: 1
    stone: 1
  sees_invisible: 1
  size: gigantic
  sound: nemesis
  speed: 12
  wants_gems: 1
  wants_gold: 1
  wants_magic_items: 1
  wants_quest_artifact: 1
  weight: 4500
Croesus:
  ac: 0
  alignment: 15
  always_hostile: 1
  attacks:
    - damage: 4d10
      mode: weapon
      type: physical
  color: magenta
  corpse: {}
  corpse_nutrition: 400
  extra_nasty: 1
  follows_stair_users: 1
  glyph: '@'
  has_proper_name: 1
  hitdice: 20
  humanoid_body: 1
  infravision_detectable: 1
  invalid_polymorph_target: 1
  is_always_male: 1
  is_carnivorous: 1
  is_herbivorous: 1
  is_human: 1
  is_rank_prince: 1
  is_unique: 1
  is_very_strong: 1
  mr: 40
  name: Croesus
  not_randomly_generated: 1
  resist: {}
  sees_invisible: 1
  size: human
  sound: guard
  speed: 15
  wants_gems: 1
  wants_gold: 1
  wants_magic_items: 1
  wants_wargear: 1
  weight: 1450
Cyclops:
  ac: 0
  alignment: -15
  always_hostile: 1
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
  color: gray
  corpse: {}
  corpse_nutrition: 700
  extra_nasty: 1
  follows_stair_users: 1
  glyph: H
  has_infravision: 1
  hitdice: 18
  humanoid_body: 1
  immobile_until_seen: 1
  infravision_detectable: 1
  invalid_polymorph_target: 1
  is_always_male: 1
  is_carnivorous: 1
  is_giant: 1
  is_herbivorous: 1
  is_unique: 1
  is_very_strong: 1
  mr: 0
  name: Cyclops
  not_randomly_generated: 1
  resist:
    stone: 1
  size: huge
  sound: nemesis
  speed: 12
  throws_boulders: 1
  wants_gems: 1
  wants_quest_artifact: 1
  wants_wargear: 1
  weight: 1900
Dark One:
  ac: 0
  alignment: -10
  always_hostile: 1
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
  color: black
  corpse: {}
  corpse_nutrition: 400
  extra_nasty: 1
  follows_stair_users: 1
  glyph: '@'
  hitdice: 15
  humanoid_body: 1
  immobile_until_seen: 1
  infravision_detectable: 1
  invalid_polymorph_target: 1
  is_carnivorous: 1
  is_herbivorous: 1
  is_human: 1
  is_unique: 1
  is_very_strong: 1
  mr: 80
  name: Dark One
  never_drops_corpse: 1
  not_randomly_generated: 1
  resist:
    stone: 1
  size: human
  sound: nemesis
  speed: 12
  wants_magic_items: 1
  wants_quest_artifact: 1
  wants_wargear: 1
  weight: 1450
Death:
  ac: -5
  alignment: 0
  always_hostile: 1
  attacks:
    - damage: 8d8
      mode: touch
      type: Death
    - damage: 8d8
      mode: touch
      type: Death
  can_fly: 1
  color: magenta
  corpse: {}
  corpse_nutrition: 1
  extra_nasty: 1
  follows_stair_users: 1
  glyph: '&'
  has_infravision: 1
  has_proper_name: 1
  has_teleport_control: 1
  hitdice: 30
  humanoid_body: 1
  infravision_detectable: 1
  invalid_polymorph_target: 1
  is_unique: 1
  is_very_strong: 1
  mr: 100
  name: Death
  not_randomly_generated: 1
  regenerates_quickly: 1
  resist:
    cold: 1
    elec: 1
    fire: 1
    poison: 1
    sleep: 1
    stone: 1
  sees_invisible: 1
  size: human
  sound: rider
  speed: 12
  weight: 1450
Demogorgon:
  ac: -8
  alignment: -20
  always_hostile: 1
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
  can_fly: 1
  color: magenta
  corpse: {}
  corpse_nutrition: 500
  extra_nasty: 1
  follows_stair_users: 1
  gehennom_exclusive: 1
  glyph: '&'
  has_infravision: 1
  has_proper_name: 1
  hitdice: 106
  infravision_detectable: 1
  invalid_polymorph_target: 1
  is_always_male: 1
  is_demon: 1
  is_rank_prince: 1
  is_unique: 1
  lacks_hands: 1
  mr: 95
  name: Demogorgon
  never_drops_corpse: 1
  not_randomly_generated: 1
  poisonous_corpse: 1
  resist:
    fire: 1
    poison: 1
  sees_invisible: 1
  size: huge
  sound: growl
  speed: 15
  wants_amulet: 1
  weight: 1500
Dispater:
  ac: -2
  alignment: 15
  always_hostile: 1
  attacks:
    - damage: 4d6
      mode: weapon
      type: physical
    - damage: 6d6
      mode: magic
      type: wizardspell
  can_fly: 1
  color: magenta
  corpse: {}
  corpse_nutrition: 500
  extra_nasty: 1
  follows_stair_users: 1
  gehennom_exclusive: 1
  glyph: '&'
  has_infravision: 1
  has_proper_name: 1
  hitdice: 78
  humanoid_body: 1
  infravision_detectable: 1
  invalid_polymorph_target: 1
  is_always_male: 1
  is_demon: 1
  is_rank_prince: 1
  is_unique: 1
  mr: 80
  name: Dispater
  never_drops_corpse: 1
  not_randomly_generated: 1
  poisonous_corpse: 1
  resist:
    fire: 1
    poison: 1
  sees_invisible: 1
  size: human
  sound: bribe
  speed: 15
  wants_amulet: 1
  wants_wargear: 1
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
  color: magenta
  corpse:
    sleep: 1
  corpse_nutrition: 350
  glyph: '@'
  has_infravision: 1
  hitdice: 9
  humanoid_body: 1
  infravision_detectable: 1
  is_always_male: 1
  is_carnivorous: 1
  is_elf: 1
  is_genocidable: 1
  is_herbivorous: 1
  is_rank_prince: 1
  is_very_strong: 1
  mr: 25
  name: Elvenking
  rarity: 1
  resist:
    sleep: 1
  sees_invisible: 1
  size: human
  sound: humanoid
  speed: 12
  wants_wargear: 1
  weight: 800
Famine:
  ac: -5
  alignment: 0
  always_hostile: 1
  attacks:
    - damage: 8d8
      mode: touch
      type: Famine
    - damage: 8d8
      mode: touch
      type: Famine
  can_fly: 1
  color: magenta
  corpse: {}
  corpse_nutrition: 1
  extra_nasty: 1
  follows_stair_users: 1
  glyph: '&'
  has_infravision: 1
  has_proper_name: 1
  has_teleport_control: 1
  hitdice: 30
  humanoid_body: 1
  infravision_detectable: 1
  invalid_polymorph_target: 1
  is_unique: 1
  is_very_strong: 1
  mr: 100
  name: Famine
  not_randomly_generated: 1
  regenerates_quickly: 1
  resist:
    cold: 1
    elec: 1
    fire: 1
    poison: 1
    sleep: 1
    stone: 1
  sees_invisible: 1
  size: human
  sound: rider
  speed: 12
  weight: 1450
Geryon:
  ac: -3
  alignment: 15
  always_hostile: 1
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
  can_fly: 1
  color: magenta
  corpse: {}
  corpse_nutrition: 500
  extra_nasty: 1
  follows_stair_users: 1
  gehennom_exclusive: 1
  glyph: '&'
  has_infravision: 1
  has_proper_name: 1
  hitdice: 72
  infravision_detectable: 1
  invalid_polymorph_target: 1
  is_always_male: 1
  is_demon: 1
  is_rank_prince: 1
  is_unique: 1
  mr: 75
  name: Geryon
  never_drops_corpse: 1
  not_randomly_generated: 1
  poisonous_corpse: 1
  resist:
    fire: 1
    poison: 1
  sees_invisible: 1
  serpentine_body: 1
  size: huge
  sound: bribe
  speed: 3
  wants_amulet: 1
  weight: 1500
Grand Master:
  ac: 0
  alignment: 0
  always_peaceful: 1
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
  color: black
  corpse: {}
  corpse_nutrition: 400
  extra_nasty: 1
  glyph: '@'
  hitdice: 25
  humanoid_body: 1
  immobile_until_disturbed: 1
  infravision_detectable: 1
  invalid_polymorph_target: 1
  is_herbivorous: 1
  is_human: 1
  is_unique: 1
  is_very_strong: 1
  mr: 70
  name: Grand Master
  not_randomly_generated: 1
  resist:
    elec: 1
    fire: 1
    poison: 1
    sleep: 1
  sees_invisible: 1
  size: human
  sound: leader
  speed: 12
  wants_magic_items: 1
  weight: 1450
Green-elf:
  ac: 10
  alignment: -6
  attacks:
    - damage: 2d4
      mode: weapon
      type: physical
  color: bright_green
  corpse:
    sleep: 1
  corpse_nutrition: 350
  glyph: '@'
  has_infravision: 1
  hitdice: 5
  humanoid_body: 1
  infravision_detectable: 1
  is_carnivorous: 1
  is_elf: 1
  is_genocidable: 1
  is_herbivorous: 1
  mr: 10
  name: Green-elf
  rarity: 2
  resist:
    sleep: 1
  sees_invisible: 1
  size: human
  small_group: 1
  sound: humanoid
  speed: 12
  wants_wargear: 1
  weight: 800
Grey-elf:
  ac: 10
  alignment: -7
  attacks:
    - damage: 2d4
      mode: weapon
      type: physical
  color: gray
  corpse:
    sleep: 1
  corpse_nutrition: 350
  glyph: '@'
  has_infravision: 1
  hitdice: 6
  humanoid_body: 1
  infravision_detectable: 1
  is_carnivorous: 1
  is_elf: 1
  is_genocidable: 1
  is_herbivorous: 1
  mr: 10
  name: Grey-elf
  rarity: 2
  resist:
    sleep: 1
  sees_invisible: 1
  size: human
  small_group: 1
  sound: humanoid
  speed: 12
  wants_wargear: 1
  weight: 800
Hippocrates:
  ac: 0
  alignment: 0
  always_peaceful: 1
  attacks:
    - damage: 1d6
      mode: weapon
      type: physical
  color: magenta
  corpse: {}
  corpse_nutrition: 400
  glyph: '@'
  has_proper_name: 1
  hitdice: 20
  humanoid_body: 1
  immobile_until_disturbed: 1
  infravision_detectable: 1
  invalid_polymorph_target: 1
  is_always_male: 1
  is_carnivorous: 1
  is_herbivorous: 1
  is_human: 1
  is_unique: 1
  is_very_strong: 1
  mr: 40
  name: Hippocrates
  not_randomly_generated: 1
  resist:
    poison: 1
  size: human
  sound: leader
  speed: 12
  wants_magic_items: 1
  wants_wargear: 1
  weight: 1450
Ixoth:
  ac: -1
  alignment: -14
  always_hostile: 1
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
  can_fly: 1
  color: red
  corpse:
    fire: 1
  corpse_nutrition: 1600
  extra_nasty: 1
  follows_stair_users: 1
  glyph: D
  has_proper_name: 1
  has_thick_hide: 1
  hitdice: 15
  immobile_until_seen: 1
  infravision_detectable: 1
  invalid_polymorph_target: 1
  is_carnivorous: 1
  is_unique: 1
  is_very_strong: 1
  lacks_hands: 1
  mr: 20
  name: Ixoth
  not_randomly_generated: 1
  resist:
    fire: 1
    stone: 1
  sees_invisible: 1
  size: gigantic
  sound: nemesis
  speed: 12
  wants_gems: 1
  wants_gold: 1
  wants_magic_items: 1
  wants_quest_artifact: 1
  weight: 4500
Juiblex:
  ac: -7
  acidic_corpse: 1
  alignment: -15
  always_hostile: 1
  attacks:
    - damage: 4d10
      mode: engulf
      type: sickness
    - damage: 3d6
      mode: spit
      type: acid
  can_fly: 1
  color: bright_green
  corpse: {}
  extra_nasty: 1
  follows_stair_users: 1
  gehennom_exclusive: 1
  glyph: '&'
  has_infravision: 1
  has_proper_name: 1
  hitdice: 50
  immobile_until_seen: 1
  invalid_polymorph_target: 1
  is_always_male: 1
  is_amorphous: 1
  is_amphibious: 1
  is_demon: 1
  is_rank_lord: 1
  is_unique: 1
  lacks_head: 1
  mr: 65
  name: Juiblex
  never_drops_corpse: 1
  not_randomly_generated: 1
  nutrition: 0
  poisonous_corpse: 1
  resist:
    acid: 1
    fire: 1
    poison: 1
    stone: 1
  sees_invisible: 1
  size: large
  sound: gurgle
  speed: 3
  wants_amulet: 1
  weight: 1500
Keystone Kop:
  ac: 10
  alignment: 9
  always_hostile: 1
  attacks:
    - damage: 1d4
      mode: weapon
      type: physical
  color: blue
  corpse: {}
  corpse_nutrition: 200
  glyph: K
  hitdice: 1
  humanoid_body: 1
  infravision_detectable: 1
  is_always_male: 1
  is_genocidable: 1
  is_human: 1
  is_wanderer: 1
  large_group: 1
  mr: 10
  name: Keystone Kop
  not_randomly_generated: 1
  resist: {}
  size: human
  sound: arrest
  speed: 6
  wants_wargear: 1
  weight: 1450
King Arthur:
  ac: 0
  alignment: 20
  always_peaceful: 1
  attacks:
    - damage: 1d6
      mode: weapon
      type: physical
    - damage: 1d6
      mode: weapon
      type: physical
  color: magenta
  corpse: {}
  corpse_nutrition: 400
  glyph: '@'
  has_proper_name: 1
  hitdice: 20
  humanoid_body: 1
  immobile_until_disturbed: 1
  infravision_detectable: 1
  invalid_polymorph_target: 1
  is_always_male: 1
  is_carnivorous: 1
  is_herbivorous: 1
  is_human: 1
  is_unique: 1
  is_very_strong: 1
  mr: 40
  name: King Arthur
  not_randomly_generated: 1
  resist: {}
  size: human
  sound: leader
  speed: 12
  wants_magic_items: 1
  wants_wargear: 1
  weight: 1450
Kop Kaptain:
  ac: 10
  alignment: 12
  always_hostile: 1
  attacks:
    - damage: 2d6
      mode: weapon
      type: physical
  color: magenta
  corpse: {}
  corpse_nutrition: 200
  glyph: K
  hitdice: 4
  humanoid_body: 1
  infravision_detectable: 1
  is_always_male: 1
  is_genocidable: 1
  is_human: 1
  is_very_strong: 1
  is_wanderer: 1
  mr: 20
  name: Kop Kaptain
  not_randomly_generated: 1
  resist: {}
  size: human
  sound: arrest
  speed: 12
  wants_wargear: 1
  weight: 1450
Kop Lieutenant:
  ac: 10
  alignment: 11
  always_hostile: 1
  attacks:
    - damage: 1d8
      mode: weapon
      type: physical
  color: cyan
  corpse: {}
  corpse_nutrition: 200
  glyph: K
  hitdice: 3
  humanoid_body: 1
  infravision_detectable: 1
  is_always_male: 1
  is_genocidable: 1
  is_human: 1
  is_very_strong: 1
  is_wanderer: 1
  mr: 20
  name: Kop Lieutenant
  not_randomly_generated: 1
  resist: {}
  size: human
  sound: arrest
  speed: 10
  wants_wargear: 1
  weight: 1450
Kop Sergeant:
  ac: 10
  alignment: 10
  always_hostile: 1
  attacks:
    - damage: 1d6
      mode: weapon
      type: physical
  color: blue
  corpse: {}
  corpse_nutrition: 200
  glyph: K
  hitdice: 2
  humanoid_body: 1
  infravision_detectable: 1
  is_always_male: 1
  is_genocidable: 1
  is_human: 1
  is_very_strong: 1
  is_wanderer: 1
  mr: 10
  name: Kop Sergeant
  not_randomly_generated: 1
  resist: {}
  size: human
  small_group: 1
  sound: arrest
  speed: 8
  wants_wargear: 1
  weight: 1450
Lord Carnarvon:
  ac: 0
  alignment: 20
  always_peaceful: 1
  attacks:
    - damage: 1d6
      mode: weapon
      type: physical
  color: magenta
  corpse: {}
  corpse_nutrition: 400
  glyph: '@'
  has_proper_name: 1
  hitdice: 20
  humanoid_body: 1
  immobile_until_disturbed: 1
  infravision_detectable: 1
  invalid_polymorph_target: 1
  is_always_male: 1
  is_carnivorous: 1
  is_herbivorous: 1
  is_human: 1
  is_unique: 1
  is_very_strong: 1
  mr: 30
  name: Lord Carnarvon
  not_randomly_generated: 1
  resist: {}
  size: human
  sound: leader
  speed: 12
  tunnels_with_pick: 1
  wants_magic_items: 1
  wants_wargear: 1
  weight: 1450
Lord Sato:
  ac: 0
  alignment: 20
  always_peaceful: 1
  attacks:
    - damage: 1d8
      mode: weapon
      type: physical
    - damage: 1d6
      mode: weapon
      type: physical
  color: magenta
  corpse: {}
  corpse_nutrition: 400
  glyph: '@'
  has_proper_name: 1
  hitdice: 20
  humanoid_body: 1
  immobile_until_disturbed: 1
  infravision_detectable: 1
  invalid_polymorph_target: 1
  is_always_male: 1
  is_carnivorous: 1
  is_herbivorous: 1
  is_human: 1
  is_unique: 1
  is_very_strong: 1
  mr: 30
  name: Lord Sato
  not_randomly_generated: 1
  resist: {}
  size: human
  sound: leader
  speed: 12
  wants_magic_items: 1
  wants_wargear: 1
  weight: 1450
Lord Surtur:
  ac: 2
  alignment: 12
  always_hostile: 1
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
  color: magenta
  corpse:
    fire: 1
  corpse_nutrition: 850
  extra_nasty: 1
  follows_stair_users: 1
  glyph: H
  has_infravision: 1
  has_proper_name: 1
  hitdice: 15
  humanoid_body: 1
  immobile_until_seen: 1
  infravision_detectable: 1
  invalid_polymorph_target: 1
  is_always_male: 1
  is_carnivorous: 1
  is_giant: 1
  is_herbivorous: 1
  is_unique: 1
  is_very_strong: 1
  mr: 50
  name: Lord Surtur
  not_randomly_generated: 1
  resist:
    fire: 1
    stone: 1
  size: huge
  sound: nemesis
  speed: 12
  throws_boulders: 1
  wants_gems: 1
  wants_quest_artifact: 1
  wants_wargear: 1
  weight: 2250
Master Assassin:
  ac: 0
  alignment: 18
  always_hostile: 1
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
  color: magenta
  corpse: {}
  corpse_nutrition: 400
  extra_nasty: 1
  follows_stair_users: 1
  glyph: '@'
  hitdice: 15
  humanoid_body: 1
  immobile_until_seen: 1
  infravision_detectable: 1
  invalid_polymorph_target: 1
  is_carnivorous: 1
  is_herbivorous: 1
  is_human: 1
  is_unique: 1
  is_very_strong: 1
  mr: 30
  name: Master Assassin
  not_randomly_generated: 1
  resist:
    stone: 1
  size: human
  sound: nemesis
  speed: 12
  wants_magic_items: 1
  wants_quest_artifact: 1
  wants_wargear: 1
  weight: 1450
Master Kaen:
  ac: -10
  alignment: -20
  always_hostile: 1
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
  color: magenta
  corpse:
    poison: 1
  corpse_nutrition: 400
  extra_nasty: 1
  follows_stair_users: 1
  glyph: '@'
  has_proper_name: 1
  hitdice: 25
  humanoid_body: 1
  immobile_until_seen: 1
  infravision_detectable: 1
  invalid_polymorph_target: 1
  is_herbivorous: 1
  is_human: 1
  is_unique: 1
  is_very_strong: 1
  mr: 10
  name: Master Kaen
  not_randomly_generated: 1
  resist:
    poison: 1
    stone: 1
  sees_invisible: 1
  size: human
  sound: nemesis
  speed: 12
  wants_magic_items: 1
  wants_quest_artifact: 1
  wants_wargear: 1
  weight: 1450
Master of Thieves:
  ac: 0
  alignment: -20
  always_peaceful: 1
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
  color: magenta
  corpse: {}
  corpse_nutrition: 400
  glyph: '@'
  hitdice: 20
  humanoid_body: 1
  immobile_until_disturbed: 1
  infravision_detectable: 1
  invalid_polymorph_target: 1
  is_always_male: 1
  is_carnivorous: 1
  is_herbivorous: 1
  is_human: 1
  is_unique: 1
  is_very_strong: 1
  mr: 30
  name: Master of Thieves
  not_randomly_generated: 1
  resist:
    stone: 1
  size: human
  sound: leader
  speed: 12
  wants_gems: 1
  wants_gold: 1
  wants_magic_items: 1
  wants_wargear: 1
  weight: 1450
Medusa:
  ac: 2
  alignment: -15
  always_hostile: 1
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
  can_fly: 1
  can_swim: 1
  color: bright_green
  corpse:
    poison: 1
    stone: 1
  corpse_nutrition: 400
  glyph: '@'
  has_proper_name: 1
  hitdice: 20
  humanoid_body: 1
  immobile_until_seen: 1
  infravision_detectable: 1
  invalid_polymorph_target: 1
  is_always_female: 1
  is_amphibious: 1
  is_carnivorous: 1
  is_herbivorous: 1
  is_unique: 1
  is_very_strong: 1
  mr: 50
  name: Medusa
  not_randomly_generated: 1
  poisonous_corpse: 1
  resist:
    poison: 1
    stone: 1
  size: large
  sound: hiss
  speed: 12
  weight: 1450
Minion of Huhetotl:
  ac: -2
  alignment: -14
  always_hostile: 1
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
  can_fly: 1
  color: red
  corpse: {}
  corpse_nutrition: 400
  extra_nasty: 1
  follows_stair_users: 1
  glyph: '&'
  has_infravision: 1
  hitdice: 16
  immobile_until_seen: 1
  infravision_detectable: 1
  invalid_polymorph_target: 1
  is_demon: 1
  is_unique: 1
  is_very_strong: 1
  mr: 75
  name: Minion of Huhetotl
  never_drops_corpse: 1
  not_randomly_generated: 1
  poisonous_corpse: 1
  resist:
    fire: 1
    poison: 1
    stone: 1
  sees_invisible: 1
  size: large
  sound: nemesis
  speed: 12
  wants_quest_artifact: 1
  wants_wargear: 1
  weight: 1450
Mordor orc:
  ac: 10
  alignment: -5
  attacks:
    - damage: 1d6
      mode: weapon
      type: physical
  color: blue
  corpse: {}
  corpse_nutrition: 200
  glyph: o
  has_infravision: 1
  hitdice: 3
  humanoid_body: 1
  infravision_detectable: 1
  is_carnivorous: 1
  is_genocidable: 1
  is_herbivorous: 1
  is_orc: 1
  is_very_strong: 1
  large_group: 1
  mr: 0
  name: Mordor orc
  rarity: 1
  resist: {}
  size: human
  sound: orc
  speed: 5
  wants_gems: 1
  wants_gold: 1
  wants_wargear: 1
  weight: 1200
Nalzok:
  ac: -2
  alignment: -127
  always_hostile: 1
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
  can_fly: 1
  color: red
  corpse: {}
  corpse_nutrition: 400
  extra_nasty: 1
  follows_stair_users: 1
  glyph: '&'
  has_infravision: 1
  has_proper_name: 1
  hitdice: 16
  immobile_until_seen: 1
  infravision_detectable: 1
  invalid_polymorph_target: 1
  is_demon: 1
  is_unique: 1
  is_very_strong: 1
  mr: 85
  name: Nalzok
  never_drops_corpse: 1
  not_randomly_generated: 1
  poisonous_corpse: 1
  resist:
    fire: 1
    poison: 1
    stone: 1
  sees_invisible: 1
  size: large
  sound: nemesis
  speed: 12
  wants_quest_artifact: 1
  wants_wargear: 1
  weight: 1450
Nazgul:
  ac: 0
  alignment: -17
  always_hostile: 1
  attacks:
    - damage: 1d4
      mode: weapon
      type: drain
    - damage: 2d25
      mode: breathe
      type: sleep
  color: magenta
  corpse: {}
  follows_stair_users: 1
  glyph: W
  hitdice: 13
  humanoid_body: 1
  invalid_polymorph_target: 1
  is_always_male: 1
  is_breathless: 1
  is_genocidable: 1
  is_undead: 1
  is_very_strong: 1
  mr: 25
  name: Nazgul
  never_drops_corpse: 1
  nutrition: 0
  rarity: 1
  resist:
    cold: 1
    poison: 1
    sleep: 1
  size: human
  sound: spell
  speed: 12
  wants_wargear: 1
  weight: 1450
Neferet the Green:
  ac: 0
  alignment: 0
  always_peaceful: 1
  attacks:
    - damage: 1d6
      mode: weapon
      type: physical
    - damage: 2d8
      mode: magic
      type: wizardspell
  color: green
  corpse: {}
  corpse_nutrition: 400
  glyph: '@'
  has_proper_name: 1
  hitdice: 20
  humanoid_body: 1
  immobile_until_disturbed: 1
  infravision_detectable: 1
  invalid_polymorph_target: 1
  is_always_female: 1
  is_carnivorous: 1
  is_herbivorous: 1
  is_human: 1
  is_unique: 1
  is_very_strong: 1
  mr: 60
  name: Neferet the Green
  not_randomly_generated: 1
  resist: {}
  size: human
  sound: leader
  speed: 12
  wants_magic_items: 1
  wants_wargear: 1
  weight: 1450
Norn:
  ac: 0
  alignment: 0
  always_peaceful: 1
  attacks:
    - damage: 1d8
      mode: weapon
      type: physical
    - damage: 1d6
      mode: weapon
      type: physical
  color: magenta
  corpse: {}
  corpse_nutrition: 400
  glyph: '@'
  hitdice: 20
  humanoid_body: 1
  immobile_until_disturbed: 1
  infravision_detectable: 1
  invalid_polymorph_target: 1
  is_always_female: 1
  is_carnivorous: 1
  is_herbivorous: 1
  is_human: 1
  is_unique: 1
  is_very_strong: 1
  mr: 80
  name: Norn
  not_randomly_generated: 1
  resist:
    cold: 1
  size: human
  sound: leader
  speed: 12
  wants_magic_items: 1
  wants_wargear: 1
  weight: 1450
Olog-hai:
  ac: -4
  alignment: -7
  always_hostile: 1
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
  color: magenta
  corpse: {}
  corpse_nutrition: 400
  follows_stair_users: 1
  glyph: T
  has_infravision: 1
  hitdice: 13
  humanoid_body: 1
  infravision_detectable: 1
  is_carnivorous: 1
  is_genocidable: 1
  is_very_strong: 1
  mr: 0
  name: Olog-hai
  rarity: 1
  regenerates_quickly: 1
  resist: {}
  size: large
  sound: grunt
  speed: 12
  wants_wargear: 1
  weight: 1500
Oracle:
  ac: 0
  alignment: 0
  always_peaceful: 1
  attacks:
    - damage: 0d4
      mode: passive
      type: magicmissile
  color: bright_blue
  corpse: {}
  corpse_nutrition: 400
  glyph: '@'
  hitdice: 12
  humanoid_body: 1
  infravision_detectable: 1
  invalid_polymorph_target: 1
  is_always_female: 1
  is_carnivorous: 1
  is_herbivorous: 1
  is_human: 1
  is_unique: 1
  mr: 50
  name: Oracle
  not_randomly_generated: 1
  resist: {}
  size: human
  sound: oracle
  speed: 0
  weight: 1450
Orcus:
  ac: -6
  alignment: -20
  always_hostile: 1
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
  can_fly: 1
  color: magenta
  corpse: {}
  corpse_nutrition: 500
  extra_nasty: 1
  follows_stair_users: 1
  gehennom_exclusive: 1
  glyph: '&'
  has_infravision: 1
  has_proper_name: 1
  hitdice: 66
  immobile_until_seen: 1
  infravision_detectable: 1
  invalid_polymorph_target: 1
  is_always_male: 1
  is_demon: 1
  is_rank_prince: 1
  is_unique: 1
  mr: 85
  name: Orcus
  never_drops_corpse: 1
  not_randomly_generated: 1
  poisonous_corpse: 1
  resist:
    fire: 1
    poison: 1
  sees_invisible: 1
  size: huge
  sound: orc
  speed: 9
  wants_amulet: 1
  wants_book: 1
  wants_wargear: 1
  weight: 1500
Orion:
  ac: 0
  alignment: 0
  always_peaceful: 1
  attacks:
    - damage: 1d6
      mode: weapon
      type: physical
  can_swim: 1
  color: magenta
  corpse: {}
  corpse_nutrition: 400
  glyph: '@'
  has_infravision: 1
  has_proper_name: 1
  hitdice: 20
  humanoid_body: 1
  immobile_until_disturbed: 1
  infravision_detectable: 1
  invalid_polymorph_target: 1
  is_always_male: 1
  is_amphibious: 1
  is_carnivorous: 1
  is_herbivorous: 1
  is_human: 1
  is_unique: 1
  is_very_strong: 1
  mr: 30
  name: Orion
  not_randomly_generated: 1
  resist: {}
  sees_invisible: 1
  size: human
  sound: leader
  speed: 12
  wants_magic_items: 1
  wants_wargear: 1
  weight: 1450
Pelias:
  ac: 0
  alignment: 0
  always_peaceful: 1
  attacks:
    - damage: 1d6
      mode: weapon
      type: physical
  color: magenta
  corpse: {}
  corpse_nutrition: 400
  glyph: '@'
  has_proper_name: 1
  hitdice: 20
  humanoid_body: 1
  immobile_until_disturbed: 1
  infravision_detectable: 1
  invalid_polymorph_target: 1
  is_always_male: 1
  is_carnivorous: 1
  is_herbivorous: 1
  is_human: 1
  is_unique: 1
  is_very_strong: 1
  mr: 30
  name: Pelias
  not_randomly_generated: 1
  resist:
    poison: 1
  size: human
  sound: leader
  speed: 12
  wants_magic_items: 1
  wants_wargear: 1
  weight: 1450
Pestilence:
  ac: -5
  alignment: 0
  always_hostile: 1
  attacks:
    - damage: 8d8
      mode: touch
      type: Pestilence
    - damage: 8d8
      mode: touch
      type: Pestilence
  can_fly: 1
  color: magenta
  corpse: {}
  corpse_nutrition: 1
  extra_nasty: 1
  follows_stair_users: 1
  glyph: '&'
  has_infravision: 1
  has_proper_name: 1
  has_teleport_control: 1
  hitdice: 30
  humanoid_body: 1
  infravision_detectable: 1
  invalid_polymorph_target: 1
  is_unique: 1
  is_very_strong: 1
  mr: 100
  name: Pestilence
  not_randomly_generated: 1
  regenerates_quickly: 1
  resist:
    cold: 1
    elec: 1
    fire: 1
    poison: 1
    sleep: 1
    stone: 1
  sees_invisible: 1
  size: human
  sound: rider
  speed: 12
  weight: 1450
Scorpius:
  ac: 10
  alignment: -15
  always_hostile: 1
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
  color: magenta
  corpse:
    poison: 1
  corpse_nutrition: 350
  extra_nasty: 1
  follows_stair_users: 1
  glyph: s
  has_proper_name: 1
  hitdice: 15
  immobile_until_seen: 1
  invalid_polymorph_target: 1
  is_animal: 1
  is_carnivorous: 1
  is_unique: 1
  is_very_strong: 1
  lacks_hands: 1
  lays_eggs: 1
  mr: 0
  name: Scorpius
  not_randomly_generated: 1
  poisonous_corpse: 1
  resist:
    poison: 1
    stone: 1
  size: human
  sound: nemesis
  speed: 12
  wants_magic_items: 1
  wants_quest_artifact: 1
  wants_wargear: 1
  weight: 750
Shaman Karnov:
  ac: 0
  alignment: 20
  always_peaceful: 1
  attacks:
    - damage: 2d4
      mode: weapon
      type: physical
  color: magenta
  corpse: {}
  corpse_nutrition: 400
  glyph: '@'
  has_proper_name: 1
  hitdice: 20
  humanoid_body: 1
  immobile_until_disturbed: 1
  infravision_detectable: 1
  invalid_polymorph_target: 1
  is_always_male: 1
  is_carnivorous: 1
  is_herbivorous: 1
  is_human: 1
  is_unique: 1
  is_very_strong: 1
  mr: 30
  name: Shaman Karnov
  not_randomly_generated: 1
  resist: {}
  size: human
  sound: leader
  speed: 12
  wants_magic_items: 1
  wants_wargear: 1
  weight: 1450
Thoth Amon:
  ac: 0
  alignment: -14
  always_hostile: 1
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
  color: magenta
  corpse: {}
  corpse_nutrition: 400
  extra_nasty: 1
  follows_stair_users: 1
  glyph: '@'
  has_proper_name: 1
  hitdice: 16
  humanoid_body: 1
  immobile_until_seen: 1
  infravision_detectable: 1
  invalid_polymorph_target: 1
  is_always_male: 1
  is_carnivorous: 1
  is_herbivorous: 1
  is_human: 1
  is_unique: 1
  is_very_strong: 1
  mr: 10
  name: Thoth Amon
  never_drops_corpse: 1
  not_randomly_generated: 1
  resist:
    poison: 1
    stone: 1
  size: human
  sound: nemesis
  speed: 12
  wants_magic_items: 1
  wants_quest_artifact: 1
  wants_wargear: 1
  weight: 1450
Twoflower:
  ac: 10
  alignment: 0
  always_peaceful: 1
  attacks:
    - damage: 1d6
      mode: weapon
      type: physical
    - damage: 1d6
      mode: weapon
      type: physical
  color: white
  corpse: {}
  corpse_nutrition: 400
  glyph: '@'
  has_proper_name: 1
  hitdice: 20
  humanoid_body: 1
  immobile_until_disturbed: 1
  infravision_detectable: 1
  invalid_polymorph_target: 1
  is_always_male: 1
  is_carnivorous: 1
  is_herbivorous: 1
  is_human: 1
  is_unique: 1
  is_very_strong: 1
  mr: 20
  name: Twoflower
  not_randomly_generated: 1
  resist: {}
  size: human
  sound: leader
  speed: 12
  wants_magic_items: 1
  wants_wargear: 1
  weight: 1450
Uruk-hai:
  ac: 10
  alignment: -4
  attacks:
    - damage: 1d8
      mode: weapon
      type: physical
  color: black
  corpse: {}
  corpse_nutrition: 300
  glyph: o
  has_infravision: 1
  hitdice: 3
  humanoid_body: 1
  infravision_detectable: 1
  is_carnivorous: 1
  is_genocidable: 1
  is_herbivorous: 1
  is_orc: 1
  is_very_strong: 1
  large_group: 1
  mr: 0
  name: Uruk-hai
  rarity: 1
  resist: {}
  size: human
  sound: orc
  speed: 7
  wants_gems: 1
  wants_gold: 1
  wants_wargear: 1
  weight: 1300
Vlad the Impaler:
  ac: -3
  alignment: -10
  always_hostile: 1
  attacks:
    - damage: 1d10
      mode: weapon
      type: physical
    - damage: 1d10
      mode: bite
      type: drain
  can_fly: 1
  color: magenta
  corpse: {}
  corpse_nutrition: 400
  extra_nasty: 1
  follows_stair_users: 1
  glyph: V
  has_proper_name: 1
  hitdice: 14
  humanoid_body: 1
  immobile_until_seen: 1
  infravision_detectable: 1
  invalid_polymorph_target: 1
  is_always_male: 1
  is_breathless: 1
  is_rank_prince: 1
  is_undead: 1
  is_unique: 1
  is_very_strong: 1
  mr: 80
  name: Vlad the Impaler
  never_drops_corpse: 1
  not_randomly_generated: 1
  poisonous_corpse: 1
  regenerates_quickly: 1
  resist:
    poison: 1
    sleep: 1
  size: human
  sound: vampire
  speed: 18
  wants_candelabrum: 1
  weight: 1450
Wizard of Yendor:
  ac: -8
  alignment: none
  always_hostile: 1
  attacks:
    - damage: 2d12
      mode: claw
      type: stealamulet
    - damage: 0d0
      mode: magic
      type: wizardspell
  can_fly: 1
  color: magenta
  corpse:
    fire: 1
    poison: 1
  corpse_nutrition: 400
  extra_nasty: 1
  glyph: '@'
  has_teleport_control: 1
  has_teleportitis: 1
  hitdice: 30
  humanoid_body: 1
  immobile_until_seen: 1
  infravision_detectable: 1
  invalid_polymorph_target: 1
  is_always_male: 1
  is_breathless: 1
  is_carnivorous: 1
  is_herbivorous: 1
  is_human: 1
  is_rank_prince: 1
  is_unique: 1
  is_very_strong: 1
  mr: 100
  name: Wizard of Yendor
  not_randomly_generated: 1
  regenerates_quickly: 1
  resist:
    fire: 1
    poison: 1
  sees_invisible: 1
  size: human
  sound: cuss
  speed: 12
  wants_amulet: 1
  wants_bell: 1
  wants_book: 1
  wants_candelabrum: 1
  wants_magic_items: 1
  wants_quest_artifact: 1
  weight: 1450
Woodland-elf:
  ac: 10
  alignment: -5
  attacks:
    - damage: 2d4
      mode: weapon
      type: physical
  color: green
  corpse:
    sleep: 1
  corpse_nutrition: 350
  glyph: '@'
  has_infravision: 1
  hitdice: 4
  humanoid_body: 1
  infravision_detectable: 1
  is_carnivorous: 1
  is_elf: 1
  is_genocidable: 1
  is_herbivorous: 1
  mr: 10
  name: Woodland-elf
  rarity: 2
  resist:
    sleep: 1
  sees_invisible: 1
  size: human
  small_group: 1
  sound: humanoid
  speed: 12
  wants_wargear: 1
  weight: 800
Yeenoghu:
  ac: -5
  alignment: -15
  always_hostile: 1
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
  can_fly: 1
  color: magenta
  corpse: {}
  corpse_nutrition: 500
  extra_nasty: 1
  follows_stair_users: 1
  gehennom_exclusive: 1
  glyph: '&'
  has_infravision: 1
  has_proper_name: 1
  hitdice: 56
  infravision_detectable: 1
  invalid_polymorph_target: 1
  is_always_male: 1
  is_demon: 1
  is_rank_lord: 1
  is_unique: 1
  mr: 80
  name: Yeenoghu
  never_drops_corpse: 1
  not_randomly_generated: 1
  poisonous_corpse: 1
  resist:
    fire: 1
    poison: 1
  sees_invisible: 1
  size: large
  sound: orc
  speed: 18
  wants_amulet: 1
  wants_wargear: 1
  weight: 900
abbot:
  ac: 10
  alignment: 0
  always_peaceful: 1
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
  color: white
  corpse: {}
  corpse_nutrition: 400
  glyph: '@'
  hitdice: 5
  humanoid_body: 1
  infravision_detectable: 1
  invalid_polymorph_target: 1
  is_herbivorous: 1
  is_human: 1
  is_very_strong: 1
  mr: 20
  name: abbot
  not_randomly_generated: 1
  resist: {}
  size: human
  sound: guardian
  speed: 12
  wants_wargear: 1
  weight: 1450
acid blob:
  ac: 8
  acidic_corpse: 1
  alignment: 0
  attacks:
    - damage: 1d8
      mode: passive
      type: acid
  color: green
  corpse:
    stone: 1
  corpse_nutrition: 10
  glyph: b
  hitdice: 1
  is_amorphous: 1
  is_breathless: 1
  is_genderless: 1
  is_genocidable: 1
  is_mindless: 1
  is_wanderer: 1
  lacks_eyes: 1
  lacks_head: 1
  lacks_limbs: 1
  mr: 0
  name: acid blob
  rarity: 2
  resist:
    acid: 1
    poison: 1
    sleep: 1
    stone: 1
  size: tiny
  sound: silent
  speed: 3
  weight: 30
acolyte:
  ac: 10
  alignment: 0
  always_peaceful: 1
  attacks:
    - damage: 1d6
      mode: weapon
      type: physical
    - damage: 0d0
      mode: magic
      type: clericalspell
  color: white
  corpse: {}
  corpse_nutrition: 400
  glyph: '@'
  hitdice: 5
  humanoid_body: 1
  infravision_detectable: 1
  invalid_polymorph_target: 1
  is_carnivorous: 1
  is_herbivorous: 1
  is_human: 1
  is_very_strong: 1
  mr: 20
  name: acolyte
  not_randomly_generated: 1
  resist: {}
  size: human
  sound: guardian
  speed: 12
  wants_wargear: 1
  weight: 1450
air elemental:
  ac: 2
  alignment: 0
  attacks:
    - damage: 1d10
      mode: engulf
      type: physical
  can_fly: 1
  color: cyan
  corpse: {}
  glyph: E
  hitdice: 8
  is_genderless: 1
  is_mindless: 1
  is_very_strong: 1
  lacks_eyes: 1
  lacks_head: 1
  lacks_limbs: 1
  made_of_gas: 1
  mr: 30
  name: air elemental
  never_drops_corpse: 1
  nutrition: 0
  rarity: 1
  resist:
    poison: 1
    stone: 1
  size: huge
  sound: silent
  speed: 36
  weight: 0
aligned priest:
  ac: 10
  alignment: 0
  always_peaceful: 1
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
  color: white
  corpse: {}
  corpse_nutrition: 400
  glyph: '@'
  hitdice: 12
  humanoid_body: 1
  infravision_detectable: 1
  invalid_polymorph_target: 1
  is_carnivorous: 1
  is_herbivorous: 1
  is_human: 1
  is_rank_lord: 1
  mr: 50
  name: aligned priest
  not_randomly_generated: 1
  resist:
    elec: 1
  size: human
  sound: priest
  speed: 12
  wants_wargear: 1
  weight: 1450
ape:
  ac: 6
  alignment: 0
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
  color: brown
  corpse: {}
  corpse_nutrition: 500
  glyph: Y
  hitdice: 4
  humanoid_body: 1
  infravision_detectable: 1
  is_animal: 1
  is_carnivorous: 1
  is_genocidable: 1
  is_very_strong: 1
  mr: 0
  name: ape
  rarity: 2
  resist: {}
  size: large
  small_group: 1
  sound: growl
  speed: 12
  weight: 1100
apprentice:
  ac: 10
  alignment: 0
  always_peaceful: 1
  attacks:
    - damage: 1d6
      mode: weapon
      type: physical
    - damage: 0d0
      mode: magic
      type: wizardspell
  color: white
  corpse: {}
  corpse_nutrition: 400
  glyph: '@'
  hitdice: 5
  humanoid_body: 1
  infravision_detectable: 1
  invalid_polymorph_target: 1
  is_carnivorous: 1
  is_herbivorous: 1
  is_human: 1
  is_very_strong: 1
  mr: 30
  name: apprentice
  not_randomly_generated: 1
  resist: {}
  size: human
  sound: guardian
  speed: 12
  wants_magic_items: 1
  wants_wargear: 1
  weight: 1450
arch-lich:
  ac: -6
  alignment: -15
  always_hostile: 1
  attacks:
    - damage: 5d6
      mode: touch
      type: cold
    - damage: 0d0
      mode: magic
      type: wizardspell
  color: magenta
  corpse:
    cold: 1
    fire: 1
  corpse_nutrition: 100
  gehennom_exclusive: 1
  glyph: L
  has_infravision: 1
  hitdice: 25
  humanoid_body: 1
  is_breathless: 1
  is_genocidable: 1
  is_undead: 1
  mr: 90
  name: arch-lich
  never_drops_corpse: 1
  poisonous_corpse: 1
  rarity: 1
  regenerates_quickly: 1
  resist:
    cold: 1
    elec: 1
    fire: 1
    poison: 1
    sleep: 1
  size: human
  sound: mumble
  speed: 9
  wants_book: 1
  wants_magic_items: 1
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
  color: white
  corpse: {}
  corpse_nutrition: 400
  glyph: '@'
  hitdice: 10
  humanoid_body: 1
  infravision_detectable: 1
  invalid_polymorph_target: 1
  is_carnivorous: 1
  is_herbivorous: 1
  is_human: 1
  is_very_strong: 1
  mr: 1
  name: archeologist
  not_randomly_generated: 1
  resist: {}
  size: human
  sound: humanoid
  speed: 12
  tunnels_with_pick: 1
  wants_wargear: 1
  weight: 1450
attendant:
  ac: 10
  alignment: 3
  always_peaceful: 1
  attacks:
    - damage: 1d6
      mode: weapon
      type: physical
  color: white
  corpse: {}
  corpse_nutrition: 400
  glyph: '@'
  hitdice: 5
  humanoid_body: 1
  infravision_detectable: 1
  invalid_polymorph_target: 1
  is_carnivorous: 1
  is_herbivorous: 1
  is_human: 1
  is_very_strong: 1
  mr: 10
  name: attendant
  not_randomly_generated: 1
  resist:
    poison: 1
  size: human
  sound: guardian
  speed: 12
  wants_wargear: 1
  weight: 1450
baby black dragon:
  ac: 2
  alignment: 0
  always_hostile: 1
  attacks:
    - damage: 2d6
      mode: bite
      type: physical
  can_fly: 1
  color: black
  corpse: {}
  corpse_nutrition: 500
  glyph: D
  has_thick_hide: 1
  hitdice: 12
  is_carnivorous: 1
  is_genocidable: 1
  is_very_strong: 1
  lacks_hands: 1
  mr: 10
  name: baby black dragon
  resist:
    disint: 1
  size: huge
  sound: roar
  speed: 9
  wants_gems: 1
  wants_gold: 1
  weight: 1500
baby blue dragon:
  ac: 2
  alignment: 0
  always_hostile: 1
  attacks:
    - damage: 2d6
      mode: bite
      type: physical
  can_fly: 1
  color: blue
  corpse: {}
  corpse_nutrition: 500
  glyph: D
  has_thick_hide: 1
  hitdice: 12
  is_carnivorous: 1
  is_genocidable: 1
  is_very_strong: 1
  lacks_hands: 1
  mr: 10
  name: baby blue dragon
  resist:
    elec: 1
  size: huge
  sound: roar
  speed: 9
  wants_gems: 1
  wants_gold: 1
  weight: 1500
baby crocodile:
  ac: 7
  alignment: 0
  always_hostile: 1
  attacks:
    - damage: 1d4
      mode: bite
      type: physical
  can_swim: 1
  color: brown
  corpse: {}
  corpse_nutrition: 200
  glyph: ':'
  hitdice: 3
  is_amphibious: 1
  is_animal: 1
  is_carnivorous: 1
  is_genocidable: 1
  lacks_hands: 1
  mr: 0
  name: baby crocodile
  resist: {}
  size: medium
  sound: silent
  speed: 6
  weight: 200
baby gray dragon:
  ac: 2
  alignment: 0
  always_hostile: 1
  attacks:
    - damage: 2d6
      mode: bite
      type: physical
  can_fly: 1
  color: gray
  corpse: {}
  corpse_nutrition: 500
  glyph: D
  has_thick_hide: 1
  hitdice: 12
  is_carnivorous: 1
  is_genocidable: 1
  is_very_strong: 1
  lacks_hands: 1
  mr: 10
  name: baby gray dragon
  resist: {}
  size: huge
  sound: roar
  speed: 9
  wants_gems: 1
  wants_gold: 1
  weight: 1500
baby green dragon:
  ac: 2
  alignment: 0
  always_hostile: 1
  attacks:
    - damage: 2d6
      mode: bite
      type: physical
  can_fly: 1
  color: green
  corpse: {}
  corpse_nutrition: 500
  glyph: D
  has_thick_hide: 1
  hitdice: 12
  is_carnivorous: 1
  is_genocidable: 1
  is_very_strong: 1
  lacks_hands: 1
  mr: 10
  name: baby green dragon
  poisonous_corpse: 1
  resist:
    poison: 1
  size: huge
  sound: roar
  speed: 9
  wants_gems: 1
  wants_gold: 1
  weight: 1500
baby long worm:
  ac: 5
  alignment: 0
  always_hostile: 1
  attacks:
    - damage: 1d6
      mode: bite
      type: physical
  cannot_pickup_items: 1
  color: brown
  corpse: {}
  corpse_nutrition: 250
  glyph: w
  hitdice: 8
  is_animal: 1
  is_carnivorous: 1
  is_genocidable: 1
  lacks_limbs: 1
  mr: 0
  name: baby long worm
  resist: {}
  serpentine_body: 1
  size: large
  sound: silent
  speed: 3
  weight: 600
baby orange dragon:
  ac: 2
  alignment: 0
  always_hostile: 1
  attacks:
    - damage: 2d6
      mode: bite
      type: physical
  can_fly: 1
  color: orange
  corpse: {}
  corpse_nutrition: 500
  glyph: D
  has_thick_hide: 1
  hitdice: 12
  is_carnivorous: 1
  is_genocidable: 1
  is_very_strong: 1
  lacks_hands: 1
  mr: 10
  name: baby orange dragon
  resist:
    sleep: 1
  size: huge
  sound: roar
  speed: 9
  wants_gems: 1
  wants_gold: 1
  weight: 1500
baby purple worm:
  ac: 5
  alignment: 0
  always_hostile: 1
  attacks:
    - damage: 1d6
      mode: bite
      type: physical
  color: magenta
  corpse: {}
  corpse_nutrition: 250
  glyph: w
  hitdice: 8
  is_animal: 1
  is_carnivorous: 1
  is_genocidable: 1
  lacks_limbs: 1
  mr: 0
  name: baby purple worm
  resist: {}
  serpentine_body: 1
  size: large
  sound: silent
  speed: 3
  weight: 600
baby red dragon:
  ac: 2
  alignment: 0
  always_hostile: 1
  attacks:
    - damage: 2d6
      mode: bite
      type: physical
  can_fly: 1
  color: red
  corpse: {}
  corpse_nutrition: 500
  glyph: D
  has_thick_hide: 1
  hitdice: 12
  infravision_detectable: 1
  is_carnivorous: 1
  is_genocidable: 1
  is_very_strong: 1
  lacks_hands: 1
  mr: 10
  name: baby red dragon
  resist:
    fire: 1
  size: huge
  sound: roar
  speed: 9
  wants_gems: 1
  wants_gold: 1
  weight: 1500
baby silver dragon:
  ac: 2
  alignment: 0
  always_hostile: 1
  attacks:
    - damage: 2d6
      mode: bite
      type: physical
  can_fly: 1
  color: gray
  corpse: {}
  corpse_nutrition: 500
  glyph: D
  has_thick_hide: 1
  hitdice: 12
  is_carnivorous: 1
  is_genocidable: 1
  is_very_strong: 1
  lacks_hands: 1
  mr: 10
  name: baby silver dragon
  resist: {}
  size: huge
  sound: roar
  speed: 9
  wants_gems: 1
  wants_gold: 1
  weight: 1500
baby white dragon:
  ac: 2
  alignment: 0
  always_hostile: 1
  attacks:
    - damage: 2d6
      mode: bite
      type: physical
  can_fly: 1
  color: white
  corpse: {}
  corpse_nutrition: 500
  glyph: D
  has_thick_hide: 1
  hitdice: 12
  is_carnivorous: 1
  is_genocidable: 1
  is_very_strong: 1
  lacks_hands: 1
  mr: 10
  name: baby white dragon
  resist:
    cold: 1
  size: huge
  sound: roar
  speed: 9
  wants_gems: 1
  wants_gold: 1
  weight: 1500
baby yellow dragon:
  ac: 2
  acidic_corpse: 1
  alignment: 0
  always_hostile: 1
  attacks:
    - damage: 2d6
      mode: bite
      type: physical
  can_fly: 1
  color: yellow
  corpse: {}
  corpse_nutrition: 500
  glyph: D
  has_thick_hide: 1
  hitdice: 12
  is_carnivorous: 1
  is_genocidable: 1
  is_very_strong: 1
  lacks_hands: 1
  mr: 10
  name: baby yellow dragon
  resist:
    acid: 1
    stone: 1
  size: huge
  sound: roar
  speed: 9
  wants_gems: 1
  wants_gold: 1
  weight: 1500
balrog:
  ac: -2
  alignment: -14
  always_hostile: 1
  attacks:
    - damage: 8d4
      mode: weapon
      type: physical
    - damage: 4d6
      mode: weapon
      type: physical
  can_fly: 1
  color: red
  corpse: {}
  corpse_nutrition: 400
  extra_nasty: 1
  follows_stair_users: 1
  gehennom_exclusive: 1
  glyph: '&'
  has_infravision: 1
  hitdice: 16
  infravision_detectable: 1
  is_demon: 1
  is_very_strong: 1
  mr: 75
  name: balrog
  never_drops_corpse: 1
  poisonous_corpse: 1
  rarity: 1
  resist:
    fire: 1
    poison: 1
  sees_invisible: 1
  size: large
  sound: silent
  speed: 5
  wants_wargear: 1
  weight: 1450
baluchitherium:
  ac: 5
  alignment: 0
  always_hostile: 1
  attacks:
    - damage: 5d4
      mode: claw
      type: physical
    - damage: 5d4
      mode: claw
      type: physical
  color: gray
  corpse: {}
  corpse_nutrition: 800
  glyph: q
  has_thick_hide: 1
  hitdice: 14
  infravision_detectable: 1
  is_animal: 1
  is_genocidable: 1
  is_herbivorous: 1
  is_very_strong: 1
  lacks_hands: 1
  mr: 0
  name: baluchitherium
  rarity: 2
  resist: {}
  size: large
  sound: silent
  speed: 12
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
  color: white
  corpse: {}
  corpse_nutrition: 400
  glyph: '@'
  hitdice: 10
  humanoid_body: 1
  infravision_detectable: 1
  invalid_polymorph_target: 1
  is_carnivorous: 1
  is_herbivorous: 1
  is_human: 1
  is_very_strong: 1
  mr: 1
  name: barbarian
  not_randomly_generated: 1
  resist:
    poison: 1
  size: human
  sound: humanoid
  speed: 12
  wants_wargear: 1
  weight: 1450
barbed devil:
  ac: 0
  alignment: 8
  always_hostile: 1
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
  corpse_nutrition: 400
  extra_nasty: 1
  follows_stair_users: 1
  gehennom_exclusive: 1
  glyph: '&'
  has_infravision: 1
  has_thick_hide: 1
  hitdice: 8
  infravision_detectable: 1
  is_demon: 1
  mr: 35
  name: barbed devil
  never_drops_corpse: 1
  poisonous_corpse: 1
  rarity: 2
  resist:
    fire: 1
    poison: 1
  size: human
  small_group: 1
  sound: silent
  speed: 12
  weight: 1450
barrow wight:
  ac: 5
  alignment: -3
  always_hostile: 1
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
  color: gray
  corpse: {}
  follows_stair_users: 1
  glyph: W
  hitdice: 3
  humanoid_body: 1
  is_breathless: 1
  is_genocidable: 1
  is_undead: 1
  mr: 5
  name: barrow wight
  never_drops_corpse: 1
  nutrition: 0
  rarity: 1
  resist:
    cold: 1
    poison: 1
    sleep: 1
  size: human
  sound: spell
  speed: 12
  wants_wargear: 1
  weight: 1200
bat:
  ac: 8
  alignment: 0
  attacks:
    - damage: 1d4
      mode: bite
      type: physical
  can_fly: 1
  color: brown
  corpse: {}
  corpse_nutrition: 20
  glyph: B
  hitdice: 0
  infravision_detectable: 1
  is_animal: 1
  is_carnivorous: 1
  is_genocidable: 1
  is_wanderer: 1
  lacks_hands: 1
  mr: 0
  name: bat
  rarity: 1
  resist: {}
  size: tiny
  small_group: 1
  sound: sqeek
  speed: 22
  weight: 20
black dragon:
  ac: -1
  alignment: -6
  always_hostile: 1
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
  can_fly: 1
  color: black
  corpse:
    disint: 1
  corpse_nutrition: 1500
  extra_nasty: 1
  glyph: D
  has_thick_hide: 1
  hitdice: 15
  is_carnivorous: 1
  is_genocidable: 1
  is_very_strong: 1
  lacks_hands: 1
  lays_eggs: 1
  mr: 20
  name: black dragon
  rarity: 1
  resist:
    disint: 1
  sees_invisible: 1
  size: gigantic
  sound: roar
  speed: 9
  wants_gems: 1
  wants_gold: 1
  wants_magic_items: 1
  weight: 4500
black light:
  ac: 0
  alignment: 0
  always_hostile: 1
  attacks:
    - damage: 10d12
      mode: explode
      type: hallucination
  can_fly: 1
  cannot_pickup_items: 1
  color: black
  corpse: {}
  glyph: y
  hitdice: 5
  is_amorphous: 1
  is_breathless: 1
  is_genderless: 1
  is_genocidable: 1
  is_mindless: 1
  lacks_eyes: 1
  lacks_head: 1
  lacks_limbs: 1
  made_of_gas: 1
  mr: 0
  name: black light
  never_drops_corpse: 1
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
  sees_invisible: 1
  size: small
  sound: silent
  speed: 15
  weight: 0
black naga:
  ac: 2
  acidic_corpse: 1
  alignment: 4
  attacks:
    - damage: 2d6
      mode: bite
      type: physical
    - damage: 0d0
      mode: spit
      type: acid
  cannot_pickup_items: 1
  color: black
  corpse:
    poison: 1
    stone: 1
  corpse_nutrition: 400
  glyph: N
  has_thick_hide: 1
  hitdice: 8
  is_carnivorous: 1
  is_genocidable: 1
  is_very_strong: 1
  lacks_limbs: 1
  lays_eggs: 1
  mr: 10
  name: black naga
  rarity: 1
  resist:
    acid: 1
    poison: 1
    stone: 1
  serpentine_body: 1
  size: huge
  sound: mumble
  speed: 14
  weight: 2600
black naga hatchling:
  ac: 6
  acidic_corpse: 1
  alignment: 0
  attacks:
    - damage: 1d4
      mode: bite
      type: physical
  cannot_pickup_items: 1
  color: black
  corpse:
    poison: 1
    stone: 1
  corpse_nutrition: 100
  glyph: N
  has_thick_hide: 1
  hitdice: 3
  is_carnivorous: 1
  is_genocidable: 1
  is_very_strong: 1
  lacks_limbs: 1
  mr: 0
  name: black naga hatchling
  resist:
    acid: 1
    poison: 1
    stone: 1
  serpentine_body: 1
  size: large
  sound: mumble
  speed: 10
  weight: 500
black pudding:
  ac: 6
  acidic_corpse: 1
  alignment: 0
  always_hostile: 1
  attacks:
    - damage: 3d8
      mode: bite
      type: corrode
    - damage: 0d0
      mode: passive
      type: corrode
  color: black
  corpse:
    cold: 1
    elec: 1
    poison: 1
  corpse_nutrition: 250
  glyph: P
  hitdice: 10
  is_amorphous: 1
  is_breathless: 1
  is_carnivorous: 1
  is_genderless: 1
  is_genocidable: 1
  is_herbivorous: 1
  is_mindless: 1
  lacks_eyes: 1
  lacks_head: 1
  lacks_limbs: 1
  mr: 0
  name: black pudding
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
  corpse_nutrition: 300
  glyph: u
  hitdice: 4
  infravision_detectable: 1
  is_genocidable: 1
  is_herbivorous: 1
  is_very_strong: 1
  is_wanderer: 1
  lacks_hands: 1
  mr: 70
  name: black unicorn
  rarity: 1
  resist:
    poison: 1
  size: large
  sound: neigh
  speed: 24
  wants_gems: 1
  weight: 1300
blue dragon:
  ac: -1
  alignment: -7
  always_hostile: 1
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
  can_fly: 1
  color: blue
  corpse:
    elec: 1
  corpse_nutrition: 1500
  extra_nasty: 1
  glyph: D
  has_thick_hide: 1
  hitdice: 15
  is_carnivorous: 1
  is_genocidable: 1
  is_very_strong: 1
  lacks_hands: 1
  lays_eggs: 1
  mr: 20
  name: blue dragon
  rarity: 1
  resist:
    elec: 1
  sees_invisible: 1
  size: gigantic
  sound: roar
  speed: 9
  wants_gems: 1
  wants_gold: 1
  wants_magic_items: 1
  weight: 4500
blue jelly:
  ac: 8
  alignment: 0
  always_hostile: 1
  attacks:
    - damage: 0d6
      mode: passive
      type: cold
  cannot_pickup_items: 1
  color: blue
  corpse:
    cold: 1
    poison: 1
  corpse_nutrition: 20
  glyph: j
  hitdice: 4
  is_amorphous: 1
  is_breathless: 1
  is_genderless: 1
  is_genocidable: 1
  is_mindless: 1
  lacks_eyes: 1
  lacks_head: 1
  lacks_limbs: 1
  mr: 10
  name: blue jelly
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
  always_hostile: 1
  attacks:
    - damage: 3d4
      mode: weapon
      type: physical
    - damage: 2d4
      mode: sting
      type: poison
  color: gray
  corpse: {}
  corpse_nutrition: 400
  extra_nasty: 1
  follows_stair_users: 1
  gehennom_exclusive: 1
  glyph: '&'
  has_infravision: 1
  hitdice: 9
  infravision_detectable: 1
  is_demon: 1
  mr: 40
  name: bone devil
  never_drops_corpse: 1
  poisonous_corpse: 1
  rarity: 2
  resist:
    fire: 1
    poison: 1
  size: large
  small_group: 1
  sound: silent
  speed: 15
  wants_wargear: 1
  weight: 1450
brown mold:
  ac: 9
  alignment: 0
  always_hostile: 1
  attacks:
    - damage: 0d6
      mode: passive
      type: cold
  cannot_pickup_items: 1
  color: brown
  corpse:
    cold: 1
    poison: 1
  corpse_nutrition: 30
  glyph: F
  hitdice: 1
  is_breathless: 1
  is_genderless: 1
  is_genocidable: 1
  is_mindless: 1
  lacks_eyes: 1
  lacks_head: 1
  lacks_limbs: 1
  mr: 0
  name: brown mold
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
  acidic_corpse: 1
  alignment: 0
  always_hostile: 1
  attacks:
    - damage: 0d0
      mode: bite
      type: decay
  color: brown
  corpse:
    cold: 1
    elec: 1
    poison: 1
  corpse_nutrition: 250
  glyph: P
  hitdice: 5
  is_amorphous: 1
  is_breathless: 1
  is_carnivorous: 1
  is_genderless: 1
  is_genocidable: 1
  is_herbivorous: 1
  is_mindless: 1
  lacks_eyes: 1
  lacks_head: 1
  lacks_limbs: 1
  mr: 0
  name: brown pudding
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
  color: brown
  corpse: {}
  corpse_nutrition: 250
  glyph: h
  has_infravision: 1
  hitdice: 3
  humanoid_body: 1
  infravision_detectable: 1
  is_carnivorous: 1
  is_genocidable: 1
  is_herbivorous: 1
  is_very_strong: 1
  mr: 0
  name: bugbear
  rarity: 1
  resist: {}
  size: large
  sound: growl
  speed: 9
  wants_wargear: 1
  weight: 1250
captain:
  ac: 10
  alignment: -5
  always_hostile: 1
  attacks:
    - damage: 4d4
      mode: weapon
      type: physical
    - damage: 4d4
      mode: weapon
      type: physical
  color: blue
  corpse: {}
  corpse_nutrition: 400
  follows_stair_users: 1
  glyph: '@'
  hitdice: 12
  humanoid_body: 1
  infravision_detectable: 1
  invalid_polymorph_target: 1
  is_carnivorous: 1
  is_genocidable: 1
  is_herbivorous: 1
  is_human: 1
  is_mercenary: 1
  is_very_strong: 1
  mr: 15
  name: captain
  rarity: 1
  resist: {}
  size: human
  sound: soldier
  speed: 10
  wants_wargear: 1
  weight: 1450
carnivorous ape:
  ac: 6
  alignment: 0
  always_hostile: 1
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
  color: black
  corpse: {}
  corpse_nutrition: 550
  glyph: Y
  hitdice: 6
  humanoid_body: 1
  infravision_detectable: 1
  is_animal: 1
  is_carnivorous: 1
  is_genocidable: 1
  is_very_strong: 1
  mr: 0
  name: carnivorous ape
  rarity: 1
  resist: {}
  size: large
  sound: growl
  speed: 12
  weight: 1250
cave spider:
  ac: 3
  alignment: 0
  always_hostile: 1
  attacks:
    - damage: 1d2
      mode: bite
      type: physical
  color: gray
  corpse:
    poison: 1
  corpse_nutrition: 50
  glyph: s
  hides_under_item: 1
  hitdice: 1
  is_animal: 1
  is_carnivorous: 1
  is_genocidable: 1
  lacks_hands: 1
  lays_eggs: 1
  mr: 0
  name: cave spider
  rarity: 2
  resist:
    poison: 1
  size: tiny
  small_group: 1
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
  color: white
  corpse: {}
  corpse_nutrition: 400
  glyph: '@'
  hitdice: 10
  humanoid_body: 1
  infravision_detectable: 1
  invalid_polymorph_target: 1
  is_always_male: 1
  is_carnivorous: 1
  is_herbivorous: 1
  is_human: 1
  is_very_strong: 1
  mr: 0
  name: caveman
  not_randomly_generated: 1
  resist: {}
  size: human
  sound: humanoid
  speed: 12
  wants_wargear: 1
  weight: 1450
cavewoman:
  ac: 10
  alignment: 1
  attacks:
    - damage: 2d4
      mode: weapon
      type: physical
  color: white
  corpse: {}
  corpse_nutrition: 400
  glyph: '@'
  hitdice: 10
  humanoid_body: 1
  infravision_detectable: 1
  invalid_polymorph_target: 1
  is_always_female: 1
  is_carnivorous: 1
  is_herbivorous: 1
  is_human: 1
  is_very_strong: 1
  mr: 0
  name: cavewoman
  not_randomly_generated: 1
  resist: {}
  size: human
  sound: humanoid
  speed: 12
  wants_wargear: 1
  weight: 1450
centipede:
  ac: 3
  alignment: 0
  always_hostile: 1
  attacks:
    - damage: 1d3
      mode: bite
      type: poison
  color: yellow
  corpse:
    poison: 1
  corpse_nutrition: 50
  glyph: s
  hides_under_item: 1
  hitdice: 2
  is_animal: 1
  is_carnivorous: 1
  is_genocidable: 1
  lacks_hands: 1
  lays_eggs: 1
  mr: 0
  name: centipede
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
  always_hostile: 1
  attacks:
    - damage: 4d2
      mode: bite
      type: physical
  color: brown
  corpse: {}
  corpse_nutrition: 100
  glyph: ':'
  hitdice: 6
  invalid_polymorph_target: 1
  is_animal: 1
  is_carnivorous: 1
  is_genocidable: 1
  lacks_hands: 1
  mr: 10
  name: chameleon
  rarity: 2
  resist: {}
  size: tiny
  sound: silent
  speed: 5
  weight: 100
chickatrice:
  ac: 8
  alignment: 0
  always_hostile: 1
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
  corpse_nutrition: 10
  glyph: c
  hitdice: 4
  infravision_detectable: 1
  is_animal: 1
  is_carnivorous: 1
  is_genocidable: 1
  is_herbivorous: 1
  lacks_hands: 1
  mr: 30
  name: chickatrice
  rarity: 1
  resist:
    poison: 1
    stone: 1
  size: tiny
  small_group: 1
  sound: hiss
  speed: 4
  weight: 10
chieftain:
  ac: 10
  alignment: 0
  always_peaceful: 1
  attacks:
    - damage: 1d6
      mode: weapon
      type: physical
  color: white
  corpse: {}
  corpse_nutrition: 400
  glyph: '@'
  hitdice: 5
  humanoid_body: 1
  infravision_detectable: 1
  invalid_polymorph_target: 1
  is_carnivorous: 1
  is_herbivorous: 1
  is_human: 1
  is_very_strong: 1
  mr: 10
  name: chieftain
  not_randomly_generated: 1
  resist:
    poison: 1
  size: human
  sound: guardian
  speed: 12
  wants_wargear: 1
  weight: 1450
clay golem:
  ac: 7
  alignment: 0
  always_hostile: 1
  attacks:
    - damage: 3d10
      mode: claw
      type: physical
  color: brown
  corpse: {}
  glyph: "'"
  has_thick_hide: 1
  hitdice: 11
  humanoid_body: 1
  is_breathless: 1
  is_mindless: 1
  is_very_strong: 1
  mr: 40
  name: clay golem
  never_drops_corpse: 1
  nutrition: 0
  rarity: 1
  resist:
    poison: 1
    sleep: 1
  size: large
  sound: silent
  speed: 7
  weight: 1550
cobra:
  ac: 2
  alignment: 0
  always_hostile: 1
  attacks:
    - damage: 2d4
      mode: bite
      type: poison
    - damage: 0d0
      mode: spit
      type: blind
  can_swim: 1
  cannot_pickup_items: 1
  color: blue
  corpse:
    poison: 1
  corpse_nutrition: 100
  glyph: S
  hides_under_item: 1
  hitdice: 6
  is_animal: 1
  is_carnivorous: 1
  is_genocidable: 1
  lacks_limbs: 1
  lays_eggs: 1
  mr: 0
  name: cobra
  poisonous_corpse: 1
  rarity: 1
  resist:
    poison: 1
  serpentine_body: 1
  size: medium
  sound: hiss
  speed: 18
  weight: 250
cockatrice:
  ac: 6
  alignment: 0
  always_hostile: 1
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
  corpse_nutrition: 30
  glyph: c
  hitdice: 5
  infravision_detectable: 1
  is_animal: 1
  is_carnivorous: 1
  is_genocidable: 1
  is_herbivorous: 1
  lacks_hands: 1
  lays_eggs: 1
  mr: 30
  name: cockatrice
  rarity: 5
  resist:
    poison: 1
    stone: 1
  size: small
  sound: hiss
  speed: 6
  weight: 30
couatl:
  absent_from_gehennom: 1
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
  can_fly: 1
  color: green
  corpse: {}
  corpse_nutrition: 400
  extra_nasty: 1
  follows_stair_users: 1
  glyph: A
  has_infravision: 1
  hitdice: 8
  infravision_detectable: 1
  is_minion: 1
  is_very_strong: 1
  mr: 30
  name: couatl
  never_drops_corpse: 1
  poisonous_corpse: 1
  rarity: 1
  resist:
    poison: 1
  size: large
  small_group: 1
  sound: hiss
  speed: 10
  weight: 900
coyote:
  ac: 7
  alignment: 0
  always_hostile: 1
  attacks:
    - damage: 1d4
      mode: bite
      type: physical
  color: brown
  corpse: {}
  corpse_nutrition: 250
  glyph: d
  hitdice: 1
  infravision_detectable: 1
  is_animal: 1
  is_carnivorous: 1
  is_genocidable: 1
  lacks_hands: 1
  mr: 0
  name: coyote
  rarity: 1
  resist: {}
  size: small
  small_group: 1
  sound: bark
  speed: 12
  weight: 300
crocodile:
  ac: 5
  alignment: 0
  always_hostile: 1
  attacks:
    - damage: 4d2
      mode: bite
      type: physical
    - damage: 1d12
      mode: claw
      type: physical
  can_swim: 1
  color: brown
  corpse: {}
  corpse_nutrition: 400
  glyph: ':'
  has_thick_hide: 1
  hitdice: 6
  is_amphibious: 1
  is_animal: 1
  is_carnivorous: 1
  is_genocidable: 1
  is_very_strong: 1
  lacks_hands: 1
  lays_eggs: 1
  mr: 0
  name: crocodile
  rarity: 1
  resist: {}
  size: large
  sound: silent
  speed: 9
  weight: 1450
demilich:
  ac: -2
  alignment: -12
  always_hostile: 1
  attacks:
    - damage: 3d4
      mode: touch
      type: cold
    - damage: 0d0
      mode: magic
      type: wizardspell
  color: red
  corpse:
    cold: 1
  corpse_nutrition: 100
  glyph: L
  has_infravision: 1
  hitdice: 14
  humanoid_body: 1
  is_breathless: 1
  is_genocidable: 1
  is_undead: 1
  mr: 60
  name: demilich
  never_drops_corpse: 1
  poisonous_corpse: 1
  rarity: 1
  regenerates_quickly: 1
  resist:
    cold: 1
    poison: 1
    sleep: 1
  size: human
  sound: mumble
  speed: 9
  wants_magic_items: 1
  weight: 1200
dingo:
  ac: 5
  alignment: 0
  always_hostile: 1
  attacks:
    - damage: 1d6
      mode: bite
      type: physical
  color: yellow
  corpse: {}
  corpse_nutrition: 200
  glyph: d
  hitdice: 4
  infravision_detectable: 1
  is_animal: 1
  is_carnivorous: 1
  is_genocidable: 1
  lacks_hands: 1
  mr: 0
  name: dingo
  rarity: 1
  resist: {}
  size: medium
  sound: bark
  speed: 16
  weight: 400
disenchanter:
  ac: -10
  alignment: -3
  always_hostile: 1
  attacks:
    - damage: 4d4
      mode: claw
      type: disenchant
    - damage: 0d0
      mode: passive
      type: disenchant
  color: blue
  corpse: {}
  corpse_nutrition: 200
  gehennom_exclusive: 1
  glyph: R
  hitdice: 12
  infravision_detectable: 1
  is_animal: 1
  is_carnivorous: 1
  is_genocidable: 1
  mr: 0
  name: disenchanter
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
  can_fly: 1
  color: yellow
  corpse: {}
  corpse_nutrition: 400
  follows_stair_users: 1
  glyph: '&'
  hitdice: 7
  humanoid_body: 1
  infravision_detectable: 1
  invalid_polymorph_target: 1
  mr: 30
  name: djinni
  never_drops_corpse: 1
  not_randomly_generated: 1
  poisonous_corpse: 1
  resist:
    poison: 1
    stone: 1
  size: human
  sound: djinni
  speed: 12
  wants_wargear: 1
  weight: 1500
dog:
  ac: 5
  alignment: 0
  attacks:
    - damage: 1d6
      mode: bite
      type: physical
  color: white
  corpse: {}
  corpse_nutrition: 200
  food_makes_peaceful: 1
  glyph: d
  hitdice: 4
  infravision_detectable: 1
  is_animal: 1
  is_carnivorous: 1
  is_genocidable: 1
  lacks_hands: 1
  mr: 0
  name: dog
  rarity: 1
  resist: {}
  size: medium
  sound: bark
  speed: 16
  weight: 400
doppelganger:
  ac: 5
  alignment: 0
  always_hostile: 1
  attacks:
    - damage: 1d12
      mode: weapon
      type: physical
  color: white
  corpse: {}
  corpse_nutrition: 400
  glyph: '@'
  hitdice: 9
  humanoid_body: 1
  infravision_detectable: 1
  invalid_polymorph_target: 1
  is_carnivorous: 1
  is_genocidable: 1
  is_herbivorous: 1
  is_human: 1
  is_very_strong: 1
  mr: 20
  name: doppelganger
  rarity: 1
  resist:
    sleep: 1
  size: human
  sound: imitate
  speed: 12
  wants_wargear: 1
  weight: 1450
dust vortex:
  ac: 2
  alignment: 0
  always_hostile: 1
  attacks:
    - damage: 2d8
      mode: engulf
      type: blind
  can_fly: 1
  color: brown
  corpse: {}
  glyph: v
  hitdice: 4
  is_breathless: 1
  is_genderless: 1
  is_genocidable: 1
  is_mindless: 1
  lacks_eyes: 1
  lacks_head: 1
  lacks_limbs: 1
  mr: 30
  name: dust vortex
  never_drops_corpse: 1
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
  color: red
  corpse: {}
  corpse_nutrition: 300
  glyph: h
  has_infravision: 1
  hitdice: 2
  humanoid_body: 1
  infravision_detectable: 1
  invalid_polymorph_target: 1
  is_carnivorous: 1
  is_dwarf: 1
  is_genocidable: 1
  is_herbivorous: 1
  is_very_strong: 1
  mr: 10
  name: dwarf
  rarity: 3
  resist: {}
  size: human
  sound: humanoid
  speed: 6
  tunnels_with_pick: 1
  wants_gems: 1
  wants_gold: 1
  wants_wargear: 1
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
  color: magenta
  corpse: {}
  corpse_nutrition: 300
  glyph: h
  has_infravision: 1
  hitdice: 6
  humanoid_body: 1
  infravision_detectable: 1
  is_always_male: 1
  is_carnivorous: 1
  is_dwarf: 1
  is_genocidable: 1
  is_herbivorous: 1
  is_rank_prince: 1
  is_very_strong: 1
  mr: 20
  name: dwarf king
  rarity: 1
  resist: {}
  size: human
  sound: humanoid
  speed: 6
  tunnels_with_pick: 1
  wants_gems: 1
  wants_gold: 1
  wants_wargear: 1
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
  color: blue
  corpse: {}
  corpse_nutrition: 300
  glyph: h
  has_infravision: 1
  hitdice: 4
  humanoid_body: 1
  infravision_detectable: 1
  is_always_male: 1
  is_carnivorous: 1
  is_dwarf: 1
  is_genocidable: 1
  is_herbivorous: 1
  is_rank_lord: 1
  is_very_strong: 1
  mr: 10
  name: dwarf lord
  rarity: 2
  resist: {}
  size: human
  sound: humanoid
  speed: 6
  tunnels_with_pick: 1
  wants_gems: 1
  wants_gold: 1
  wants_wargear: 1
  weight: 900
dwarf mummy:
  ac: 5
  alignment: -4
  always_hostile: 1
  attacks:
    - damage: 1d6
      mode: claw
      type: physical
  color: red
  corpse: {}
  corpse_nutrition: 150
  glyph: M
  has_infravision: 1
  hitdice: 5
  humanoid_body: 1
  is_breathless: 1
  is_dwarf: 1
  is_genocidable: 1
  is_mindless: 1
  is_undead: 1
  mr: 20
  name: dwarf mummy
  never_drops_corpse: 1
  poisonous_corpse: 1
  rarity: 1
  resist:
    cold: 1
    poison: 1
    sleep: 1
  size: human
  sound: silent
  speed: 10
  wants_gems: 1
  wants_gold: 1
  weight: 900
dwarf zombie:
  ac: 9
  alignment: -3
  always_hostile: 1
  attacks:
    - damage: 1d6
      mode: claw
      type: physical
  color: red
  corpse: {}
  corpse_nutrition: 150
  follows_stair_users: 1
  glyph: Z
  has_infravision: 1
  hitdice: 2
  humanoid_body: 1
  is_breathless: 1
  is_dwarf: 1
  is_genocidable: 1
  is_mindless: 1
  is_undead: 1
  mr: 0
  name: dwarf zombie
  never_drops_corpse: 1
  poisonous_corpse: 1
  rarity: 1
  resist:
    cold: 1
    poison: 1
    sleep: 1
  size: human
  small_group: 1
  sound: silent
  speed: 6
  weight: 900
earth elemental:
  ac: 2
  alignment: 0
  attacks:
    - damage: 4d6
      mode: claw
      type: physical
  color: brown
  corpse: {}
  glyph: E
  has_thick_hide: 1
  hitdice: 8
  ignores_walls: 1
  is_breathless: 1
  is_genderless: 1
  is_mindless: 1
  is_very_strong: 1
  lacks_eyes: 1
  lacks_head: 1
  lacks_limbs: 1
  mr: 30
  name: earth elemental
  never_drops_corpse: 1
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
  weight: 2500
electric eel:
  ac: -3
  alignment: 0
  always_hostile: 1
  attacks:
    - damage: 4d6
      mode: bite
      type: electricity
    - damage: 0d0
      mode: touch
      type: wrap
  can_swim: 1
  cannot_pickup_items: 1
  color: bright_blue
  corpse:
    elec: 1
  corpse_nutrition: 250
  glyph: ;
  hitdice: 7
  infravision_detectable: 1
  is_amphibious: 1
  is_animal: 1
  is_carnivorous: 1
  is_genocidable: 1
  lacks_limbs: 1
  lays_eggs: 1
  mr: 0
  name: electric eel
  not_randomly_generated: 1
  resist:
    elec: 1
  serpentine_body: 1
  size: huge
  sound: silent
  speed: 10
  weight: 200
elf:
  ac: 10
  alignment: -3
  attacks:
    - damage: 1d8
      mode: weapon
      type: physical
  color: white
  corpse:
    sleep: 1
  corpse_nutrition: 350
  glyph: '@'
  has_infravision: 1
  hitdice: 10
  humanoid_body: 1
  infravision_detectable: 1
  invalid_polymorph_target: 1
  is_carnivorous: 1
  is_elf: 1
  is_herbivorous: 1
  is_very_strong: 1
  mr: 2
  name: elf
  not_randomly_generated: 1
  resist:
    sleep: 1
  sees_invisible: 1
  size: human
  sound: humanoid
  speed: 12
  wants_wargear: 1
  weight: 800
elf mummy:
  ac: 4
  alignment: -5
  always_hostile: 1
  attacks:
    - damage: 2d4
      mode: claw
      type: physical
  color: green
  corpse: {}
  corpse_nutrition: 175
  glyph: M
  has_infravision: 1
  hitdice: 6
  humanoid_body: 1
  is_breathless: 1
  is_elf: 1
  is_genocidable: 1
  is_mindless: 1
  is_undead: 1
  mr: 30
  name: elf mummy
  never_drops_corpse: 1
  poisonous_corpse: 1
  rarity: 1
  resist:
    cold: 1
    poison: 1
    sleep: 1
  size: human
  sound: silent
  speed: 12
  weight: 800
elf zombie:
  ac: 9
  alignment: -3
  always_hostile: 1
  attacks:
    - damage: 1d7
      mode: claw
      type: physical
  color: green
  corpse: {}
  corpse_nutrition: 175
  follows_stair_users: 1
  glyph: Z
  has_infravision: 1
  hitdice: 3
  humanoid_body: 1
  is_breathless: 1
  is_elf: 1
  is_genocidable: 1
  is_mindless: 1
  is_undead: 1
  mr: 0
  name: elf zombie
  never_drops_corpse: 1
  rarity: 1
  resist:
    cold: 1
    poison: 1
    sleep: 1
  size: human
  small_group: 1
  sound: silent
  speed: 6
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
  color: bright_blue
  corpse:
    sleep: 1
  corpse_nutrition: 350
  glyph: '@'
  has_infravision: 1
  hitdice: 8
  humanoid_body: 1
  infravision_detectable: 1
  is_always_male: 1
  is_carnivorous: 1
  is_elf: 1
  is_genocidable: 1
  is_herbivorous: 1
  is_rank_lord: 1
  is_very_strong: 1
  mr: 20
  name: elf-lord
  rarity: 2
  resist:
    sleep: 1
  sees_invisible: 1
  size: human
  small_group: 1
  sound: humanoid
  speed: 12
  wants_wargear: 1
  weight: 800
energy vortex:
  ac: 2
  alignment: 0
  always_hostile: 1
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
  can_fly: 1
  color: bright_blue
  corpse: {}
  glyph: v
  hitdice: 6
  is_breathless: 1
  is_genderless: 1
  is_genocidable: 1
  is_mindless: 1
  lacks_eyes: 1
  lacks_head: 1
  lacks_limbs: 1
  made_of_gas: 1
  mr: 30
  name: energy vortex
  never_drops_corpse: 1
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
  weight: 0
erinys:
  ac: 2
  alignment: 10
  always_hostile: 1
  attacks:
    - damage: 2d4
      mode: weapon
      type: poison
  color: red
  corpse: {}
  corpse_nutrition: 400
  extra_nasty: 1
  follows_stair_users: 1
  gehennom_exclusive: 1
  glyph: '&'
  has_infravision: 1
  hitdice: 7
  humanoid_body: 1
  infravision_detectable: 1
  invalid_polymorph_target: 1
  is_always_female: 1
  is_demon: 1
  is_very_strong: 1
  mr: 30
  name: erinys
  never_drops_corpse: 1
  poisonous_corpse: 1
  rarity: 2
  resist:
    fire: 1
    poison: 1
  size: human
  small_group: 1
  sound: silent
  speed: 12
  wants_wargear: 1
  weight: 1450
ettin:
  ac: 3
  alignment: 0
  always_hostile: 1
  attacks:
    - damage: 2d8
      mode: weapon
      type: physical
    - damage: 3d6
      mode: weapon
      type: physical
  color: brown
  corpse: {}
  corpse_nutrition: 500
  extra_nasty: 1
  glyph: H
  has_infravision: 1
  hitdice: 10
  humanoid_body: 1
  infravision_detectable: 1
  is_animal: 1
  is_carnivorous: 1
  is_genocidable: 1
  is_very_strong: 1
  mr: 0
  name: ettin
  rarity: 1
  resist: {}
  size: huge
  sound: grunt
  speed: 12
  wants_wargear: 1
  weight: 1700
ettin mummy:
  ac: 4
  alignment: -6
  always_hostile: 1
  attacks:
    - damage: 2d6
      mode: claw
      type: physical
    - damage: 2d6
      mode: claw
      type: physical
  color: blue
  corpse: {}
  corpse_nutrition: 250
  glyph: M
  has_infravision: 1
  hitdice: 7
  humanoid_body: 1
  is_breathless: 1
  is_genocidable: 1
  is_mindless: 1
  is_undead: 1
  is_very_strong: 1
  mr: 30
  name: ettin mummy
  never_drops_corpse: 1
  poisonous_corpse: 1
  rarity: 1
  resist:
    cold: 1
    poison: 1
    sleep: 1
  size: huge
  sound: silent
  speed: 12
  weight: 1700
ettin zombie:
  ac: 6
  alignment: -4
  always_hostile: 1
  attacks:
    - damage: 1d10
      mode: claw
      type: physical
    - damage: 1d10
      mode: claw
      type: physical
  color: blue
  corpse: {}
  corpse_nutrition: 250
  follows_stair_users: 1
  glyph: Z
  has_infravision: 1
  hitdice: 6
  humanoid_body: 1
  is_breathless: 1
  is_genocidable: 1
  is_mindless: 1
  is_undead: 1
  is_very_strong: 1
  mr: 0
  name: ettin zombie
  never_drops_corpse: 1
  rarity: 1
  resist:
    cold: 1
    poison: 1
    sleep: 1
  size: huge
  sound: silent
  speed: 8
  weight: 1700
fire ant:
  ac: 3
  alignment: 0
  always_hostile: 1
  attacks:
    - damage: 2d4
      mode: bite
      type: physical
    - damage: 2d4
      mode: bite
      type: fire
  color: red
  corpse:
    fire: 1
  corpse_nutrition: 10
  glyph: a
  hitdice: 3
  infravision_detectable: 1
  is_animal: 1
  is_carnivorous: 1
  is_genocidable: 1
  lacks_hands: 1
  lays_eggs: 1
  mr: 10
  name: fire ant
  rarity: 1
  resist:
    fire: 1
  size: tiny
  small_group: 1
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
  can_fly: 1
  cannot_pickup_items: 1
  color: yellow
  corpse: {}
  glyph: E
  hitdice: 8
  infravision_detectable: 1
  is_genderless: 1
  is_mindless: 1
  is_very_strong: 1
  lacks_eyes: 1
  lacks_head: 1
  lacks_limbs: 1
  made_of_gas: 1
  mr: 30
  name: fire elemental
  never_drops_corpse: 1
  nutrition: 0
  rarity: 1
  resist:
    fire: 1
    poison: 1
    stone: 1
  size: huge
  sound: silent
  speed: 12
  weight: 0
fire giant:
  ac: 4
  alignment: 2
  attacks:
    - damage: 2d10
      mode: weapon
      type: physical
  color: yellow
  corpse:
    fire: 1
  corpse_nutrition: 750
  extra_nasty: 1
  glyph: H
  has_infravision: 1
  hitdice: 9
  humanoid_body: 1
  infravision_detectable: 1
  is_carnivorous: 1
  is_genocidable: 1
  is_giant: 1
  is_very_strong: 1
  mr: 5
  name: fire giant
  rarity: 1
  resist:
    fire: 1
  size: huge
  small_group: 1
  sound: boast
  speed: 12
  throws_boulders: 1
  wants_gems: 1
  wants_wargear: 1
  weight: 2250
fire vortex:
  ac: 2
  alignment: 0
  always_hostile: 1
  attacks:
    - damage: 1d10
      mode: engulf
      type: fire
    - damage: 0d4
      mode: passive
      type: fire
  can_fly: 1
  color: yellow
  corpse: {}
  gehennom_exclusive: 1
  glyph: v
  hitdice: 8
  infravision_detectable: 1
  is_breathless: 1
  is_genderless: 1
  is_genocidable: 1
  is_mindless: 1
  lacks_eyes: 1
  lacks_head: 1
  lacks_limbs: 1
  made_of_gas: 1
  mr: 30
  name: fire vortex
  never_drops_corpse: 1
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
  weight: 0
flaming sphere:
  ac: 4
  alignment: 0
  always_hostile: 1
  attacks:
    - damage: 4d6
      mode: explode
      type: fire
  can_fly: 1
  color: red
  corpse:
    fire: 1
  corpse_nutrition: 10
  glyph: e
  hitdice: 6
  infravision_detectable: 1
  is_breathless: 1
  is_genderless: 1
  is_genocidable: 1
  is_mindless: 1
  lacks_head: 1
  lacks_limbs: 1
  mr: 0
  name: flaming sphere
  never_drops_corpse: 1
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
  always_hostile: 1
  attacks:
    - damage: 2d8
      mode: claw
      type: physical
    - damage: 2d8
      mode: claw
      type: physical
  color: red
  corpse:
    cold: 1
    elec: 1
    fire: 1
    poison: 1
    sleep: 1
  corpse_nutrition: 600
  glyph: "'"
  hitdice: 9
  humanoid_body: 1
  is_breathless: 1
  is_mindless: 1
  is_very_strong: 1
  mr: 30
  name: flesh golem
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
  weight: 1400
floating eye:
  ac: 9
  alignment: 0
  always_hostile: 1
  attacks:
    - damage: 0d70
      mode: passive
      type: paralyze
  can_fly: 1
  cannot_pickup_items: 1
  color: blue
  corpse: {}
  corpse_nutrition: 10
  glyph: e
  hitdice: 2
  infravision_detectable: 1
  is_amphibious: 1
  is_genderless: 1
  is_genocidable: 1
  lacks_head: 1
  lacks_limbs: 1
  mr: 10
  name: floating eye
  rarity: 5
  resist: {}
  size: small
  sound: silent
  speed: 1
  weight: 10
fog cloud:
  ac: 0
  alignment: 0
  always_hostile: 1
  attacks:
    - damage: 1d6
      mode: engulf
      type: physical
  can_fly: 1
  color: gray
  corpse: {}
  glyph: v
  hitdice: 3
  is_amorphous: 1
  is_breathless: 1
  is_genderless: 1
  is_genocidable: 1
  is_mindless: 1
  lacks_eyes: 1
  lacks_head: 1
  lacks_limbs: 1
  made_of_gas: 1
  mr: 0
  name: fog cloud
  never_drops_corpse: 1
  nutrition: 0
  rarity: 2
  resist:
    poison: 1
    sleep: 1
    stone: 1
  size: huge
  sound: silent
  speed: 1
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
  color: green
  corpse: {}
  corpse_nutrition: 600
  glyph: C
  hitdice: 5
  humanoid_body: 1
  infravision_detectable: 1
  is_carnivorous: 1
  is_genocidable: 1
  is_herbivorous: 1
  is_very_strong: 1
  mr: 10
  name: forest centaur
  rarity: 1
  resist: {}
  size: large
  sound: humanoid
  speed: 18
  wants_gold: 1
  wants_wargear: 1
  weight: 2550
fox:
  ac: 7
  alignment: 0
  always_hostile: 1
  attacks:
    - damage: 1d3
      mode: bite
      type: physical
  color: red
  corpse: {}
  corpse_nutrition: 250
  glyph: d
  hitdice: 0
  infravision_detectable: 1
  is_animal: 1
  is_carnivorous: 1
  is_genocidable: 1
  lacks_hands: 1
  mr: 0
  name: fox
  rarity: 1
  resist: {}
  size: small
  sound: bark
  speed: 15
  weight: 300
freezing sphere:
  absent_from_gehennom: 1
  ac: 4
  alignment: 0
  always_hostile: 1
  attacks:
    - damage: 4d6
      mode: explode
      type: cold
  can_fly: 1
  cannot_pickup_items: 1
  color: white
  corpse:
    cold: 1
  corpse_nutrition: 10
  glyph: e
  hitdice: 6
  infravision_detectable: 1
  is_breathless: 1
  is_genderless: 1
  is_genocidable: 1
  is_mindless: 1
  lacks_head: 1
  lacks_limbs: 1
  mr: 0
  name: freezing sphere
  never_drops_corpse: 1
  rarity: 2
  resist:
    cold: 1
  size: small
  sound: silent
  speed: 13
  weight: 10
frost giant:
  absent_from_gehennom: 1
  ac: 3
  alignment: -3
  attacks:
    - damage: 2d12
      mode: weapon
      type: physical
  color: white
  corpse:
    cold: 1
  corpse_nutrition: 750
  extra_nasty: 1
  glyph: H
  has_infravision: 1
  hitdice: 10
  humanoid_body: 1
  infravision_detectable: 1
  is_carnivorous: 1
  is_genocidable: 1
  is_giant: 1
  is_very_strong: 1
  mr: 10
  name: frost giant
  rarity: 1
  resist:
    cold: 1
  size: huge
  small_group: 1
  sound: boast
  speed: 12
  throws_boulders: 1
  wants_gems: 1
  wants_wargear: 1
  weight: 2250
gargoyle:
  ac: -4
  alignment: -9
  always_hostile: 1
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
  color: brown
  corpse:
    stone: 1
  corpse_nutrition: 200
  glyph: g
  has_thick_hide: 1
  hitdice: 6
  humanoid_body: 1
  is_breathless: 1
  is_genocidable: 1
  is_very_strong: 1
  mr: 0
  name: gargoyle
  rarity: 2
  resist:
    stone: 1
  size: human
  sound: grunt
  speed: 10
  weight: 1000
garter snake:
  ac: 8
  alignment: 0
  attacks:
    - damage: 1d2
      mode: bite
      type: physical
  can_swim: 1
  cannot_pickup_items: 1
  color: green
  corpse: {}
  corpse_nutrition: 60
  glyph: S
  hides_under_item: 1
  hitdice: 1
  is_animal: 1
  is_carnivorous: 1
  is_genocidable: 1
  lacks_limbs: 1
  large_group: 1
  lays_eggs: 1
  mr: 0
  name: garter snake
  rarity: 1
  resist: {}
  serpentine_body: 1
  size: tiny
  sound: hiss
  speed: 8
  weight: 50
gas spore:
  ac: 10
  alignment: 0
  always_hostile: 1
  attacks:
    - damage: 4d6
      mode: boom
      type: physical
  can_fly: 1
  color: gray
  corpse: {}
  corpse_nutrition: 10
  glyph: e
  hitdice: 1
  is_breathless: 1
  is_genderless: 1
  is_genocidable: 1
  is_mindless: 1
  lacks_head: 1
  lacks_limbs: 1
  mr: 0
  name: gas spore
  never_drops_corpse: 1
  rarity: 1
  resist: {}
  size: small
  sound: silent
  speed: 3
  weight: 10
gecko:
  ac: 8
  alignment: 0
  always_hostile: 1
  attacks:
    - damage: 1d3
      mode: bite
      type: physical
  color: green
  corpse: {}
  corpse_nutrition: 20
  glyph: ':'
  hitdice: 1
  is_animal: 1
  is_carnivorous: 1
  is_genocidable: 1
  lacks_hands: 1
  mr: 0
  name: gecko
  rarity: 5
  resist: {}
  size: tiny
  sound: sqeek
  speed: 6
  weight: 10
gelatinous cube:
  ac: 8
  acidic_corpse: 1
  alignment: 0
  always_hostile: 1
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
  corpse_nutrition: 150
  glyph: b
  hitdice: 6
  is_carnivorous: 1
  is_genderless: 1
  is_genocidable: 1
  is_herbivorous: 1
  is_mindless: 1
  is_wanderer: 1
  lacks_eyes: 1
  lacks_head: 1
  lacks_limbs: 1
  mr: 0
  name: gelatinous cube
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
  weight: 600
ghost:
  ac: -5
  alignment: -5
  always_hostile: 1
  attacks:
    - damage: 1d1
      mode: touch
      type: physical
  can_fly: 1
  color: gray
  corpse: {}
  follows_stair_users: 1
  glyph: X
  has_infravision: 1
  hitdice: 10
  humanoid_body: 1
  ignores_walls: 1
  invalid_polymorph_target: 1
  is_breathless: 1
  is_undead: 1
  made_of_gas: 1
  mr: 50
  name: ghost
  never_drops_corpse: 1
  not_randomly_generated: 1
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
  weight: 1450
ghoul:
  ac: 10
  alignment: -2
  always_hostile: 1
  attacks:
    - damage: 1d2
      mode: claw
      type: paralyze
    - damage: 1d3
      mode: claw
      type: physical
  color: black
  corpse: {}
  corpse_nutrition: 50
  glyph: Z
  has_infravision: 1
  hitdice: 3
  humanoid_body: 1
  is_breathless: 1
  is_genocidable: 1
  is_mindless: 1
  is_undead: 1
  is_wanderer: 1
  mr: 0
  name: ghoul
  never_drops_corpse: 1
  poisonous_corpse: 1
  rarity: 1
  resist:
    cold: 1
    poison: 1
    sleep: 1
  size: small
  sound: silent
  speed: 6
  weight: 400
giant:
  ac: 0
  alignment: 2
  attacks:
    - damage: 2d10
      mode: weapon
      type: physical
  color: red
  corpse: {}
  corpse_nutrition: 750
  extra_nasty: 1
  glyph: H
  has_infravision: 1
  hitdice: 6
  humanoid_body: 1
  infravision_detectable: 1
  is_carnivorous: 1
  is_genocidable: 1
  is_giant: 1
  is_very_strong: 1
  mr: 0
  name: giant
  not_randomly_generated: 1
  rarity: 1
  resist: {}
  size: huge
  sound: boast
  speed: 6
  throws_boulders: 1
  wants_gems: 1
  wants_wargear: 1
  weight: 2250
giant ant:
  ac: 3
  alignment: 0
  always_hostile: 1
  attacks:
    - damage: 1d4
      mode: bite
      type: physical
  color: brown
  corpse: {}
  corpse_nutrition: 10
  glyph: a
  hitdice: 2
  is_animal: 1
  is_carnivorous: 1
  is_genocidable: 1
  lacks_hands: 1
  lays_eggs: 1
  mr: 0
  name: giant ant
  rarity: 3
  resist: {}
  size: tiny
  small_group: 1
  sound: silent
  speed: 18
  weight: 10
giant bat:
  ac: 7
  alignment: 0
  always_hostile: 1
  attacks:
    - damage: 1d6
      mode: bite
      type: physical
  can_fly: 1
  color: red
  corpse: {}
  corpse_nutrition: 30
  glyph: B
  hitdice: 2
  infravision_detectable: 1
  is_animal: 1
  is_carnivorous: 1
  is_genocidable: 1
  is_wanderer: 1
  lacks_hands: 1
  mr: 0
  name: giant bat
  rarity: 2
  resist: {}
  size: small
  sound: sqeek
  speed: 22
  weight: 30
giant beetle:
  ac: 4
  alignment: 0
  always_hostile: 1
  attacks:
    - damage: 3d6
      mode: bite
      type: physical
  color: black
  corpse:
    poison: 1
  corpse_nutrition: 10
  glyph: a
  hitdice: 5
  is_animal: 1
  is_carnivorous: 1
  is_genocidable: 1
  lacks_hands: 1
  mr: 0
  name: giant beetle
  poisonous_corpse: 1
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
  always_hostile: 1
  attacks:
    - damage: 3d6
      mode: bite
      type: physical
    - damage: 0d0
      mode: touch
      type: wrap
  can_swim: 1
  cannot_pickup_items: 1
  color: cyan
  corpse: {}
  corpse_nutrition: 250
  glyph: ;
  hitdice: 5
  infravision_detectable: 1
  is_amphibious: 1
  is_animal: 1
  is_carnivorous: 1
  is_genocidable: 1
  lacks_limbs: 1
  lays_eggs: 1
  mr: 0
  name: giant eel
  not_randomly_generated: 1
  resist: {}
  serpentine_body: 1
  size: huge
  sound: silent
  speed: 9
  weight: 200
giant mimic:
  ac: 7
  alignment: 0
  always_hostile: 1
  attacks:
    - damage: 3d6
      mode: claw
      type: stick
    - damage: 3d6
      mode: claw
      type: stick
  clings_to_ceiling: 1
  color: magenta
  corpse: {}
  corpse_nutrition: 500
  glyph: m
  has_thick_hide: 1
  hides_on_ceiling: 1
  hitdice: 9
  is_amorphous: 1
  is_animal: 1
  is_breathless: 1
  is_carnivorous: 1
  is_genocidable: 1
  is_very_strong: 1
  lacks_eyes: 1
  lacks_head: 1
  lacks_limbs: 1
  mr: 20
  name: giant mimic
  rarity: 1
  resist:
    acid: 1
  size: large
  sound: silent
  speed: 3
  weight: 800
giant mummy:
  ac: 3
  alignment: -7
  always_hostile: 1
  attacks:
    - damage: 3d4
      mode: claw
      type: physical
    - damage: 3d4
      mode: claw
      type: physical
  color: cyan
  corpse: {}
  corpse_nutrition: 375
  glyph: M
  has_infravision: 1
  hitdice: 8
  humanoid_body: 1
  is_breathless: 1
  is_genocidable: 1
  is_giant: 1
  is_mindless: 1
  is_undead: 1
  is_very_strong: 1
  mr: 30
  name: giant mummy
  never_drops_corpse: 1
  poisonous_corpse: 1
  rarity: 1
  resist:
    cold: 1
    poison: 1
    sleep: 1
  size: huge
  sound: silent
  speed: 14
  wants_gems: 1
  weight: 2050
giant rat:
  ac: 7
  alignment: 0
  always_hostile: 1
  attacks:
    - damage: 1d3
      mode: bite
      type: physical
  color: brown
  corpse: {}
  corpse_nutrition: 30
  glyph: r
  hitdice: 1
  infravision_detectable: 1
  is_animal: 1
  is_carnivorous: 1
  is_genocidable: 1
  lacks_hands: 1
  mr: 0
  name: giant rat
  rarity: 2
  resist: {}
  size: tiny
  small_group: 1
  sound: sqeek
  speed: 10
  weight: 30
giant spider:
  ac: 4
  alignment: 0
  always_hostile: 1
  attacks:
    - damage: 2d4
      mode: bite
      type: poison
  color: magenta
  corpse:
    poison: 1
  corpse_nutrition: 100
  glyph: s
  hitdice: 5
  is_animal: 1
  is_carnivorous: 1
  is_genocidable: 1
  is_very_strong: 1
  lacks_hands: 1
  lays_eggs: 1
  mr: 0
  name: giant spider
  poisonous_corpse: 1
  rarity: 1
  resist:
    poison: 1
  size: large
  sound: silent
  speed: 15
  weight: 100
giant zombie:
  ac: 6
  alignment: -4
  always_hostile: 1
  attacks:
    - damage: 2d8
      mode: claw
      type: physical
    - damage: 2d8
      mode: claw
      type: physical
  color: cyan
  corpse: {}
  corpse_nutrition: 375
  follows_stair_users: 1
  glyph: Z
  has_infravision: 1
  hitdice: 8
  humanoid_body: 1
  is_breathless: 1
  is_genocidable: 1
  is_giant: 1
  is_mindless: 1
  is_undead: 1
  is_very_strong: 1
  mr: 0
  name: giant zombie
  never_drops_corpse: 1
  rarity: 1
  resist:
    cold: 1
    poison: 1
    sleep: 1
  size: huge
  sound: silent
  speed: 8
  weight: 2050
glass golem:
  ac: 1
  alignment: 0
  always_hostile: 1
  attacks:
    - damage: 2d8
      mode: claw
      type: physical
    - damage: 2d8
      mode: claw
      type: physical
  color: cyan
  corpse: {}
  glyph: "'"
  has_thick_hide: 1
  hitdice: 16
  humanoid_body: 1
  is_breathless: 1
  is_mindless: 1
  is_very_strong: 1
  mr: 50
  name: glass golem
  never_drops_corpse: 1
  nutrition: 0
  rarity: 1
  resist:
    acid: 1
    poison: 1
    sleep: 1
  size: large
  sound: silent
  speed: 6
  weight: 1800
glass piercer:
  ac: 0
  alignment: 0
  always_hostile: 1
  attacks:
    - damage: 4d6
      mode: bite
      type: physical
  cannot_pickup_items: 1
  clings_to_ceiling: 1
  color: white
  corpse: {}
  corpse_nutrition: 300
  glyph: p
  hides_on_ceiling: 1
  hitdice: 7
  is_animal: 1
  is_carnivorous: 1
  is_genocidable: 1
  lacks_eyes: 1
  lacks_limbs: 1
  mr: 0
  name: glass piercer
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
  color: brown
  corpse: {}
  corpse_nutrition: 100
  glyph: G
  has_infravision: 1
  hitdice: 1
  humanoid_body: 1
  infravision_detectable: 1
  invalid_polymorph_target: 1
  is_carnivorous: 1
  is_genocidable: 1
  is_gnome: 1
  is_herbivorous: 1
  mr: 4
  name: gnome
  rarity: 1
  resist: {}
  size: small
  small_group: 1
  sound: orc
  speed: 6
  wants_wargear: 1
  weight: 650
gnome king:
  ac: 10
  alignment: 0
  attacks:
    - damage: 2d6
      mode: weapon
      type: physical
  color: magenta
  corpse: {}
  corpse_nutrition: 150
  glyph: G
  has_infravision: 1
  hitdice: 5
  humanoid_body: 1
  infravision_detectable: 1
  is_always_male: 1
  is_carnivorous: 1
  is_genocidable: 1
  is_gnome: 1
  is_herbivorous: 1
  is_rank_prince: 1
  mr: 20
  name: gnome king
  rarity: 1
  resist: {}
  size: small
  sound: orc
  speed: 10
  wants_wargear: 1
  weight: 750
gnome lord:
  ac: 10
  alignment: 0
  attacks:
    - damage: 1d8
      mode: weapon
      type: physical
  color: blue
  corpse: {}
  corpse_nutrition: 120
  glyph: G
  has_infravision: 1
  hitdice: 3
  humanoid_body: 1
  infravision_detectable: 1
  is_always_male: 1
  is_carnivorous: 1
  is_genocidable: 1
  is_gnome: 1
  is_herbivorous: 1
  is_rank_lord: 1
  mr: 4
  name: gnome lord
  rarity: 2
  resist: {}
  size: small
  sound: orc
  speed: 8
  wants_wargear: 1
  weight: 700
gnome mummy:
  ac: 6
  alignment: -3
  always_hostile: 1
  attacks:
    - damage: 1d6
      mode: claw
      type: physical
  color: red
  corpse: {}
  corpse_nutrition: 50
  glyph: M
  has_infravision: 1
  hitdice: 4
  humanoid_body: 1
  is_breathless: 1
  is_genocidable: 1
  is_gnome: 1
  is_mindless: 1
  is_undead: 1
  mr: 20
  name: gnome mummy
  never_drops_corpse: 1
  poisonous_corpse: 1
  rarity: 1
  resist:
    cold: 1
    poison: 1
    sleep: 1
  size: small
  sound: silent
  speed: 10
  weight: 650
gnome zombie:
  ac: 10
  alignment: -2
  always_hostile: 1
  attacks:
    - damage: 1d5
      mode: claw
      type: physical
  color: brown
  corpse: {}
  corpse_nutrition: 50
  follows_stair_users: 1
  glyph: Z
  has_infravision: 1
  hitdice: 1
  humanoid_body: 1
  is_breathless: 1
  is_genocidable: 1
  is_gnome: 1
  is_mindless: 1
  is_undead: 1
  mr: 0
  name: gnome zombie
  never_drops_corpse: 1
  poisonous_corpse: 1
  rarity: 1
  resist:
    cold: 1
    poison: 1
    sleep: 1
  size: small
  sound: silent
  speed: 6
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
  corpse_nutrition: 120
  glyph: G
  has_infravision: 1
  hitdice: 3
  humanoid_body: 1
  infravision_detectable: 1
  is_carnivorous: 1
  is_genocidable: 1
  is_gnome: 1
  is_herbivorous: 1
  mr: 10
  name: gnomish wizard
  rarity: 1
  resist: {}
  size: small
  sound: orc
  speed: 10
  wants_magic_items: 1
  weight: 700
goblin:
  ac: 10
  alignment: -3
  attacks:
    - damage: 1d4
      mode: weapon
      type: physical
  color: gray
  corpse: {}
  corpse_nutrition: 100
  glyph: o
  has_infravision: 1
  hitdice: 0
  humanoid_body: 1
  infravision_detectable: 1
  is_carnivorous: 1
  is_genocidable: 1
  is_herbivorous: 1
  is_orc: 1
  mr: 0
  name: goblin
  rarity: 2
  resist: {}
  size: small
  sound: orc
  speed: 6
  wants_wargear: 1
  weight: 400
gold golem:
  ac: 6
  alignment: 0
  always_hostile: 1
  attacks:
    - damage: 2d3
      mode: claw
      type: physical
    - damage: 2d3
      mode: claw
      type: physical
  color: yellow
  corpse: {}
  glyph: "'"
  has_thick_hide: 1
  hitdice: 5
  humanoid_body: 1
  is_breathless: 1
  is_genderless: 1
  is_mindless: 1
  mr: 0
  name: gold golem
  never_drops_corpse: 1
  nutrition: 0
  rarity: 1
  resist:
    acid: 1
    poison: 1
    sleep: 1
  size: large
  sound: silent
  speed: 9
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
  cannot_pickup_items: 1
  color: yellow
  corpse:
    poison: 1
  corpse_nutrition: 400
  glyph: N
  has_thick_hide: 1
  hitdice: 10
  is_carnivorous: 1
  is_genocidable: 1
  is_herbivorous: 1
  is_very_strong: 1
  lacks_limbs: 1
  lays_eggs: 1
  mr: 70
  name: golden naga
  rarity: 1
  resist:
    poison: 1
  serpentine_body: 1
  size: huge
  sound: mumble
  speed: 14
  weight: 2600
golden naga hatchling:
  ac: 6
  alignment: 0
  attacks:
    - damage: 1d4
      mode: bite
      type: physical
  cannot_pickup_items: 1
  color: yellow
  corpse:
    poison: 1
  corpse_nutrition: 100
  glyph: N
  has_thick_hide: 1
  hitdice: 3
  is_carnivorous: 1
  is_genocidable: 1
  is_herbivorous: 1
  is_very_strong: 1
  lacks_limbs: 1
  mr: 0
  name: golden naga hatchling
  resist:
    poison: 1
  serpentine_body: 1
  size: large
  sound: mumble
  speed: 10
  weight: 500
gray dragon:
  ac: -1
  alignment: 4
  always_hostile: 1
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
  can_fly: 1
  color: gray
  corpse: {}
  corpse_nutrition: 1500
  extra_nasty: 1
  glyph: D
  has_thick_hide: 1
  hitdice: 15
  is_carnivorous: 1
  is_genocidable: 1
  is_very_strong: 1
  lacks_hands: 1
  lays_eggs: 1
  mr: 20
  name: gray dragon
  rarity: 1
  resist: {}
  sees_invisible: 1
  size: gigantic
  sound: roar
  speed: 9
  wants_gems: 1
  wants_gold: 1
  wants_magic_items: 1
  weight: 4500
gray ooze:
  ac: 8
  acidic_corpse: 1
  alignment: 0
  always_hostile: 1
  attacks:
    - damage: 2d8
      mode: bite
      type: rust
  color: gray
  corpse:
    cold: 1
    fire: 1
    poison: 1
  corpse_nutrition: 250
  glyph: P
  hitdice: 3
  is_amorphous: 1
  is_breathless: 1
  is_carnivorous: 1
  is_genderless: 1
  is_genocidable: 1
  is_herbivorous: 1
  is_mindless: 1
  lacks_eyes: 1
  lacks_head: 1
  lacks_limbs: 1
  mr: 0
  name: gray ooze
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
  corpse_nutrition: 300
  glyph: u
  hitdice: 4
  infravision_detectable: 1
  is_genocidable: 1
  is_herbivorous: 1
  is_very_strong: 1
  is_wanderer: 1
  lacks_hands: 1
  mr: 70
  name: gray unicorn
  rarity: 1
  resist:
    poison: 1
  size: large
  sound: neigh
  speed: 24
  wants_gems: 1
  weight: 1300
green dragon:
  ac: -1
  alignment: 6
  always_hostile: 1
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
  can_fly: 1
  color: green
  corpse:
    poison: 1
  corpse_nutrition: 1500
  extra_nasty: 1
  glyph: D
  has_thick_hide: 1
  hitdice: 15
  is_carnivorous: 1
  is_genocidable: 1
  is_very_strong: 1
  lacks_hands: 1
  lays_eggs: 1
  mr: 20
  name: green dragon
  poisonous_corpse: 1
  rarity: 1
  resist:
    poison: 1
  sees_invisible: 1
  size: gigantic
  sound: roar
  speed: 9
  wants_gems: 1
  wants_gold: 1
  wants_magic_items: 1
  weight: 4500
green mold:
  ac: 9
  acidic_corpse: 1
  alignment: 0
  always_hostile: 1
  attacks:
    - damage: 0d4
      mode: passive
      type: acid
  cannot_pickup_items: 1
  color: green
  corpse:
    stone: 1
  corpse_nutrition: 30
  glyph: F
  hitdice: 1
  is_breathless: 1
  is_genderless: 1
  is_genocidable: 1
  is_mindless: 1
  lacks_eyes: 1
  lacks_head: 1
  lacks_limbs: 1
  mr: 0
  name: green mold
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
  acidic_corpse: 1
  alignment: 0
  always_hostile: 1
  attacks:
    - damage: 1d4
      mode: touch
      type: slime
    - damage: 0d0
      mode: passive
      type: slime
  color: green
  corpse: {}
  corpse_nutrition: 150
  gehennom_exclusive: 1
  glyph: P
  hitdice: 6
  is_amorphous: 1
  is_breathless: 1
  is_carnivorous: 1
  is_genderless: 1
  is_genocidable: 1
  is_herbivorous: 1
  is_mindless: 1
  lacks_eyes: 1
  lacks_head: 1
  lacks_limbs: 1
  mr: 0
  name: green slime
  poisonous_corpse: 1
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
  can_swim: 1
  color: green
  corpse:
    poison: 1
  corpse_nutrition: 20
  follows_stair_users: 1
  glyph: g
  hitdice: 5
  humanoid_body: 1
  infravision_detectable: 1
  is_genocidable: 1
  mr: 25
  name: gremlin
  poisonous_corpse: 1
  rarity: 2
  resist:
    poison: 1
  size: small
  sound: laugh
  speed: 12
  weight: 100
grid bug:
  ac: 9
  alignment: 0
  always_hostile: 1
  attacks:
    - damage: 1d1
      mode: bite
      type: electricity
  color: magenta
  corpse: {}
  corpse_nutrition: 10
  glyph: x
  hitdice: 0
  infravision_detectable: 1
  is_animal: 1
  is_genocidable: 1
  mr: 0
  name: grid bug
  never_drops_corpse: 1
  rarity: 3
  resist:
    elec: 1
    poison: 1
  size: tiny
  small_group: 1
  sound: buzz
  speed: 12
  weight: 15
guard:
  ac: 10
  alignment: 10
  always_peaceful: 1
  attacks:
    - damage: 4d10
      mode: weapon
      type: physical
  color: blue
  corpse: {}
  corpse_nutrition: 400
  glyph: '@'
  hitdice: 12
  humanoid_body: 1
  infravision_detectable: 1
  invalid_polymorph_target: 1
  is_carnivorous: 1
  is_herbivorous: 1
  is_human: 1
  is_mercenary: 1
  is_very_strong: 1
  mr: 40
  name: guard
  not_randomly_generated: 1
  resist: {}
  size: human
  sound: guard
  speed: 12
  wants_wargear: 1
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
  cannot_pickup_items: 1
  color: green
  corpse:
    poison: 1
  corpse_nutrition: 400
  glyph: N
  has_thick_hide: 1
  hitdice: 12
  is_carnivorous: 1
  is_genocidable: 1
  is_herbivorous: 1
  is_very_strong: 1
  lacks_limbs: 1
  lays_eggs: 1
  mr: 50
  name: guardian naga
  poisonous_corpse: 1
  rarity: 1
  resist:
    poison: 1
  serpentine_body: 1
  size: huge
  sound: mumble
  speed: 16
  weight: 2600
guardian naga hatchling:
  ac: 6
  alignment: 0
  attacks:
    - damage: 1d4
      mode: bite
      type: physical
  cannot_pickup_items: 1
  color: green
  corpse:
    poison: 1
  corpse_nutrition: 100
  glyph: N
  has_thick_hide: 1
  hitdice: 3
  is_carnivorous: 1
  is_genocidable: 1
  is_herbivorous: 1
  is_very_strong: 1
  lacks_limbs: 1
  mr: 0
  name: guardian naga hatchling
  resist:
    poison: 1
  serpentine_body: 1
  size: large
  sound: mumble
  speed: 10
  weight: 500
guide:
  ac: 10
  alignment: 0
  always_peaceful: 1
  attacks:
    - damage: 1d6
      mode: weapon
      type: physical
    - damage: 0d0
      mode: magic
      type: wizardspell
  color: white
  corpse: {}
  corpse_nutrition: 400
  glyph: '@'
  hitdice: 5
  humanoid_body: 1
  infravision_detectable: 1
  invalid_polymorph_target: 1
  is_carnivorous: 1
  is_herbivorous: 1
  is_human: 1
  is_very_strong: 1
  mr: 20
  name: guide
  not_randomly_generated: 1
  resist: {}
  size: human
  sound: guardian
  speed: 12
  wants_magic_items: 1
  wants_wargear: 1
  weight: 1450
healer:
  ac: 10
  alignment: 0
  attacks:
    - damage: 1d6
      mode: weapon
      type: physical
  color: white
  corpse: {}
  corpse_nutrition: 400
  glyph: '@'
  hitdice: 10
  humanoid_body: 1
  infravision_detectable: 1
  invalid_polymorph_target: 1
  is_carnivorous: 1
  is_herbivorous: 1
  is_human: 1
  is_very_strong: 1
  mr: 1
  name: healer
  not_randomly_generated: 1
  resist:
    poison: 1
  size: human
  sound: humanoid
  speed: 12
  wants_wargear: 1
  weight: 1450
hell hound:
  ac: 2
  alignment: 0
  always_hostile: 1
  attacks:
    - damage: 3d6
      mode: bite
      type: physical
    - damage: 3d6
      mode: breathe
      type: fire
  color: red
  corpse:
    fire: 1
  corpse_nutrition: 300
  gehennom_exclusive: 1
  glyph: d
  hitdice: 12
  infravision_detectable: 1
  is_animal: 1
  is_carnivorous: 1
  is_genocidable: 1
  is_very_strong: 1
  lacks_hands: 1
  mr: 20
  name: hell hound
  rarity: 1
  resist:
    fire: 1
  size: medium
  sound: bark
  speed: 14
  weight: 600
hell hound pup:
  ac: 4
  alignment: -5
  always_hostile: 1
  attacks:
    - damage: 2d6
      mode: bite
      type: physical
    - damage: 2d6
      mode: breathe
      type: fire
  color: red
  corpse:
    fire: 1
  corpse_nutrition: 200
  gehennom_exclusive: 1
  glyph: d
  hitdice: 7
  infravision_detectable: 1
  is_animal: 1
  is_carnivorous: 1
  is_genocidable: 1
  lacks_hands: 1
  mr: 20
  name: hell hound pup
  rarity: 1
  resist:
    fire: 1
  size: small
  small_group: 1
  sound: bark
  speed: 12
  weight: 200
hezrou:
  ac: -2
  alignment: -10
  always_hostile: 1
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
  corpse_nutrition: 400
  extra_nasty: 1
  follows_stair_users: 1
  gehennom_exclusive: 1
  glyph: '&'
  has_infravision: 1
  hitdice: 9
  humanoid_body: 1
  infravision_detectable: 1
  is_demon: 1
  mr: 55
  name: hezrou
  never_drops_corpse: 1
  poisonous_corpse: 1
  rarity: 2
  resist:
    fire: 1
    poison: 1
  size: large
  small_group: 1
  sound: silent
  speed: 6
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
  color: white
  corpse: {}
  corpse_nutrition: 400
  extra_nasty: 1
  glyph: '@'
  hitdice: 25
  humanoid_body: 1
  infravision_detectable: 1
  invalid_polymorph_target: 1
  is_carnivorous: 1
  is_herbivorous: 1
  is_human: 1
  is_minion: 1
  is_rank_prince: 1
  is_unique: 1
  mr: 70
  name: high priest
  not_randomly_generated: 1
  resist:
    elec: 1
    fire: 1
    poison: 1
    sleep: 1
  sees_invisible: 1
  size: human
  sound: priest
  speed: 15
  wants_magic_items: 1
  wants_wargear: 1
  weight: 1450
hill giant:
  ac: 6
  alignment: -2
  attacks:
    - damage: 2d8
      mode: weapon
      type: physical
  color: cyan
  corpse: {}
  corpse_nutrition: 700
  extra_nasty: 1
  glyph: H
  has_infravision: 1
  hitdice: 8
  humanoid_body: 1
  infravision_detectable: 1
  is_carnivorous: 1
  is_genocidable: 1
  is_giant: 1
  is_very_strong: 1
  mr: 0
  name: hill giant
  rarity: 1
  resist: {}
  size: huge
  small_group: 1
  sound: boast
  speed: 10
  throws_boulders: 1
  wants_gems: 1
  wants_wargear: 1
  weight: 2200
hill orc:
  ac: 10
  alignment: -4
  attacks:
    - damage: 1d6
      mode: weapon
      type: physical
  color: yellow
  corpse: {}
  corpse_nutrition: 200
  glyph: o
  has_infravision: 1
  hitdice: 2
  humanoid_body: 1
  infravision_detectable: 1
  is_carnivorous: 1
  is_genocidable: 1
  is_herbivorous: 1
  is_orc: 1
  is_very_strong: 1
  large_group: 1
  mr: 0
  name: hill orc
  rarity: 2
  resist: {}
  size: human
  sound: orc
  speed: 9
  wants_gems: 1
  wants_gold: 1
  wants_wargear: 1
  weight: 1000
hobbit:
  ac: 10
  alignment: 6
  attacks:
    - damage: 1d6
      mode: weapon
      type: physical
  color: green
  corpse: {}
  corpse_nutrition: 200
  glyph: h
  has_infravision: 1
  hitdice: 1
  humanoid_body: 1
  infravision_detectable: 1
  is_carnivorous: 1
  is_genocidable: 1
  is_herbivorous: 1
  mr: 0
  name: hobbit
  rarity: 2
  resist: {}
  size: small
  sound: humanoid
  speed: 9
  wants_wargear: 1
  weight: 500
hobgoblin:
  ac: 10
  alignment: -4
  attacks:
    - damage: 1d6
      mode: weapon
      type: physical
  color: brown
  corpse: {}
  corpse_nutrition: 200
  glyph: o
  has_infravision: 1
  hitdice: 1
  humanoid_body: 1
  infravision_detectable: 1
  is_carnivorous: 1
  is_genocidable: 1
  is_herbivorous: 1
  is_orc: 1
  is_very_strong: 1
  mr: 0
  name: hobgoblin
  rarity: 2
  resist: {}
  size: human
  sound: orc
  speed: 9
  wants_wargear: 1
  weight: 1000
homunculus:
  ac: 6
  alignment: -7
  attacks:
    - damage: 1d3
      mode: bite
      type: sleep
  can_fly: 1
  color: green
  corpse:
    poison: 1
    sleep: 1
  corpse_nutrition: 100
  follows_stair_users: 1
  glyph: i
  has_infravision: 1
  hitdice: 2
  infravision_detectable: 1
  is_genocidable: 1
  mr: 10
  name: homunculus
  poisonous_corpse: 1
  rarity: 2
  resist:
    poison: 1
    sleep: 1
  size: tiny
  sound: silent
  speed: 12
  weight: 60
horned devil:
  ac: -5
  alignment: 11
  always_hostile: 1
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
  corpse_nutrition: 400
  extra_nasty: 1
  follows_stair_users: 1
  gehennom_exclusive: 1
  glyph: '&'
  has_infravision: 1
  has_thick_hide: 1
  hitdice: 6
  infravision_detectable: 1
  is_demon: 1
  mr: 50
  name: horned devil
  never_drops_corpse: 1
  poisonous_corpse: 1
  rarity: 2
  resist:
    fire: 1
    poison: 1
  size: human
  sound: silent
  speed: 9
  weight: 1450
horse:
  ac: 5
  alignment: 0
  attacks:
    - damage: 1d8
      mode: kick
      type: physical
    - damage: 1d3
      mode: bite
      type: physical
  color: brown
  corpse: {}
  corpse_nutrition: 300
  food_makes_peaceful: 1
  glyph: u
  hitdice: 5
  infravision_detectable: 1
  is_animal: 1
  is_genocidable: 1
  is_herbivorous: 1
  is_very_strong: 1
  is_wanderer: 1
  lacks_hands: 1
  mr: 0
  name: horse
  rarity: 2
  resist: {}
  size: large
  sound: neigh
  speed: 20
  weight: 1500
housecat:
  ac: 5
  alignment: 0
  attacks:
    - damage: 1d6
      mode: bite
      type: physical
  color: white
  corpse: {}
  corpse_nutrition: 200
  food_makes_peaceful: 1
  glyph: f
  hitdice: 4
  infravision_detectable: 1
  is_animal: 1
  is_carnivorous: 1
  is_genocidable: 1
  lacks_hands: 1
  mr: 0
  name: housecat
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
  color: white
  corpse: {}
  corpse_nutrition: 400
  glyph: '@'
  hitdice: 0
  humanoid_body: 1
  infravision_detectable: 1
  invalid_polymorph_target: 1
  is_carnivorous: 1
  is_herbivorous: 1
  is_human: 1
  is_very_strong: 1
  mr: 0
  name: human
  not_randomly_generated: 1
  resist: {}
  size: human
  sound: humanoid
  speed: 12
  wants_wargear: 1
  weight: 1450
human mummy:
  ac: 4
  alignment: -5
  always_hostile: 1
  attacks:
    - damage: 2d4
      mode: claw
      type: physical
    - damage: 2d4
      mode: claw
      type: physical
  color: gray
  corpse: {}
  corpse_nutrition: 200
  glyph: M
  has_infravision: 1
  hitdice: 6
  humanoid_body: 1
  is_breathless: 1
  is_genocidable: 1
  is_mindless: 1
  is_undead: 1
  mr: 30
  name: human mummy
  never_drops_corpse: 1
  poisonous_corpse: 1
  rarity: 1
  resist:
    cold: 1
    poison: 1
    sleep: 1
  size: human
  sound: silent
  speed: 12
  weight: 1450
human zombie:
  ac: 8
  alignment: -3
  always_hostile: 1
  attacks:
    - damage: 1d8
      mode: claw
      type: physical
  color: white
  corpse: {}
  corpse_nutrition: 200
  follows_stair_users: 1
  glyph: Z
  has_infravision: 1
  hitdice: 4
  humanoid_body: 1
  is_breathless: 1
  is_genocidable: 1
  is_mindless: 1
  is_undead: 1
  mr: 0
  name: human zombie
  never_drops_corpse: 1
  rarity: 1
  resist:
    cold: 1
    poison: 1
    sleep: 1
  size: human
  small_group: 1
  sound: silent
  speed: 6
  weight: 1450
hunter:
  ac: 10
  alignment: -7
  always_peaceful: 1
  attacks:
    - damage: 1d4
      mode: weapon
      type: physical
  color: white
  corpse: {}
  corpse_nutrition: 400
  glyph: '@'
  has_infravision: 1
  hitdice: 5
  humanoid_body: 1
  infravision_detectable: 1
  invalid_polymorph_target: 1
  is_carnivorous: 1
  is_herbivorous: 1
  is_human: 1
  is_very_strong: 1
  mr: 10
  name: hunter
  not_randomly_generated: 1
  resist: {}
  sees_invisible: 1
  size: human
  sound: guardian
  speed: 12
  wants_wargear: 1
  weight: 1450
ice devil:
  ac: -4
  alignment: -12
  always_hostile: 1
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
  corpse_nutrition: 400
  extra_nasty: 1
  follows_stair_users: 1
  gehennom_exclusive: 1
  glyph: '&'
  has_infravision: 1
  hitdice: 11
  infravision_detectable: 1
  is_demon: 1
  mr: 55
  name: ice devil
  never_drops_corpse: 1
  poisonous_corpse: 1
  rarity: 2
  resist:
    cold: 1
    fire: 1
    poison: 1
  sees_invisible: 1
  size: large
  sound: silent
  speed: 6
  weight: 1450
ice troll:
  absent_from_gehennom: 1
  ac: 2
  alignment: -3
  always_hostile: 1
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
  color: white
  corpse:
    cold: 1
  corpse_nutrition: 300
  follows_stair_users: 1
  glyph: T
  has_infravision: 1
  hitdice: 9
  humanoid_body: 1
  infravision_detectable: 1
  is_carnivorous: 1
  is_genocidable: 1
  is_very_strong: 1
  mr: 20
  name: ice troll
  rarity: 1
  regenerates_quickly: 1
  resist:
    cold: 1
  size: large
  sound: grunt
  speed: 10
  weight: 1000
ice vortex:
  absent_from_gehennom: 1
  ac: 2
  alignment: 0
  always_hostile: 1
  attacks:
    - damage: 1d6
      mode: engulf
      type: cold
  can_fly: 1
  color: cyan
  corpse: {}
  glyph: v
  hitdice: 5
  infravision_detectable: 1
  is_breathless: 1
  is_genderless: 1
  is_genocidable: 1
  is_mindless: 1
  lacks_eyes: 1
  lacks_head: 1
  lacks_limbs: 1
  mr: 30
  name: ice vortex
  never_drops_corpse: 1
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
  always_hostile: 1
  attacks:
    - damage: 1d4
      mode: bite
      type: physical
  color: brown
  corpse: {}
  corpse_nutrition: 30
  glyph: ':'
  hitdice: 2
  is_animal: 1
  is_carnivorous: 1
  is_genocidable: 1
  lacks_hands: 1
  mr: 0
  name: iguana
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
  corpse_nutrition: 10
  follows_stair_users: 1
  glyph: i
  has_infravision: 1
  hitdice: 3
  infravision_detectable: 1
  is_genocidable: 1
  is_wanderer: 1
  mr: 20
  name: imp
  rarity: 1
  regenerates_quickly: 1
  resist: {}
  size: tiny
  sound: cuss
  speed: 12
  weight: 20
incubus:
  ac: 0
  alignment: -9
  always_hostile: 1
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
  can_fly: 1
  color: gray
  corpse: {}
  corpse_nutrition: 400
  extra_nasty: 1
  follows_stair_users: 1
  glyph: '&'
  has_infravision: 1
  hitdice: 6
  humanoid_body: 1
  infravision_detectable: 1
  is_always_male: 1
  is_demon: 1
  mr: 70
  name: incubus
  never_drops_corpse: 1
  poisonous_corpse: 1
  rarity: 1
  resist:
    fire: 1
    poison: 1
  size: human
  sound: seduce
  speed: 12
  weight: 1450
iron golem:
  ac: 3
  alignment: 0
  always_hostile: 1
  attacks:
    - damage: 4d10
      mode: weapon
      type: physical
    - damage: 4d6
      mode: breathe
      type: poison
  color: cyan
  corpse: {}
  glyph: "'"
  has_thick_hide: 1
  hitdice: 18
  humanoid_body: 1
  is_breathless: 1
  is_mindless: 1
  is_very_strong: 1
  mr: 60
  name: iron golem
  never_drops_corpse: 1
  nutrition: 0
  poisonous_corpse: 1
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
  wants_wargear: 1
  weight: 2000
iron piercer:
  ac: 0
  alignment: 0
  always_hostile: 1
  attacks:
    - damage: 3d6
      mode: bite
      type: physical
  cannot_pickup_items: 1
  clings_to_ceiling: 1
  color: cyan
  corpse: {}
  corpse_nutrition: 300
  glyph: p
  hides_on_ceiling: 1
  hitdice: 5
  is_animal: 1
  is_carnivorous: 1
  is_genocidable: 1
  lacks_eyes: 1
  lacks_limbs: 1
  mr: 0
  name: iron piercer
  rarity: 2
  resist: {}
  size: medium
  sound: silent
  speed: 1
  weight: 400
jabberwock:
  ac: -2
  alignment: 0
  always_hostile: 1
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
  can_fly: 1
  color: orange
  corpse: {}
  corpse_nutrition: 600
  extra_nasty: 1
  glyph: J
  hitdice: 15
  infravision_detectable: 1
  is_animal: 1
  is_carnivorous: 1
  is_genocidable: 1
  is_very_strong: 1
  mr: 50
  name: jabberwock
  rarity: 1
  resist: {}
  size: large
  sound: burble
  speed: 12
  wants_wargear: 1
  weight: 1300
jackal:
  ac: 7
  alignment: 0
  always_hostile: 1
  attacks:
    - damage: 1d2
      mode: bite
      type: physical
  color: brown
  corpse: {}
  corpse_nutrition: 250
  glyph: d
  hitdice: 0
  infravision_detectable: 1
  is_animal: 1
  is_carnivorous: 1
  is_genocidable: 1
  lacks_hands: 1
  mr: 0
  name: jackal
  rarity: 3
  resist: {}
  size: small
  small_group: 1
  sound: bark
  speed: 12
  weight: 300
jaguar:
  ac: 6
  alignment: 0
  always_hostile: 1
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
  color: brown
  corpse: {}
  corpse_nutrition: 300
  glyph: f
  hitdice: 4
  infravision_detectable: 1
  is_animal: 1
  is_carnivorous: 1
  is_genocidable: 1
  lacks_hands: 1
  mr: 0
  name: jaguar
  rarity: 2
  resist: {}
  size: large
  sound: growl
  speed: 15
  weight: 600
jellyfish:
  ac: 6
  alignment: 0
  always_hostile: 1
  attacks:
    - damage: 3d3
      mode: sting
      type: poison
  can_swim: 1
  cannot_pickup_items: 1
  color: blue
  corpse:
    poison: 1
  corpse_nutrition: 20
  glyph: ;
  hitdice: 3
  is_amphibious: 1
  is_genocidable: 1
  lacks_limbs: 1
  mr: 0
  name: jellyfish
  not_randomly_generated: 1
  poisonous_corpse: 1
  resist:
    poison: 1
  serpentine_body: 1
  size: small
  sound: silent
  speed: 3
  weight: 80
ki-rin:
  absent_from_gehennom: 1
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
  can_fly: 1
  color: yellow
  corpse: {}
  corpse_nutrition: 400
  extra_nasty: 1
  follows_stair_users: 1
  glyph: A
  has_infravision: 1
  hitdice: 16
  infravision_detectable: 1
  invalid_polymorph_target: 1
  is_minion: 1
  is_rank_lord: 1
  is_very_strong: 1
  mr: 90
  name: ki-rin
  never_drops_corpse: 1
  rarity: 1
  resist: {}
  sees_invisible: 1
  size: large
  sound: neigh
  speed: 18
  weight: 1450
killer bee:
  ac: -1
  alignment: 0
  always_hostile: 1
  attacks:
    - damage: 1d3
      mode: sting
      type: poison
  can_fly: 1
  color: yellow
  corpse:
    poison: 1
  corpse_nutrition: 5
  glyph: a
  hitdice: 1
  is_always_female: 1
  is_animal: 1
  is_genocidable: 1
  lacks_hands: 1
  large_group: 1
  mr: 0
  name: killer bee
  poisonous_corpse: 1
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
  attacks:
    - damage: 1d6
      mode: bite
      type: physical
  color: white
  corpse: {}
  corpse_nutrition: 150
  food_makes_peaceful: 1
  glyph: f
  hitdice: 2
  infravision_detectable: 1
  is_animal: 1
  is_carnivorous: 1
  is_genocidable: 1
  is_wanderer: 1
  lacks_hands: 1
  mr: 0
  name: kitten
  rarity: 1
  resist: {}
  size: small
  sound: mew
  speed: 18
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
  color: white
  corpse: {}
  corpse_nutrition: 400
  glyph: '@'
  hitdice: 10
  humanoid_body: 1
  infravision_detectable: 1
  invalid_polymorph_target: 1
  is_carnivorous: 1
  is_herbivorous: 1
  is_human: 1
  is_very_strong: 1
  mr: 1
  name: knight
  not_randomly_generated: 1
  resist: {}
  size: human
  sound: humanoid
  speed: 12
  wants_wargear: 1
  weight: 1450
kobold:
  ac: 10
  alignment: -2
  always_hostile: 1
  attacks:
    - damage: 1d4
      mode: weapon
      type: physical
  color: brown
  corpse: {}
  corpse_nutrition: 100
  glyph: k
  has_infravision: 1
  hitdice: 0
  humanoid_body: 1
  infravision_detectable: 1
  is_carnivorous: 1
  is_genocidable: 1
  is_herbivorous: 1
  mr: 0
  name: kobold
  poisonous_corpse: 1
  rarity: 1
  resist:
    poison: 1
  size: small
  sound: orc
  speed: 6
  wants_wargear: 1
  weight: 400
kobold lord:
  ac: 10
  alignment: -4
  always_hostile: 1
  attacks:
    - damage: 2d4
      mode: weapon
      type: physical
  color: magenta
  corpse: {}
  corpse_nutrition: 200
  glyph: k
  has_infravision: 1
  hitdice: 2
  humanoid_body: 1
  infravision_detectable: 1
  is_always_male: 1
  is_carnivorous: 1
  is_genocidable: 1
  is_herbivorous: 1
  is_rank_lord: 1
  mr: 0
  name: kobold lord
  poisonous_corpse: 1
  rarity: 1
  resist:
    poison: 1
  size: small
  sound: orc
  speed: 6
  wants_wargear: 1
  weight: 500
kobold mummy:
  ac: 6
  alignment: -2
  always_hostile: 1
  attacks:
    - damage: 1d4
      mode: claw
      type: physical
  color: brown
  corpse: {}
  corpse_nutrition: 50
  glyph: M
  has_infravision: 1
  hitdice: 3
  humanoid_body: 1
  is_breathless: 1
  is_genocidable: 1
  is_mindless: 1
  is_undead: 1
  mr: 20
  name: kobold mummy
  never_drops_corpse: 1
  poisonous_corpse: 1
  rarity: 1
  resist:
    cold: 1
    poison: 1
    sleep: 1
  size: small
  sound: silent
  speed: 8
  weight: 400
kobold shaman:
  ac: 6
  alignment: -4
  always_hostile: 1
  attacks:
    - damage: 0d0
      mode: magic
      type: wizardspell
  color: bright_blue
  corpse: {}
  corpse_nutrition: 150
  glyph: k
  has_infravision: 1
  hitdice: 2
  humanoid_body: 1
  infravision_detectable: 1
  is_carnivorous: 1
  is_genocidable: 1
  is_herbivorous: 1
  mr: 10
  name: kobold shaman
  poisonous_corpse: 1
  rarity: 1
  resist:
    poison: 1
  size: small
  sound: orc
  speed: 6
  wants_magic_items: 1
  weight: 450
kobold zombie:
  ac: 10
  alignment: -2
  always_hostile: 1
  attacks:
    - damage: 1d4
      mode: claw
      type: physical
  color: brown
  corpse: {}
  corpse_nutrition: 50
  follows_stair_users: 1
  glyph: Z
  has_infravision: 1
  hitdice: 0
  humanoid_body: 1
  is_breathless: 1
  is_genocidable: 1
  is_mindless: 1
  is_undead: 1
  mr: 0
  name: kobold zombie
  never_drops_corpse: 1
  poisonous_corpse: 1
  rarity: 1
  resist:
    cold: 1
    poison: 1
    sleep: 1
  size: small
  sound: silent
  speed: 6
  weight: 400
kraken:
  ac: 6
  alignment: -3
  always_hostile: 1
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
  can_swim: 1
  color: red
  corpse: {}
  corpse_nutrition: 1000
  glyph: ;
  hitdice: 20
  infravision_detectable: 1
  invalid_polymorph_target: 1
  is_amphibious: 1
  is_animal: 1
  is_carnivorous: 1
  is_genocidable: 1
  is_very_strong: 1
  lacks_hands: 1
  mr: 0
  name: kraken
  not_randomly_generated: 1
  resist: {}
  size: huge
  sound: silent
  speed: 3
  weight: 1800
large cat:
  ac: 4
  alignment: 0
  attacks:
    - damage: 2d4
      mode: bite
      type: physical
  color: white
  corpse: {}
  corpse_nutrition: 250
  food_makes_peaceful: 1
  glyph: f
  hitdice: 6
  infravision_detectable: 1
  is_animal: 1
  is_carnivorous: 1
  is_genocidable: 1
  is_very_strong: 1
  lacks_hands: 1
  mr: 0
  name: large cat
  rarity: 1
  resist: {}
  size: small
  sound: mew
  speed: 15
  weight: 250
large dog:
  ac: 4
  alignment: 0
  attacks:
    - damage: 2d4
      mode: bite
      type: physical
  color: white
  corpse: {}
  corpse_nutrition: 250
  food_makes_peaceful: 1
  glyph: d
  hitdice: 6
  infravision_detectable: 1
  is_animal: 1
  is_carnivorous: 1
  is_genocidable: 1
  is_very_strong: 1
  lacks_hands: 1
  mr: 0
  name: large dog
  rarity: 1
  resist: {}
  size: medium
  sound: bark
  speed: 15
  weight: 800
large kobold:
  ac: 10
  alignment: -3
  always_hostile: 1
  attacks:
    - damage: 1d6
      mode: weapon
      type: physical
  color: red
  corpse: {}
  corpse_nutrition: 150
  glyph: k
  has_infravision: 1
  hitdice: 1
  humanoid_body: 1
  infravision_detectable: 1
  is_carnivorous: 1
  is_genocidable: 1
  is_herbivorous: 1
  mr: 0
  name: large kobold
  poisonous_corpse: 1
  rarity: 1
  resist:
    poison: 1
  size: small
  sound: orc
  speed: 6
  wants_wargear: 1
  weight: 450
large mimic:
  ac: 7
  alignment: 0
  always_hostile: 1
  attacks:
    - damage: 3d4
      mode: claw
      type: stick
  clings_to_ceiling: 1
  color: red
  corpse: {}
  corpse_nutrition: 400
  glyph: m
  has_thick_hide: 1
  hides_on_ceiling: 1
  hitdice: 8
  is_amorphous: 1
  is_animal: 1
  is_breathless: 1
  is_carnivorous: 1
  is_genocidable: 1
  is_very_strong: 1
  lacks_eyes: 1
  lacks_head: 1
  lacks_limbs: 1
  mr: 10
  name: large mimic
  rarity: 1
  resist:
    acid: 1
  size: large
  sound: silent
  speed: 3
  weight: 600
leather golem:
  ac: 6
  alignment: 0
  always_hostile: 1
  attacks:
    - damage: 1d6
      mode: claw
      type: physical
    - damage: 1d6
      mode: claw
      type: physical
  color: brown
  corpse: {}
  glyph: "'"
  hitdice: 6
  humanoid_body: 1
  is_breathless: 1
  is_genderless: 1
  is_mindless: 1
  mr: 0
  name: leather golem
  never_drops_corpse: 1
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
  always_hostile: 1
  attacks:
    - damage: 1d3
      mode: claw
      type: physical
  color: brown
  corpse:
    sleep: 1
  corpse_nutrition: 100
  follows_stair_users: 1
  gehennom_exclusive: 1
  glyph: i
  has_infravision: 1
  hitdice: 3
  infravision_detectable: 1
  is_genderless: 1
  is_genocidable: 1
  is_wanderer: 1
  large_group: 1
  mr: 0
  name: lemure
  never_drops_corpse: 1
  poisonous_corpse: 1
  rarity: 1
  regenerates_quickly: 1
  resist:
    poison: 1
    sleep: 1
  size: medium
  sound: silent
  speed: 3
  weight: 150
leocrotta:
  ac: 4
  alignment: 0
  always_hostile: 1
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
  corpse_nutrition: 500
  glyph: q
  hitdice: 6
  infravision_detectable: 1
  is_animal: 1
  is_carnivorous: 1
  is_genocidable: 1
  is_herbivorous: 1
  is_very_strong: 1
  lacks_hands: 1
  mr: 10
  name: leocrotta
  rarity: 2
  resist: {}
  size: large
  sound: imitate
  speed: 18
  weight: 1200
leprechaun:
  ac: 8
  alignment: 0
  always_hostile: 1
  attacks:
    - damage: 1d2
      mode: claw
      type: stealgold
  color: green
  corpse: {}
  corpse_nutrition: 30
  glyph: l
  has_teleportitis: 1
  hitdice: 5
  humanoid_body: 1
  infravision_detectable: 1
  is_genocidable: 1
  mr: 20
  name: leprechaun
  rarity: 4
  resist: {}
  size: tiny
  sound: laugh
  speed: 15
  wants_gold: 1
  weight: 60
lich:
  ac: 0
  alignment: -9
  always_hostile: 1
  attacks:
    - damage: 1d10
      mode: touch
      type: cold
    - damage: 0d0
      mode: magic
      type: wizardspell
  color: brown
  corpse:
    cold: 1
  corpse_nutrition: 100
  glyph: L
  has_infravision: 1
  hitdice: 11
  humanoid_body: 1
  is_breathless: 1
  is_genocidable: 1
  is_undead: 1
  mr: 30
  name: lich
  never_drops_corpse: 1
  poisonous_corpse: 1
  rarity: 1
  regenerates_quickly: 1
  resist:
    cold: 1
    poison: 1
    sleep: 1
  size: human
  sound: mumble
  speed: 6
  wants_magic_items: 1
  weight: 1200
lichen:
  ac: 9
  alignment: 0
  always_hostile: 1
  attacks:
    - damage: 0d0
      mode: touch
      type: stick
  cannot_pickup_items: 1
  color: bright_green
  corpse: {}
  corpse_nutrition: 200
  glyph: F
  hitdice: 0
  is_breathless: 1
  is_genderless: 1
  is_genocidable: 1
  is_mindless: 1
  lacks_eyes: 1
  lacks_head: 1
  lacks_limbs: 1
  mr: 0
  name: lichen
  rarity: 4
  resist: {}
  size: small
  sound: silent
  speed: 1
  weight: 20
lieutenant:
  ac: 10
  alignment: -4
  always_hostile: 1
  attacks:
    - damage: 3d4
      mode: weapon
      type: physical
    - damage: 3d4
      mode: weapon
      type: physical
  color: green
  corpse: {}
  corpse_nutrition: 400
  follows_stair_users: 1
  glyph: '@'
  hitdice: 10
  humanoid_body: 1
  infravision_detectable: 1
  invalid_polymorph_target: 1
  is_carnivorous: 1
  is_genocidable: 1
  is_herbivorous: 1
  is_human: 1
  is_mercenary: 1
  is_very_strong: 1
  mr: 15
  name: lieutenant
  rarity: 1
  resist: {}
  size: human
  sound: soldier
  speed: 10
  wants_wargear: 1
  weight: 1450
little dog:
  ac: 6
  alignment: 0
  attacks:
    - damage: 1d6
      mode: bite
      type: physical
  color: white
  corpse: {}
  corpse_nutrition: 150
  food_makes_peaceful: 1
  glyph: d
  hitdice: 2
  infravision_detectable: 1
  is_animal: 1
  is_carnivorous: 1
  is_genocidable: 1
  lacks_hands: 1
  mr: 0
  name: little dog
  rarity: 1
  resist: {}
  size: small
  sound: bark
  speed: 18
  weight: 150
lizard:
  ac: 6
  alignment: 0
  always_hostile: 1
  attacks:
    - damage: 1d6
      mode: bite
      type: physical
  color: green
  corpse:
    stone: 1
  corpse_nutrition: 40
  glyph: ':'
  hitdice: 5
  is_animal: 1
  is_carnivorous: 1
  is_genocidable: 1
  lacks_hands: 1
  mr: 10
  name: lizard
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
  always_hostile: 1
  attacks:
    - damage: 1d4
      mode: bite
      type: physical
  cannot_pickup_items: 1
  color: brown
  corpse: {}
  corpse_nutrition: 500
  extra_nasty: 1
  glyph: w
  hitdice: 8
  is_animal: 1
  is_carnivorous: 1
  is_genocidable: 1
  is_very_strong: 1
  lacks_limbs: 1
  lays_eggs: 1
  mr: 10
  name: long worm
  rarity: 2
  resist: {}
  serpentine_body: 1
  size: gigantic
  sound: silent
  speed: 3
  weight: 1500
lurker above:
  ac: 3
  alignment: 0
  always_hostile: 1
  attacks:
    - damage: 1d8
      mode: engulf
      type: digest
  can_fly: 1
  color: gray
  corpse: {}
  corpse_nutrition: 350
  follows_stair_users: 1
  glyph: t
  hides_on_ceiling: 1
  hitdice: 10
  is_animal: 1
  is_carnivorous: 1
  is_genocidable: 1
  is_very_strong: 1
  lacks_eyes: 1
  lacks_head: 1
  lacks_limbs: 1
  mr: 0
  name: lurker above
  rarity: 2
  resist: {}
  size: huge
  sound: silent
  speed: 3
  weight: 800
lynx:
  ac: 6
  alignment: 0
  always_hostile: 1
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
  color: cyan
  corpse: {}
  corpse_nutrition: 300
  glyph: f
  hitdice: 5
  infravision_detectable: 1
  is_animal: 1
  is_carnivorous: 1
  is_genocidable: 1
  lacks_hands: 1
  mr: 0
  name: lynx
  rarity: 1
  resist: {}
  size: small
  sound: growl
  speed: 15
  weight: 600
mail daemon:
  ac: 10
  alignment: 0
  always_peaceful: 1
  can_fly: 1
  can_swim: 1
  color: bright_blue
  corpse: {}
  corpse_nutrition: 300
  follows_stair_users: 1
  glyph: '&'
  has_infravision: 1
  hitdice: 56
  humanoid_body: 1
  infravision_detectable: 1
  invalid_polymorph_target: 1
  is_breathless: 1
  mr: 127
  name: mail daemon
  never_drops_corpse: 1
  not_randomly_generated: 1
  poisonous_corpse: 1
  resist:
    cold: 1
    elec: 1
    fire: 1
    poison: 1
    sleep: 1
    stone: 1
  sees_invisible: 1
  size: human
  sound: silent
  speed: 24
  weight: 600
manes:
  ac: 7
  alignment: -7
  always_hostile: 1
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
  corpse_nutrition: 100
  follows_stair_users: 1
  glyph: i
  has_infravision: 1
  hitdice: 1
  infravision_detectable: 1
  is_genocidable: 1
  large_group: 1
  mr: 0
  name: manes
  never_drops_corpse: 1
  poisonous_corpse: 1
  rarity: 1
  resist:
    poison: 1
    sleep: 1
  size: small
  sound: silent
  speed: 3
  weight: 100
marilith:
  ac: -6
  alignment: -12
  always_hostile: 1
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
  color: red
  corpse: {}
  corpse_nutrition: 400
  extra_nasty: 1
  follows_stair_users: 1
  gehennom_exclusive: 1
  glyph: '&'
  has_infravision: 1
  hitdice: 7
  humanoid_body: 1
  infravision_detectable: 1
  is_always_female: 1
  is_demon: 1
  mr: 80
  name: marilith
  never_drops_corpse: 1
  poisonous_corpse: 1
  rarity: 1
  resist:
    fire: 1
    poison: 1
  sees_invisible: 1
  serpentine_body: 1
  size: large
  sound: cuss
  speed: 12
  wants_wargear: 1
  weight: 1450
master lich:
  ac: -4
  alignment: -15
  always_hostile: 1
  attacks:
    - damage: 3d6
      mode: touch
      type: cold
    - damage: 0d0
      mode: magic
      type: wizardspell
  color: magenta
  corpse:
    cold: 1
    fire: 1
  corpse_nutrition: 100
  gehennom_exclusive: 1
  glyph: L
  has_infravision: 1
  hitdice: 17
  humanoid_body: 1
  is_breathless: 1
  is_genocidable: 1
  is_undead: 1
  mr: 90
  name: master lich
  never_drops_corpse: 1
  poisonous_corpse: 1
  rarity: 1
  regenerates_quickly: 1
  resist:
    cold: 1
    fire: 1
    poison: 1
    sleep: 1
  size: human
  sound: mumble
  speed: 9
  wants_book: 1
  wants_magic_items: 1
  weight: 1200
master mind flayer:
  ac: 0
  alignment: -8
  always_hostile: 1
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
  can_fly: 1
  color: magenta
  corpse: {}
  corpse_nutrition: 400
  extra_nasty: 1
  glyph: h
  has_infravision: 1
  hitdice: 13
  humanoid_body: 1
  infravision_detectable: 1
  is_carnivorous: 1
  is_genocidable: 1
  is_herbivorous: 1
  mr: 90
  name: master mind flayer
  rarity: 1
  resist: {}
  sees_invisible: 1
  size: human
  sound: hiss
  speed: 12
  wants_gems: 1
  wants_gold: 1
  wants_wargear: 1
  weight: 1450
mastodon:
  ac: 5
  alignment: 0
  always_hostile: 1
  attacks:
    - damage: 4d8
      mode: headbutt
      type: physical
    - damage: 4d8
      mode: headbutt
      type: physical
  color: black
  corpse: {}
  corpse_nutrition: 800
  glyph: q
  has_thick_hide: 1
  hitdice: 20
  infravision_detectable: 1
  is_animal: 1
  is_genocidable: 1
  is_herbivorous: 1
  is_very_strong: 1
  lacks_hands: 1
  mr: 0
  name: mastodon
  rarity: 1
  resist: {}
  size: large
  sound: silent
  speed: 12
  weight: 3800
mind flayer:
  ac: 5
  alignment: -8
  always_hostile: 1
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
  can_fly: 1
  color: magenta
  corpse: {}
  corpse_nutrition: 400
  extra_nasty: 1
  glyph: h
  has_infravision: 1
  hitdice: 9
  humanoid_body: 1
  infravision_detectable: 1
  is_carnivorous: 1
  is_genocidable: 1
  is_herbivorous: 1
  mr: 90
  name: mind flayer
  rarity: 1
  resist: {}
  sees_invisible: 1
  size: human
  sound: hiss
  speed: 12
  wants_gems: 1
  wants_gold: 1
  wants_wargear: 1
  weight: 1450
minotaur:
  ac: 6
  alignment: 0
  always_hostile: 1
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
  color: brown
  corpse: {}
  corpse_nutrition: 700
  extra_nasty: 1
  glyph: H
  has_infravision: 1
  hitdice: 15
  humanoid_body: 1
  infravision_detectable: 1
  is_animal: 1
  is_carnivorous: 1
  is_genocidable: 1
  is_very_strong: 1
  mr: 0
  name: minotaur
  not_randomly_generated: 1
  resist: {}
  size: large
  sound: silent
  speed: 15
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
  color: white
  corpse: {}
  corpse_nutrition: 400
  glyph: '@'
  hitdice: 10
  humanoid_body: 1
  infravision_detectable: 1
  invalid_polymorph_target: 1
  is_always_male: 1
  is_herbivorous: 1
  is_human: 1
  is_very_strong: 1
  mr: 2
  name: monk
  not_randomly_generated: 1
  resist: {}
  size: human
  sound: humanoid
  speed: 12
  wants_wargear: 1
  weight: 1450
monkey:
  ac: 6
  alignment: 0
  attacks:
    - damage: 0d0
      mode: claw
      type: stealitem
    - damage: 1d3
      mode: bite
      type: physical
  color: gray
  corpse: {}
  corpse_nutrition: 50
  glyph: Y
  hitdice: 2
  humanoid_body: 1
  infravision_detectable: 1
  is_animal: 1
  is_carnivorous: 1
  is_genocidable: 1
  mr: 0
  name: monkey
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
  color: cyan
  corpse: {}
  corpse_nutrition: 500
  glyph: C
  hitdice: 6
  humanoid_body: 1
  infravision_detectable: 1
  is_carnivorous: 1
  is_genocidable: 1
  is_herbivorous: 1
  is_very_strong: 1
  mr: 10
  name: mountain centaur
  rarity: 1
  resist: {}
  size: large
  sound: humanoid
  speed: 20
  wants_gold: 1
  wants_wargear: 1
  weight: 2550
mountain nymph:
  ac: 9
  alignment: 0
  always_hostile: 1
  attacks:
    - damage: 0d0
      mode: claw
      type: stealitem
    - damage: 0d0
      mode: claw
      type: seduce
  color: brown
  corpse: {}
  corpse_nutrition: 300
  glyph: n
  has_teleportitis: 1
  hitdice: 3
  humanoid_body: 1
  infravision_detectable: 1
  is_always_female: 1
  is_genocidable: 1
  mr: 20
  name: mountain nymph
  rarity: 2
  resist: {}
  size: human
  sound: seduce
  speed: 12
  wants_wargear: 1
  weight: 600
mumak:
  ac: 0
  alignment: -2
  always_hostile: 1
  attacks:
    - damage: 4d12
      mode: headbutt
      type: physical
    - damage: 2d6
      mode: bite
      type: physical
  color: gray
  corpse: {}
  corpse_nutrition: 500
  glyph: q
  has_thick_hide: 1
  hitdice: 5
  infravision_detectable: 1
  is_animal: 1
  is_genocidable: 1
  is_herbivorous: 1
  is_very_strong: 1
  lacks_hands: 1
  mr: 0
  name: mumak
  rarity: 1
  resist: {}
  size: large
  sound: roar
  speed: 9
  weight: 2500
nalfeshnee:
  ac: -1
  alignment: -11
  always_hostile: 1
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
  corpse_nutrition: 400
  extra_nasty: 1
  follows_stair_users: 1
  gehennom_exclusive: 1
  glyph: '&'
  has_infravision: 1
  hitdice: 11
  humanoid_body: 1
  infravision_detectable: 1
  is_demon: 1
  mr: 65
  name: nalfeshnee
  never_drops_corpse: 1
  poisonous_corpse: 1
  rarity: 1
  resist:
    fire: 1
    poison: 1
  size: large
  sound: spell
  speed: 9
  weight: 1450
neanderthal:
  ac: 10
  alignment: 1
  always_peaceful: 1
  attacks:
    - damage: 2d4
      mode: weapon
      type: physical
  color: white
  corpse: {}
  corpse_nutrition: 400
  glyph: '@'
  hitdice: 5
  humanoid_body: 1
  infravision_detectable: 1
  invalid_polymorph_target: 1
  is_carnivorous: 1
  is_herbivorous: 1
  is_human: 1
  is_very_strong: 1
  mr: 10
  name: neanderthal
  not_randomly_generated: 1
  resist: {}
  size: human
  sound: guardian
  speed: 12
  wants_wargear: 1
  weight: 1450
newt:
  ac: 8
  alignment: 0
  always_hostile: 1
  attacks:
    - damage: 1d2
      mode: bite
      type: physical
  can_swim: 1
  color: yellow
  corpse: {}
  corpse_nutrition: 20
  glyph: ':'
  hitdice: 0
  is_amphibious: 1
  is_animal: 1
  is_carnivorous: 1
  is_genocidable: 1
  lacks_hands: 1
  mr: 0
  name: newt
  rarity: 5
  resist: {}
  size: tiny
  sound: silent
  speed: 6
  weight: 10
ninja:
  ac: 10
  alignment: 3
  always_hostile: 1
  attacks:
    - damage: 1d8
      mode: weapon
      type: physical
    - damage: 1d8
      mode: weapon
      type: physical
  color: white
  corpse: {}
  corpse_nutrition: 400
  glyph: '@'
  hitdice: 5
  humanoid_body: 1
  infravision_detectable: 1
  invalid_polymorph_target: 1
  is_carnivorous: 1
  is_herbivorous: 1
  is_human: 1
  is_very_strong: 1
  mr: 10
  name: ninja
  not_randomly_generated: 1
  resist: {}
  size: human
  sound: humanoid
  speed: 12
  wants_wargear: 1
  weight: 1450
nurse:
  ac: 0
  alignment: 0
  always_hostile: 1
  attacks:
    - damage: 2d6
      mode: claw
      type: heal
  color: white
  corpse:
    poison: 1
  corpse_nutrition: 400
  glyph: '@'
  hitdice: 11
  humanoid_body: 1
  infravision_detectable: 1
  invalid_polymorph_target: 1
  is_carnivorous: 1
  is_genocidable: 1
  is_herbivorous: 1
  is_human: 1
  mr: 0
  name: nurse
  rarity: 3
  resist:
    poison: 1
  size: human
  sound: nurse
  speed: 6
  weight: 1450
ochre jelly:
  ac: 8
  acidic_corpse: 1
  alignment: 0
  always_hostile: 1
  attacks:
    - damage: 3d6
      mode: engulf
      type: acid
    - damage: 3d6
      mode: passive
      type: acid
  cannot_pickup_items: 1
  color: brown
  corpse: {}
  corpse_nutrition: 20
  glyph: j
  hitdice: 6
  is_amorphous: 1
  is_breathless: 1
  is_genderless: 1
  is_genocidable: 1
  is_mindless: 1
  lacks_eyes: 1
  lacks_head: 1
  lacks_limbs: 1
  mr: 20
  name: ochre jelly
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
  color: brown
  corpse: {}
  corpse_nutrition: 500
  glyph: O
  has_infravision: 1
  hitdice: 5
  humanoid_body: 1
  infravision_detectable: 1
  is_carnivorous: 1
  is_genocidable: 1
  is_very_strong: 1
  mr: 0
  name: ogre
  rarity: 1
  resist: {}
  size: large
  small_group: 1
  sound: grunt
  speed: 10
  wants_gems: 1
  wants_gold: 1
  wants_wargear: 1
  weight: 1600
ogre king:
  ac: 4
  alignment: -7
  attacks:
    - damage: 3d5
      mode: weapon
      type: physical
  color: magenta
  corpse: {}
  corpse_nutrition: 750
  glyph: O
  has_infravision: 1
  hitdice: 9
  humanoid_body: 1
  infravision_detectable: 1
  is_always_male: 1
  is_carnivorous: 1
  is_genocidable: 1
  is_rank_prince: 1
  is_very_strong: 1
  mr: 60
  name: ogre king
  rarity: 2
  resist: {}
  size: large
  sound: grunt
  speed: 14
  wants_gems: 1
  wants_gold: 1
  wants_wargear: 1
  weight: 1700
ogre lord:
  ac: 3
  alignment: -5
  attacks:
    - damage: 2d6
      mode: weapon
      type: physical
  color: red
  corpse: {}
  corpse_nutrition: 700
  glyph: O
  has_infravision: 1
  hitdice: 7
  humanoid_body: 1
  infravision_detectable: 1
  is_always_male: 1
  is_carnivorous: 1
  is_genocidable: 1
  is_rank_lord: 1
  is_very_strong: 1
  mr: 30
  name: ogre lord
  rarity: 2
  resist: {}
  size: large
  sound: grunt
  speed: 12
  wants_gems: 1
  wants_gold: 1
  wants_wargear: 1
  weight: 1700
orange dragon:
  ac: -1
  alignment: 5
  always_hostile: 1
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
  can_fly: 1
  color: orange
  corpse:
    sleep: 1
  corpse_nutrition: 1500
  extra_nasty: 1
  glyph: D
  has_thick_hide: 1
  hitdice: 15
  is_carnivorous: 1
  is_genocidable: 1
  is_very_strong: 1
  lacks_hands: 1
  lays_eggs: 1
  mr: 20
  name: orange dragon
  rarity: 1
  resist:
    sleep: 1
  sees_invisible: 1
  size: gigantic
  sound: roar
  speed: 9
  wants_gems: 1
  wants_gold: 1
  wants_magic_items: 1
  weight: 4500
orc:
  ac: 10
  alignment: -3
  attacks:
    - damage: 1d8
      mode: weapon
      type: physical
  color: red
  corpse: {}
  corpse_nutrition: 150
  glyph: o
  has_infravision: 1
  hitdice: 1
  humanoid_body: 1
  infravision_detectable: 1
  invalid_polymorph_target: 1
  is_carnivorous: 1
  is_genocidable: 1
  is_herbivorous: 1
  is_orc: 1
  is_very_strong: 1
  large_group: 1
  mr: 0
  name: orc
  not_randomly_generated: 1
  resist: {}
  size: human
  sound: orc
  speed: 9
  wants_gems: 1
  wants_gold: 1
  wants_wargear: 1
  weight: 850
orc mummy:
  ac: 5
  alignment: -4
  always_hostile: 1
  attacks:
    - damage: 1d6
      mode: claw
      type: physical
  color: gray
  corpse: {}
  corpse_nutrition: 75
  glyph: M
  has_infravision: 1
  hitdice: 5
  humanoid_body: 1
  is_breathless: 1
  is_genocidable: 1
  is_mindless: 1
  is_orc: 1
  is_undead: 1
  mr: 20
  name: orc mummy
  never_drops_corpse: 1
  poisonous_corpse: 1
  rarity: 1
  resist:
    cold: 1
    poison: 1
    sleep: 1
  size: human
  sound: silent
  speed: 10
  wants_gems: 1
  wants_gold: 1
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
  corpse_nutrition: 300
  glyph: o
  has_infravision: 1
  hitdice: 3
  humanoid_body: 1
  infravision_detectable: 1
  is_carnivorous: 1
  is_genocidable: 1
  is_herbivorous: 1
  is_orc: 1
  is_very_strong: 1
  mr: 10
  name: orc shaman
  rarity: 1
  resist: {}
  size: human
  sound: orc
  speed: 9
  wants_gems: 1
  wants_gold: 1
  wants_magic_items: 1
  weight: 1000
orc zombie:
  ac: 9
  alignment: -3
  always_hostile: 1
  attacks:
    - damage: 1d6
      mode: claw
      type: physical
  color: gray
  corpse: {}
  corpse_nutrition: 75
  follows_stair_users: 1
  glyph: Z
  has_infravision: 1
  hitdice: 2
  humanoid_body: 1
  is_breathless: 1
  is_genocidable: 1
  is_mindless: 1
  is_orc: 1
  is_undead: 1
  mr: 0
  name: orc zombie
  never_drops_corpse: 1
  poisonous_corpse: 1
  rarity: 1
  resist:
    cold: 1
    poison: 1
    sleep: 1
  size: human
  small_group: 1
  sound: silent
  speed: 6
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
  color: magenta
  corpse: {}
  corpse_nutrition: 350
  glyph: o
  has_infravision: 1
  hitdice: 5
  humanoid_body: 1
  infravision_detectable: 1
  is_carnivorous: 1
  is_genocidable: 1
  is_herbivorous: 1
  is_orc: 1
  is_very_strong: 1
  mr: 0
  name: orc-captain
  rarity: 1
  resist: {}
  size: human
  sound: orc
  speed: 5
  wants_gems: 1
  wants_gold: 1
  wants_wargear: 1
  weight: 1350
owlbear:
  ac: 5
  alignment: 0
  always_hostile: 1
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
  color: brown
  corpse: {}
  corpse_nutrition: 700
  extra_nasty: 1
  glyph: Y
  hitdice: 5
  humanoid_body: 1
  infravision_detectable: 1
  is_animal: 1
  is_carnivorous: 1
  is_genocidable: 1
  is_very_strong: 1
  mr: 0
  name: owlbear
  rarity: 3
  resist: {}
  size: large
  sound: roar
  speed: 12
  weight: 1700
page:
  ac: 10
  alignment: 3
  always_peaceful: 1
  attacks:
    - damage: 1d6
      mode: weapon
      type: physical
    - damage: 1d6
      mode: weapon
      type: physical
  color: white
  corpse: {}
  corpse_nutrition: 400
  glyph: '@'
  hitdice: 5
  humanoid_body: 1
  infravision_detectable: 1
  invalid_polymorph_target: 1
  is_carnivorous: 1
  is_herbivorous: 1
  is_human: 1
  is_very_strong: 1
  mr: 10
  name: page
  not_randomly_generated: 1
  resist: {}
  size: human
  sound: guardian
  speed: 12
  wants_wargear: 1
  weight: 1450
panther:
  ac: 6
  alignment: 0
  always_hostile: 1
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
  color: black
  corpse: {}
  corpse_nutrition: 300
  glyph: f
  hitdice: 5
  infravision_detectable: 1
  is_animal: 1
  is_carnivorous: 1
  is_genocidable: 1
  lacks_hands: 1
  mr: 0
  name: panther
  rarity: 1
  resist: {}
  size: large
  sound: growl
  speed: 15
  weight: 600
paper golem:
  ac: 10
  alignment: 0
  always_hostile: 1
  attacks:
    - damage: 1d3
      mode: claw
      type: physical
  color: white
  corpse: {}
  glyph: "'"
  hitdice: 3
  humanoid_body: 1
  is_breathless: 1
  is_genderless: 1
  is_mindless: 1
  mr: 0
  name: paper golem
  never_drops_corpse: 1
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
  always_hostile: 1
  attacks:
    - damage: 2d6
      mode: bite
      type: physical
  can_swim: 1
  cannot_pickup_items: 1
  color: red
  corpse: {}
  corpse_nutrition: 30
  glyph: ;
  hitdice: 5
  is_amphibious: 1
  is_animal: 1
  is_carnivorous: 1
  is_genocidable: 1
  lacks_limbs: 1
  lays_eggs: 1
  mr: 0
  name: piranha
  not_randomly_generated: 1
  resist: {}
  serpentine_body: 1
  size: small
  small_group: 1
  sound: silent
  speed: 12
  weight: 60
pit fiend:
  ac: -3
  alignment: -13
  always_hostile: 1
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
  color: red
  corpse: {}
  corpse_nutrition: 400
  extra_nasty: 1
  follows_stair_users: 1
  gehennom_exclusive: 1
  glyph: '&'
  has_infravision: 1
  hitdice: 13
  infravision_detectable: 1
  is_demon: 1
  mr: 65
  name: pit fiend
  never_drops_corpse: 1
  poisonous_corpse: 1
  rarity: 2
  resist:
    fire: 1
    poison: 1
  sees_invisible: 1
  size: large
  sound: growl
  speed: 6
  wants_wargear: 1
  weight: 1450
pit viper:
  ac: 2
  alignment: 0
  always_hostile: 1
  attacks:
    - damage: 1d4
      mode: bite
      type: poison
    - damage: 1d4
      mode: bite
      type: poison
  can_swim: 1
  cannot_pickup_items: 1
  color: blue
  corpse:
    poison: 1
  corpse_nutrition: 60
  glyph: S
  has_infravision: 1
  hides_under_item: 1
  hitdice: 6
  is_animal: 1
  is_carnivorous: 1
  is_genocidable: 1
  lacks_limbs: 1
  lays_eggs: 1
  mr: 0
  name: pit viper
  poisonous_corpse: 1
  rarity: 1
  resist:
    poison: 1
  serpentine_body: 1
  size: medium
  sound: hiss
  speed: 15
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
  color: brown
  corpse: {}
  corpse_nutrition: 500
  glyph: C
  hitdice: 4
  humanoid_body: 1
  infravision_detectable: 1
  is_carnivorous: 1
  is_genocidable: 1
  is_herbivorous: 1
  is_very_strong: 1
  mr: 0
  name: plains centaur
  rarity: 1
  resist: {}
  size: large
  sound: humanoid
  speed: 18
  wants_gold: 1
  wants_wargear: 1
  weight: 2500
pony:
  ac: 6
  alignment: 0
  attacks:
    - damage: 1d6
      mode: kick
      type: physical
    - damage: 1d2
      mode: bite
      type: physical
  color: brown
  corpse: {}
  corpse_nutrition: 250
  food_makes_peaceful: 1
  glyph: u
  hitdice: 3
  infravision_detectable: 1
  is_animal: 1
  is_genocidable: 1
  is_herbivorous: 1
  is_very_strong: 1
  is_wanderer: 1
  lacks_hands: 1
  mr: 0
  name: pony
  rarity: 2
  resist: {}
  size: medium
  sound: neigh
  speed: 16
  weight: 1300
priest:
  ac: 10
  alignment: 0
  attacks:
    - damage: 1d6
      mode: weapon
      type: physical
  color: white
  corpse: {}
  corpse_nutrition: 400
  glyph: '@'
  hitdice: 10
  humanoid_body: 1
  infravision_detectable: 1
  invalid_polymorph_target: 1
  is_always_male: 1
  is_carnivorous: 1
  is_herbivorous: 1
  is_human: 1
  is_very_strong: 1
  mr: 2
  name: priest
  not_randomly_generated: 1
  resist: {}
  size: human
  sound: humanoid
  speed: 12
  wants_wargear: 1
  weight: 1450
priestess:
  ac: 10
  alignment: 0
  attacks:
    - damage: 1d6
      mode: weapon
      type: physical
  color: white
  corpse: {}
  corpse_nutrition: 400
  glyph: '@'
  hitdice: 10
  humanoid_body: 1
  infravision_detectable: 1
  invalid_polymorph_target: 1
  is_always_female: 1
  is_carnivorous: 1
  is_herbivorous: 1
  is_human: 1
  is_very_strong: 1
  mr: 2
  name: priestess
  not_randomly_generated: 1
  resist: {}
  size: human
  sound: humanoid
  speed: 12
  wants_wargear: 1
  weight: 1450
prisoner:
  ac: 10
  alignment: 0
  always_peaceful: 1
  attacks:
    - damage: 1d6
      mode: weapon
      type: physical
  color: white
  corpse: {}
  corpse_nutrition: 400
  glyph: '@'
  hitdice: 12
  humanoid_body: 1
  immobile_until_disturbed: 1
  infravision_detectable: 1
  invalid_polymorph_target: 1
  is_carnivorous: 1
  is_herbivorous: 1
  is_human: 1
  is_very_strong: 1
  mr: 0
  name: prisoner
  not_randomly_generated: 1
  resist: {}
  size: human
  sound: djinni
  speed: 12
  wants_wargear: 1
  weight: 1450
purple worm:
  ac: 6
  alignment: 0
  always_hostile: 1
  attacks:
    - damage: 2d8
      mode: bite
      type: physical
    - damage: 1d10
      mode: engulf
      type: digest
  color: magenta
  corpse: {}
  corpse_nutrition: 700
  extra_nasty: 1
  glyph: w
  hitdice: 15
  is_animal: 1
  is_carnivorous: 1
  is_genocidable: 1
  is_very_strong: 1
  lacks_limbs: 1
  lays_eggs: 1
  mr: 20
  name: purple worm
  rarity: 2
  resist: {}
  serpentine_body: 1
  size: gigantic
  sound: silent
  speed: 9
  weight: 2700
pyrolisk:
  ac: 6
  alignment: 0
  always_hostile: 1
  attacks:
    - damage: 2d6
      mode: gaze
      type: fire
  color: red
  corpse:
    fire: 1
    poison: 1
  corpse_nutrition: 30
  glyph: c
  hitdice: 6
  infravision_detectable: 1
  is_animal: 1
  is_carnivorous: 1
  is_genocidable: 1
  is_herbivorous: 1
  lacks_hands: 1
  lays_eggs: 1
  mr: 30
  name: pyrolisk
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
  always_hostile: 1
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
  can_swim: 1
  cannot_pickup_items: 1
  color: magenta
  corpse: {}
  corpse_nutrition: 100
  glyph: S
  has_infravision: 1
  hitdice: 6
  is_animal: 1
  is_carnivorous: 1
  is_genocidable: 1
  is_very_strong: 1
  lacks_limbs: 1
  lays_eggs: 1
  mr: 0
  name: python
  rarity: 1
  resist: {}
  serpentine_body: 1
  size: large
  sound: hiss
  speed: 3
  weight: 250
quantum mechanic:
  ac: 3
  alignment: 0
  always_hostile: 1
  attacks:
    - damage: 1d4
      mode: claw
      type: teleport
  color: cyan
  corpse: {}
  corpse_nutrition: 20
  glyph: Q
  has_teleportitis: 1
  hitdice: 7
  humanoid_body: 1
  infravision_detectable: 1
  is_carnivorous: 1
  is_genocidable: 1
  is_herbivorous: 1
  mr: 10
  name: quantum mechanic
  poisonous_corpse: 1
  rarity: 3
  resist:
    poison: 1
  size: human
  sound: humanoid
  speed: 12
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
  corpse_nutrition: 200
  follows_stair_users: 1
  glyph: i
  has_infravision: 1
  hitdice: 3
  infravision_detectable: 1
  is_genocidable: 1
  mr: 20
  name: quasit
  rarity: 2
  regenerates_quickly: 1
  resist:
    poison: 1
  size: small
  sound: silent
  speed: 15
  weight: 200
queen bee:
  ac: -4
  alignment: 0
  always_hostile: 1
  attacks:
    - damage: 1d8
      mode: sting
      type: poison
  can_fly: 1
  color: magenta
  corpse:
    poison: 1
  corpse_nutrition: 5
  glyph: a
  hitdice: 9
  is_always_female: 1
  is_animal: 1
  is_genocidable: 1
  is_rank_prince: 1
  lacks_hands: 1
  lays_eggs: 1
  mr: 0
  name: queen bee
  not_randomly_generated: 1
  poisonous_corpse: 1
  resist:
    poison: 1
  size: tiny
  sound: buzz
  speed: 24
  weight: 1
quivering blob:
  ac: 8
  alignment: 0
  always_hostile: 1
  attacks:
    - damage: 1d8
      mode: touch
      type: physical
  color: white
  corpse:
    poison: 1
  corpse_nutrition: 100
  glyph: b
  hitdice: 5
  is_genderless: 1
  is_genocidable: 1
  is_mindless: 1
  is_wanderer: 1
  lacks_eyes: 1
  lacks_head: 1
  lacks_limbs: 1
  mr: 0
  name: quivering blob
  rarity: 2
  resist:
    poison: 1
    sleep: 1
  size: small
  sound: silent
  speed: 1
  weight: 200
rabid rat:
  ac: 6
  alignment: 0
  always_hostile: 1
  attacks:
    - damage: 2d4
      mode: bite
      type: poisoncon
  color: brown
  corpse: {}
  corpse_nutrition: 5
  glyph: r
  hitdice: 2
  infravision_detectable: 1
  is_animal: 1
  is_carnivorous: 1
  is_genocidable: 1
  lacks_hands: 1
  mr: 0
  name: rabid rat
  poisonous_corpse: 1
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
  color: white
  corpse: {}
  corpse_nutrition: 400
  glyph: '@'
  hitdice: 10
  humanoid_body: 1
  infravision_detectable: 1
  invalid_polymorph_target: 1
  is_carnivorous: 1
  is_herbivorous: 1
  is_human: 1
  is_very_strong: 1
  mr: 2
  name: ranger
  not_randomly_generated: 1
  resist: {}
  size: human
  sound: humanoid
  speed: 12
  wants_wargear: 1
  weight: 1450
raven:
  ac: 6
  alignment: 0
  always_hostile: 1
  attacks:
    - damage: 1d6
      mode: bite
      type: physical
    - damage: 1d6
      mode: claw
      type: blind
  can_fly: 1
  color: black
  corpse: {}
  corpse_nutrition: 20
  glyph: B
  hitdice: 4
  infravision_detectable: 1
  is_animal: 1
  is_carnivorous: 1
  is_genocidable: 1
  is_wanderer: 1
  lacks_hands: 1
  mr: 0
  name: raven
  rarity: 2
  resist: {}
  size: small
  sound: sqawk
  speed: 20
  weight: 40
red dragon:
  ac: -1
  alignment: -4
  always_hostile: 1
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
  can_fly: 1
  color: red
  corpse:
    fire: 1
  corpse_nutrition: 1500
  extra_nasty: 1
  glyph: D
  has_thick_hide: 1
  hitdice: 15
  infravision_detectable: 1
  is_carnivorous: 1
  is_genocidable: 1
  is_very_strong: 1
  lacks_hands: 1
  lays_eggs: 1
  mr: 20
  name: red dragon
  rarity: 1
  resist:
    fire: 1
  sees_invisible: 1
  size: gigantic
  sound: roar
  speed: 9
  wants_gems: 1
  wants_gold: 1
  wants_magic_items: 1
  weight: 4500
red mold:
  ac: 9
  alignment: 0
  always_hostile: 1
  attacks:
    - damage: 0d4
      mode: passive
      type: fire
  cannot_pickup_items: 1
  color: red
  corpse:
    fire: 1
    poison: 1
  corpse_nutrition: 30
  glyph: F
  hitdice: 1
  infravision_detectable: 1
  is_breathless: 1
  is_genderless: 1
  is_genocidable: 1
  is_mindless: 1
  lacks_eyes: 1
  lacks_head: 1
  lacks_limbs: 1
  mr: 0
  name: red mold
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
  cannot_pickup_items: 1
  color: red
  corpse:
    fire: 1
    poison: 1
  corpse_nutrition: 400
  glyph: N
  has_thick_hide: 1
  hitdice: 6
  infravision_detectable: 1
  is_carnivorous: 1
  is_genocidable: 1
  is_herbivorous: 1
  is_very_strong: 1
  lacks_limbs: 1
  lays_eggs: 1
  mr: 0
  name: red naga
  rarity: 1
  resist:
    fire: 1
    poison: 1
  serpentine_body: 1
  size: huge
  sound: mumble
  speed: 12
  weight: 2600
red naga hatchling:
  ac: 6
  alignment: 0
  attacks:
    - damage: 1d4
      mode: bite
      type: physical
  cannot_pickup_items: 1
  color: red
  corpse:
    fire: 1
    poison: 1
  corpse_nutrition: 100
  glyph: N
  has_thick_hide: 1
  hitdice: 3
  infravision_detectable: 1
  is_carnivorous: 1
  is_genocidable: 1
  is_herbivorous: 1
  is_very_strong: 1
  lacks_limbs: 1
  mr: 0
  name: red naga hatchling
  resist:
    fire: 1
    poison: 1
  serpentine_body: 1
  size: large
  sound: mumble
  speed: 10
  weight: 500
rock mole:
  ac: 0
  alignment: 0
  always_hostile: 1
  attacks:
    - damage: 1d6
      mode: bite
      type: physical
  can_eat_metal: 1
  can_eat_rock: 1
  color: gray
  corpse: {}
  corpse_nutrition: 30
  glyph: r
  hitdice: 3
  infravision_detectable: 1
  is_animal: 1
  is_genocidable: 1
  lacks_hands: 1
  mr: 20
  name: rock mole
  rarity: 2
  resist: {}
  size: small
  sound: silent
  speed: 3
  wants_gems: 1
  wants_gold: 1
  wants_wargear: 1
  weight: 30
rock piercer:
  ac: 3
  alignment: 0
  always_hostile: 1
  attacks:
    - damage: 2d6
      mode: bite
      type: physical
  cannot_pickup_items: 1
  clings_to_ceiling: 1
  color: gray
  corpse: {}
  corpse_nutrition: 200
  glyph: p
  hides_on_ceiling: 1
  hitdice: 3
  is_animal: 1
  is_carnivorous: 1
  is_genocidable: 1
  lacks_eyes: 1
  lacks_limbs: 1
  mr: 0
  name: rock piercer
  rarity: 4
  resist: {}
  size: small
  sound: silent
  speed: 1
  weight: 200
rock troll:
  ac: 0
  alignment: -3
  always_hostile: 1
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
  color: cyan
  corpse: {}
  corpse_nutrition: 300
  follows_stair_users: 1
  glyph: T
  has_infravision: 1
  hitdice: 9
  humanoid_body: 1
  infravision_detectable: 1
  is_carnivorous: 1
  is_genocidable: 1
  is_very_strong: 1
  mr: 0
  name: rock troll
  rarity: 1
  regenerates_quickly: 1
  resist: {}
  size: large
  sound: grunt
  speed: 12
  wants_wargear: 1
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
  color: white
  corpse: {}
  corpse_nutrition: 400
  glyph: '@'
  hitdice: 10
  humanoid_body: 1
  infravision_detectable: 1
  invalid_polymorph_target: 1
  is_carnivorous: 1
  is_herbivorous: 1
  is_human: 1
  is_very_strong: 1
  mr: 1
  name: rogue
  not_randomly_generated: 1
  resist: {}
  size: human
  sound: humanoid
  speed: 12
  wants_gems: 1
  wants_gold: 1
  wants_wargear: 1
  weight: 1450
rope golem:
  ac: 8
  alignment: 0
  always_hostile: 1
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
  color: brown
  corpse: {}
  glyph: "'"
  hitdice: 4
  humanoid_body: 1
  is_breathless: 1
  is_genderless: 1
  is_mindless: 1
  mr: 0
  name: rope golem
  never_drops_corpse: 1
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
  always_peaceful: 1
  attacks:
    - damage: 1d8
      mode: weapon
      type: physical
    - damage: 1d8
      mode: weapon
      type: physical
  color: white
  corpse: {}
  corpse_nutrition: 400
  glyph: '@'
  hitdice: 5
  humanoid_body: 1
  infravision_detectable: 1
  invalid_polymorph_target: 1
  is_carnivorous: 1
  is_herbivorous: 1
  is_human: 1
  is_very_strong: 1
  mr: 10
  name: roshi
  not_randomly_generated: 1
  resist: {}
  size: human
  sound: guardian
  speed: 12
  wants_wargear: 1
  weight: 1450
rothe:
  ac: 7
  alignment: 0
  always_hostile: 1
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
  corpse_nutrition: 100
  glyph: q
  hitdice: 2
  infravision_detectable: 1
  is_animal: 1
  is_carnivorous: 1
  is_genocidable: 1
  is_herbivorous: 1
  lacks_hands: 1
  mr: 0
  name: rothe
  rarity: 4
  resist: {}
  size: large
  small_group: 1
  sound: silent
  speed: 9
  weight: 400
rust monster:
  ac: 2
  alignment: 0
  always_hostile: 1
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
  can_eat_metal: 1
  can_swim: 1
  color: brown
  corpse: {}
  corpse_nutrition: 250
  glyph: R
  hitdice: 5
  infravision_detectable: 1
  is_animal: 1
  is_genocidable: 1
  lacks_hands: 1
  mr: 0
  name: rust monster
  rarity: 2
  resist: {}
  size: medium
  sound: silent
  speed: 18
  weight: 1000
salamander:
  ac: -1
  alignment: -9
  always_hostile: 1
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
  color: orange
  corpse:
    fire: 1
  corpse_nutrition: 400
  follows_stair_users: 1
  gehennom_exclusive: 1
  glyph: ':'
  has_thick_hide: 1
  hitdice: 8
  humanoid_body: 1
  infravision_detectable: 1
  mr: 0
  name: salamander
  poisonous_corpse: 1
  rarity: 1
  resist:
    fire: 1
    sleep: 1
  serpentine_body: 1
  size: human
  sound: mumble
  speed: 12
  wants_magic_items: 1
  wants_wargear: 1
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
  color: white
  corpse: {}
  corpse_nutrition: 400
  glyph: '@'
  hitdice: 10
  humanoid_body: 1
  infravision_detectable: 1
  invalid_polymorph_target: 1
  is_carnivorous: 1
  is_herbivorous: 1
  is_human: 1
  is_very_strong: 1
  mr: 1
  name: samurai
  not_randomly_generated: 1
  resist: {}
  size: human
  sound: humanoid
  speed: 12
  wants_wargear: 1
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
  color: gray
  corpse: {}
  corpse_nutrition: 400
  follows_stair_users: 1
  gehennom_exclusive: 1
  glyph: '&'
  has_infravision: 1
  hitdice: 13
  humanoid_body: 1
  infravision_detectable: 1
  invalid_polymorph_target: 1
  is_very_strong: 1
  mr: 60
  name: sandestin
  never_drops_corpse: 1
  rarity: 1
  resist:
    stone: 1
  size: human
  sound: cuss
  speed: 12
  wants_wargear: 1
  weight: 1500
sasquatch:
  ac: 6
  alignment: 2
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
  corpse_nutrition: 750
  glyph: Y
  hitdice: 7
  humanoid_body: 1
  infravision_detectable: 1
  is_animal: 1
  is_carnivorous: 1
  is_genocidable: 1
  is_herbivorous: 1
  is_very_strong: 1
  mr: 0
  name: sasquatch
  rarity: 1
  resist: {}
  sees_invisible: 1
  size: large
  sound: growl
  speed: 15
  weight: 1550
scorpion:
  ac: 3
  alignment: 0
  always_hostile: 1
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
  color: red
  corpse:
    poison: 1
  corpse_nutrition: 100
  glyph: s
  hides_under_item: 1
  hitdice: 5
  is_animal: 1
  is_carnivorous: 1
  is_genocidable: 1
  lacks_hands: 1
  lays_eggs: 1
  mr: 0
  name: scorpion
  poisonous_corpse: 1
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
  always_hostile: 1
  attacks:
    - damage: 2d6
      mode: weapon
      type: physical
  color: red
  corpse: {}
  corpse_nutrition: 400
  follows_stair_users: 1
  glyph: '@'
  hitdice: 8
  humanoid_body: 1
  infravision_detectable: 1
  invalid_polymorph_target: 1
  is_carnivorous: 1
  is_genocidable: 1
  is_herbivorous: 1
  is_human: 1
  is_mercenary: 1
  is_very_strong: 1
  mr: 5
  name: sergeant
  rarity: 1
  resist: {}
  size: human
  small_group: 1
  sound: soldier
  speed: 10
  wants_wargear: 1
  weight: 1450
sewer rat:
  ac: 7
  alignment: 0
  always_hostile: 1
  attacks:
    - damage: 1d3
      mode: bite
      type: physical
  color: brown
  corpse: {}
  corpse_nutrition: 12
  glyph: r
  hitdice: 0
  infravision_detectable: 1
  is_animal: 1
  is_carnivorous: 1
  is_genocidable: 1
  lacks_hands: 1
  mr: 0
  name: sewer rat
  rarity: 1
  resist: {}
  size: tiny
  small_group: 1
  sound: sqeek
  speed: 12
  weight: 20
shade:
  ac: 10
  alignment: 0
  always_hostile: 1
  attacks:
    - damage: 2d6
      mode: touch
      type: paralyze
    - damage: 1d6
      mode: touch
      type: slow
  can_fly: 1
  color: black
  corpse: {}
  extra_nasty: 1
  follows_stair_users: 1
  glyph: X
  has_infravision: 1
  hitdice: 12
  humanoid_body: 1
  ignores_walls: 1
  invalid_polymorph_target: 1
  is_breathless: 1
  is_undead: 1
  is_wanderer: 1
  made_of_gas: 1
  mr: 0
  name: shade
  never_drops_corpse: 1
  not_randomly_generated: 1
  nutrition: 0
  resist:
    cold: 1
    disint: 1
    poison: 1
    sleep: 1
    stone: 1
  sees_invisible: 1
  size: human
  sound: wail
  speed: 10
  weight: 1450
shark:
  ac: 2
  alignment: 0
  always_hostile: 1
  attacks:
    - damage: 5d6
      mode: bite
      type: physical
  can_swim: 1
  cannot_pickup_items: 1
  color: gray
  corpse: {}
  corpse_nutrition: 350
  glyph: ;
  has_thick_hide: 1
  hitdice: 7
  is_amphibious: 1
  is_animal: 1
  is_carnivorous: 1
  is_genocidable: 1
  lacks_limbs: 1
  lays_eggs: 1
  mr: 0
  name: shark
  not_randomly_generated: 1
  resist: {}
  serpentine_body: 1
  size: large
  sound: silent
  speed: 12
  weight: 500
shocking sphere:
  ac: 4
  alignment: 0
  always_hostile: 1
  attacks:
    - damage: 4d6
      mode: explode
      type: electricity
  can_fly: 1
  color: bright_blue
  corpse:
    elec: 1
  corpse_nutrition: 10
  glyph: e
  hitdice: 6
  infravision_detectable: 1
  is_breathless: 1
  is_genderless: 1
  is_genocidable: 1
  is_mindless: 1
  lacks_head: 1
  lacks_limbs: 1
  mr: 0
  name: shocking sphere
  never_drops_corpse: 1
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
  always_peaceful: 1
  attacks:
    - damage: 4d4
      mode: weapon
      type: physical
    - damage: 4d4
      mode: weapon
      type: physical
  color: white
  corpse: {}
  corpse_nutrition: 400
  glyph: '@'
  hitdice: 12
  humanoid_body: 1
  infravision_detectable: 1
  invalid_polymorph_target: 1
  is_carnivorous: 1
  is_herbivorous: 1
  is_human: 1
  is_very_strong: 1
  mr: 50
  name: shopkeeper
  not_randomly_generated: 1
  resist: {}
  size: human
  sound: sell
  speed: 18
  wants_magic_items: 1
  wants_wargear: 1
  weight: 1450
shrieker:
  ac: 7
  alignment: 0
  always_hostile: 1
  cannot_pickup_items: 1
  color: magenta
  corpse:
    poison: 1
  corpse_nutrition: 100
  glyph: F
  hitdice: 3
  is_breathless: 1
  is_genderless: 1
  is_genocidable: 1
  is_mindless: 1
  lacks_eyes: 1
  lacks_head: 1
  lacks_limbs: 1
  mr: 0
  name: shrieker
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
  always_hostile: 1
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
  can_fly: 1
  color: gray
  corpse: {}
  corpse_nutrition: 1500
  extra_nasty: 1
  glyph: D
  has_thick_hide: 1
  hitdice: 15
  is_carnivorous: 1
  is_genocidable: 1
  is_very_strong: 1
  lacks_hands: 1
  lays_eggs: 1
  mr: 20
  name: silver dragon
  rarity: 1
  resist:
    cold: 1
  sees_invisible: 1
  size: gigantic
  sound: roar
  speed: 9
  wants_gems: 1
  wants_gold: 1
  wants_magic_items: 1
  weight: 4500
skeleton:
  ac: 4
  alignment: 0
  always_hostile: 1
  attacks:
    - damage: 2d6
      mode: weapon
      type: physical
    - damage: 1d6
      mode: touch
      type: slow
  color: white
  corpse: {}
  corpse_nutrition: 5
  extra_nasty: 1
  glyph: Z
  has_infravision: 1
  has_thick_hide: 1
  hitdice: 12
  humanoid_body: 1
  is_breathless: 1
  is_mindless: 1
  is_undead: 1
  is_very_strong: 1
  is_wanderer: 1
  mr: 0
  name: skeleton
  never_drops_corpse: 1
  not_randomly_generated: 1
  resist:
    cold: 1
    poison: 1
    sleep: 1
    stone: 1
  size: human
  sound: bones
  speed: 8
  wants_wargear: 1
  weight: 300
small mimic:
  ac: 7
  alignment: 0
  always_hostile: 1
  attacks:
    - damage: 3d4
      mode: claw
      type: physical
  color: brown
  corpse: {}
  corpse_nutrition: 200
  glyph: m
  has_thick_hide: 1
  hides_on_ceiling: 1
  hitdice: 7
  is_amorphous: 1
  is_animal: 1
  is_breathless: 1
  is_carnivorous: 1
  is_genocidable: 1
  lacks_eyes: 1
  lacks_head: 1
  lacks_limbs: 1
  mr: 0
  name: small mimic
  rarity: 2
  resist:
    acid: 1
  size: medium
  sound: silent
  speed: 3
  weight: 300
snake:
  ac: 3
  alignment: 0
  always_hostile: 1
  attacks:
    - damage: 1d6
      mode: bite
      type: poison
  can_swim: 1
  cannot_pickup_items: 1
  color: brown
  corpse:
    poison: 1
  corpse_nutrition: 80
  glyph: S
  hides_under_item: 1
  hitdice: 4
  is_animal: 1
  is_carnivorous: 1
  is_genocidable: 1
  lacks_limbs: 1
  lays_eggs: 1
  mr: 0
  name: snake
  poisonous_corpse: 1
  rarity: 2
  resist:
    poison: 1
  serpentine_body: 1
  size: small
  sound: hiss
  speed: 15
  weight: 100
soldier:
  ac: 10
  alignment: -2
  always_hostile: 1
  attacks:
    - damage: 1d8
      mode: weapon
      type: physical
  color: gray
  corpse: {}
  corpse_nutrition: 400
  follows_stair_users: 1
  glyph: '@'
  hitdice: 6
  humanoid_body: 1
  infravision_detectable: 1
  invalid_polymorph_target: 1
  is_carnivorous: 1
  is_genocidable: 1
  is_herbivorous: 1
  is_human: 1
  is_mercenary: 1
  is_very_strong: 1
  mr: 0
  name: soldier
  rarity: 1
  resist: {}
  size: human
  small_group: 1
  sound: soldier
  speed: 10
  wants_wargear: 1
  weight: 1450
soldier ant:
  ac: 3
  alignment: 0
  always_hostile: 1
  attacks:
    - damage: 2d4
      mode: bite
      type: physical
    - damage: 3d4
      mode: sting
      type: poison
  color: blue
  corpse:
    poison: 1
  corpse_nutrition: 5
  glyph: a
  hitdice: 3
  is_animal: 1
  is_carnivorous: 1
  is_genocidable: 1
  lacks_hands: 1
  lays_eggs: 1
  mr: 0
  name: soldier ant
  poisonous_corpse: 1
  rarity: 2
  resist:
    poison: 1
  size: tiny
  small_group: 1
  sound: silent
  speed: 18
  weight: 20
spotted jelly:
  ac: 8
  acidic_corpse: 1
  alignment: 0
  always_hostile: 1
  attacks:
    - damage: 0d6
      mode: passive
      type: acid
  cannot_pickup_items: 1
  color: green
  corpse: {}
  corpse_nutrition: 20
  glyph: j
  hitdice: 5
  is_amorphous: 1
  is_breathless: 1
  is_genderless: 1
  is_genocidable: 1
  is_mindless: 1
  lacks_eyes: 1
  lacks_head: 1
  lacks_limbs: 1
  mr: 10
  name: spotted jelly
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
  always_hostile: 1
  attacks:
    - damage: 4d4
      mode: claw
      type: physical
  can_fly: 1
  color: white
  corpse: {}
  corpse_nutrition: 400
  follows_stair_users: 1
  glyph: E
  has_infravision: 1
  hitdice: 8
  is_animal: 1
  is_genocidable: 1
  is_very_strong: 1
  is_wanderer: 1
  mr: 0
  name: stalker
  rarity: 3
  resist: {}
  sees_invisible: 1
  size: large
  sound: silent
  speed: 12
  weight: 900
steam vortex:
  ac: 2
  alignment: 0
  always_hostile: 1
  attacks:
    - damage: 1d8
      mode: engulf
      type: fire
  can_fly: 1
  color: blue
  corpse: {}
  gehennom_exclusive: 1
  glyph: v
  hitdice: 7
  infravision_detectable: 1
  is_breathless: 1
  is_genderless: 1
  is_genocidable: 1
  is_mindless: 1
  lacks_eyes: 1
  lacks_head: 1
  lacks_limbs: 1
  made_of_gas: 1
  mr: 30
  name: steam vortex
  never_drops_corpse: 1
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
  weight: 0
stone giant:
  ac: 0
  alignment: 2
  attacks:
    - damage: 2d10
      mode: weapon
      type: physical
  color: gray
  corpse: {}
  corpse_nutrition: 750
  extra_nasty: 1
  glyph: H
  has_infravision: 1
  hitdice: 6
  humanoid_body: 1
  infravision_detectable: 1
  is_carnivorous: 1
  is_genocidable: 1
  is_giant: 1
  is_very_strong: 1
  mr: 0
  name: stone giant
  rarity: 1
  resist: {}
  size: huge
  small_group: 1
  sound: boast
  speed: 6
  throws_boulders: 1
  wants_gems: 1
  wants_wargear: 1
  weight: 2250
stone golem:
  ac: 5
  alignment: 0
  always_hostile: 1
  attacks:
    - damage: 3d8
      mode: claw
      type: physical
  color: gray
  corpse: {}
  glyph: "'"
  has_thick_hide: 1
  hitdice: 14
  humanoid_body: 1
  is_breathless: 1
  is_mindless: 1
  is_very_strong: 1
  mr: 50
  name: stone golem
  never_drops_corpse: 1
  nutrition: 0
  rarity: 1
  resist:
    poison: 1
    sleep: 1
    stone: 1
  size: large
  sound: silent
  speed: 6
  weight: 1900
storm giant:
  ac: 3
  alignment: -3
  attacks:
    - damage: 2d12
      mode: weapon
      type: physical
  color: blue
  corpse:
    elec: 1
  corpse_nutrition: 750
  extra_nasty: 1
  glyph: H
  has_infravision: 1
  hitdice: 16
  humanoid_body: 1
  infravision_detectable: 1
  is_carnivorous: 1
  is_genocidable: 1
  is_giant: 1
  is_very_strong: 1
  mr: 10
  name: storm giant
  rarity: 1
  resist:
    elec: 1
  size: huge
  small_group: 1
  sound: boast
  speed: 12
  throws_boulders: 1
  wants_gems: 1
  wants_wargear: 1
  weight: 2250
straw golem:
  ac: 10
  alignment: 0
  always_hostile: 1
  attacks:
    - damage: 1d2
      mode: claw
      type: physical
    - damage: 1d2
      mode: claw
      type: physical
  color: yellow
  corpse: {}
  glyph: "'"
  hitdice: 3
  humanoid_body: 1
  is_breathless: 1
  is_genderless: 1
  is_mindless: 1
  mr: 0
  name: straw golem
  never_drops_corpse: 1
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
  always_peaceful: 1
  attacks:
    - damage: 1d6
      mode: weapon
      type: physical
  color: white
  corpse: {}
  corpse_nutrition: 400
  glyph: '@'
  hitdice: 5
  humanoid_body: 1
  infravision_detectable: 1
  invalid_polymorph_target: 1
  is_carnivorous: 1
  is_herbivorous: 1
  is_human: 1
  is_very_strong: 1
  mr: 10
  name: student
  not_randomly_generated: 1
  resist: {}
  size: human
  sound: guardian
  speed: 12
  tunnels_with_pick: 1
  wants_wargear: 1
  weight: 1450
succubus:
  ac: 0
  alignment: -9
  always_hostile: 1
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
  can_fly: 1
  color: gray
  corpse: {}
  corpse_nutrition: 400
  extra_nasty: 1
  follows_stair_users: 1
  glyph: '&'
  has_infravision: 1
  hitdice: 6
  humanoid_body: 1
  infravision_detectable: 1
  is_always_female: 1
  is_demon: 1
  mr: 70
  name: succubus
  never_drops_corpse: 1
  poisonous_corpse: 1
  rarity: 1
  resist:
    fire: 1
    poison: 1
  size: human
  sound: seduce
  speed: 12
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
  corpse_nutrition: 200
  follows_stair_users: 1
  glyph: i
  has_infravision: 1
  has_teleport_control: 1
  has_teleportitis: 1
  hitdice: 6
  infravision_detectable: 1
  is_genocidable: 1
  mr: 30
  name: tengu
  rarity: 3
  resist:
    poison: 1
  size: small
  sound: sqawk
  speed: 13
  weight: 300
thug:
  ac: 10
  alignment: -3
  always_peaceful: 1
  attacks:
    - damage: 1d6
      mode: weapon
      type: physical
    - damage: 1d6
      mode: weapon
      type: physical
  color: white
  corpse: {}
  corpse_nutrition: 400
  glyph: '@'
  hitdice: 5
  humanoid_body: 1
  infravision_detectable: 1
  invalid_polymorph_target: 1
  is_carnivorous: 1
  is_herbivorous: 1
  is_human: 1
  is_very_strong: 1
  mr: 10
  name: thug
  not_randomly_generated: 1
  resist: {}
  size: human
  sound: guardian
  speed: 12
  wants_gold: 1
  wants_wargear: 1
  weight: 1450
tiger:
  ac: 6
  alignment: 0
  always_hostile: 1
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
  color: yellow
  corpse: {}
  corpse_nutrition: 300
  glyph: f
  hitdice: 6
  infravision_detectable: 1
  is_animal: 1
  is_carnivorous: 1
  is_genocidable: 1
  lacks_hands: 1
  mr: 0
  name: tiger
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
  can_fly: 1
  color: magenta
  corpse: {}
  corpse_nutrition: 900
  extra_nasty: 1
  glyph: H
  has_infravision: 1
  hitdice: 16
  humanoid_body: 1
  infravision_detectable: 1
  is_carnivorous: 1
  is_herbivorous: 1
  is_very_strong: 1
  mr: 70
  name: titan
  rarity: 1
  resist: {}
  size: huge
  sound: spell
  speed: 18
  throws_boulders: 1
  wants_magic_items: 1
  wants_wargear: 1
  weight: 2300
titanothere:
  ac: 6
  alignment: 0
  always_hostile: 1
  attacks:
    - damage: 2d8
      mode: claw
      type: physical
  color: gray
  corpse: {}
  corpse_nutrition: 650
  glyph: q
  has_thick_hide: 1
  hitdice: 12
  infravision_detectable: 1
  is_animal: 1
  is_genocidable: 1
  is_herbivorous: 1
  is_very_strong: 1
  lacks_hands: 1
  mr: 0
  name: titanothere
  rarity: 2
  resist: {}
  size: large
  sound: silent
  speed: 12
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
  color: white
  corpse: {}
  corpse_nutrition: 400
  glyph: '@'
  hitdice: 10
  humanoid_body: 1
  infravision_detectable: 1
  invalid_polymorph_target: 1
  is_carnivorous: 1
  is_herbivorous: 1
  is_human: 1
  is_very_strong: 1
  mr: 1
  name: tourist
  not_randomly_generated: 1
  resist: {}
  size: human
  sound: humanoid
  speed: 12
  wants_wargear: 1
  weight: 1450
trapper:
  ac: 3
  alignment: 0
  always_hostile: 1
  attacks:
    - damage: 1d10
      mode: engulf
      type: digest
  color: green
  corpse: {}
  corpse_nutrition: 350
  follows_stair_users: 1
  glyph: t
  hides_on_ceiling: 1
  hitdice: 12
  is_animal: 1
  is_carnivorous: 1
  is_genocidable: 1
  is_very_strong: 1
  lacks_eyes: 1
  lacks_head: 1
  lacks_limbs: 1
  mr: 0
  name: trapper
  rarity: 2
  resist: {}
  size: huge
  sound: silent
  speed: 3
  weight: 800
troll:
  ac: 4
  alignment: -3
  always_hostile: 1
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
  color: brown
  corpse: {}
  corpse_nutrition: 350
  follows_stair_users: 1
  glyph: T
  has_infravision: 1
  hitdice: 7
  humanoid_body: 1
  infravision_detectable: 1
  is_carnivorous: 1
  is_genocidable: 1
  is_very_strong: 1
  mr: 0
  name: troll
  rarity: 2
  regenerates_quickly: 1
  resist: {}
  size: large
  sound: grunt
  speed: 12
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
  can_eat_rock: 1
  color: brown
  corpse: {}
  corpse_nutrition: 500
  glyph: U
  hitdice: 9
  infravision_detectable: 1
  is_carnivorous: 1
  is_genocidable: 1
  is_very_strong: 1
  mr: 25
  name: umber hulk
  rarity: 2
  resist: {}
  size: large
  sound: silent
  speed: 6
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
  color: white
  corpse: {}
  corpse_nutrition: 400
  glyph: '@'
  hitdice: 10
  humanoid_body: 1
  infravision_detectable: 1
  invalid_polymorph_target: 1
  is_always_female: 1
  is_carnivorous: 1
  is_herbivorous: 1
  is_human: 1
  is_very_strong: 1
  mr: 1
  name: valkyrie
  not_randomly_generated: 1
  resist:
    cold: 1
  size: human
  sound: humanoid
  speed: 12
  wants_wargear: 1
  weight: 1450
vampire:
  ac: 1
  alignment: -8
  always_hostile: 1
  attacks:
    - damage: 1d6
      mode: claw
      type: physical
    - damage: 1d6
      mode: bite
      type: drain
  can_fly: 1
  color: red
  corpse: {}
  corpse_nutrition: 400
  extra_nasty: 1
  follows_stair_users: 1
  glyph: V
  hitdice: 10
  humanoid_body: 1
  infravision_detectable: 1
  is_breathless: 1
  is_genocidable: 1
  is_undead: 1
  is_very_strong: 1
  mr: 25
  name: vampire
  never_drops_corpse: 1
  poisonous_corpse: 1
  rarity: 1
  regenerates_quickly: 1
  resist:
    poison: 1
    sleep: 1
  size: human
  sound: vampire
  speed: 12
  weight: 1450
vampire bat:
  ac: 6
  alignment: 0
  always_hostile: 1
  attacks:
    - damage: 1d6
      mode: bite
      type: physical
    - damage: 0d0
      mode: bite
      type: poison
  can_fly: 1
  color: black
  corpse: {}
  corpse_nutrition: 20
  glyph: B
  hitdice: 5
  infravision_detectable: 1
  is_animal: 1
  is_carnivorous: 1
  is_genocidable: 1
  is_herbivorous: 1
  lacks_hands: 1
  mr: 0
  name: vampire bat
  poisonous_corpse: 1
  rarity: 2
  regenerates_quickly: 1
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
  always_hostile: 1
  attacks:
    - damage: 1d8
      mode: claw
      type: physical
    - damage: 1d8
      mode: bite
      type: drain
  can_fly: 1
  color: blue
  corpse: {}
  corpse_nutrition: 400
  extra_nasty: 1
  follows_stair_users: 1
  glyph: V
  hitdice: 12
  humanoid_body: 1
  infravision_detectable: 1
  is_always_male: 1
  is_breathless: 1
  is_genocidable: 1
  is_rank_lord: 1
  is_undead: 1
  is_very_strong: 1
  mr: 50
  name: vampire lord
  never_drops_corpse: 1
  poisonous_corpse: 1
  rarity: 1
  regenerates_quickly: 1
  resist:
    poison: 1
    sleep: 1
  size: human
  sound: vampire
  speed: 14
  weight: 1450
violet fungus:
  ac: 7
  alignment: 0
  always_hostile: 1
  attacks:
    - damage: 1d4
      mode: touch
      type: physical
    - damage: 0d0
      mode: touch
      type: stick
  cannot_pickup_items: 1
  color: magenta
  corpse:
    poison: 1
  corpse_nutrition: 100
  glyph: F
  hitdice: 3
  is_breathless: 1
  is_genderless: 1
  is_genocidable: 1
  is_mindless: 1
  lacks_eyes: 1
  lacks_head: 1
  lacks_limbs: 1
  mr: 0
  name: violet fungus
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
  always_hostile: 1
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
  corpse_nutrition: 400
  extra_nasty: 1
  follows_stair_users: 1
  gehennom_exclusive: 1
  glyph: '&'
  has_infravision: 1
  hitdice: 8
  infravision_detectable: 1
  is_demon: 1
  mr: 50
  name: vrock
  never_drops_corpse: 1
  poisonous_corpse: 1
  rarity: 2
  resist:
    fire: 1
    poison: 1
  size: large
  small_group: 1
  sound: silent
  speed: 12
  weight: 1450
warg:
  ac: 4
  alignment: -5
  always_hostile: 1
  attacks:
    - damage: 2d6
      mode: bite
      type: physical
  color: brown
  corpse: {}
  corpse_nutrition: 350
  glyph: d
  hitdice: 7
  infravision_detectable: 1
  is_animal: 1
  is_carnivorous: 1
  is_genocidable: 1
  lacks_hands: 1
  mr: 0
  name: warg
  rarity: 2
  resist: {}
  size: medium
  small_group: 1
  sound: bark
  speed: 12
  weight: 850
warhorse:
  ac: 4
  alignment: 0
  attacks:
    - damage: 1d10
      mode: kick
      type: physical
    - damage: 1d4
      mode: bite
      type: physical
  color: brown
  corpse: {}
  corpse_nutrition: 350
  food_makes_peaceful: 1
  glyph: u
  hitdice: 7
  infravision_detectable: 1
  is_animal: 1
  is_genocidable: 1
  is_herbivorous: 1
  is_very_strong: 1
  is_wanderer: 1
  lacks_hands: 1
  mr: 0
  name: warhorse
  rarity: 2
  resist: {}
  size: large
  sound: neigh
  speed: 24
  weight: 1800
warrior:
  ac: 10
  alignment: -1
  always_peaceful: 1
  attacks:
    - damage: 1d8
      mode: weapon
      type: physical
    - damage: 1d8
      mode: weapon
      type: physical
  color: white
  corpse: {}
  corpse_nutrition: 400
  glyph: '@'
  hitdice: 5
  humanoid_body: 1
  infravision_detectable: 1
  invalid_polymorph_target: 1
  is_always_female: 1
  is_carnivorous: 1
  is_herbivorous: 1
  is_human: 1
  is_very_strong: 1
  mr: 10
  name: warrior
  not_randomly_generated: 1
  resist: {}
  size: human
  sound: guardian
  speed: 12
  wants_wargear: 1
  weight: 1450
watch captain:
  ac: 10
  alignment: -4
  always_peaceful: 1
  attacks:
    - damage: 3d4
      mode: weapon
      type: physical
    - damage: 3d4
      mode: weapon
      type: physical
  color: green
  corpse: {}
  corpse_nutrition: 400
  follows_stair_users: 1
  glyph: '@'
  hitdice: 10
  humanoid_body: 1
  infravision_detectable: 1
  invalid_polymorph_target: 1
  is_carnivorous: 1
  is_genocidable: 1
  is_herbivorous: 1
  is_human: 1
  is_mercenary: 1
  is_very_strong: 1
  mr: 15
  name: watch captain
  not_randomly_generated: 1
  rarity: 1
  resist: {}
  size: human
  sound: soldier
  speed: 10
  wants_wargear: 1
  weight: 1450
watchman:
  ac: 10
  alignment: -2
  always_peaceful: 1
  attacks:
    - damage: 1d8
      mode: weapon
      type: physical
  color: gray
  corpse: {}
  corpse_nutrition: 400
  follows_stair_users: 1
  glyph: '@'
  hitdice: 6
  humanoid_body: 1
  infravision_detectable: 1
  invalid_polymorph_target: 1
  is_carnivorous: 1
  is_genocidable: 1
  is_herbivorous: 1
  is_human: 1
  is_mercenary: 1
  is_very_strong: 1
  mr: 0
  name: watchman
  not_randomly_generated: 1
  rarity: 1
  resist: {}
  size: human
  small_group: 1
  sound: soldier
  speed: 10
  wants_wargear: 1
  weight: 1450
water demon:
  ac: -4
  alignment: -7
  always_hostile: 1
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
  can_swim: 1
  color: blue
  corpse: {}
  corpse_nutrition: 400
  extra_nasty: 1
  follows_stair_users: 1
  glyph: '&'
  has_infravision: 1
  hitdice: 8
  humanoid_body: 1
  infravision_detectable: 1
  invalid_polymorph_target: 1
  is_demon: 1
  mr: 30
  name: water demon
  never_drops_corpse: 1
  not_randomly_generated: 1
  poisonous_corpse: 1
  resist:
    fire: 1
    poison: 1
  size: human
  sound: djinni
  speed: 12
  wants_wargear: 1
  weight: 1450
water elemental:
  ac: 2
  alignment: 0
  attacks:
    - damage: 5d6
      mode: claw
      type: physical
  can_swim: 1
  color: blue
  corpse: {}
  glyph: E
  hitdice: 8
  is_amphibious: 1
  is_genderless: 1
  is_mindless: 1
  is_very_strong: 1
  lacks_eyes: 1
  lacks_head: 1
  lacks_limbs: 1
  mr: 30
  name: water elemental
  never_drops_corpse: 1
  nutrition: 0
  rarity: 1
  resist:
    poison: 1
    stone: 1
  size: huge
  sound: silent
  speed: 6
  weight: 2500
water moccasin:
  ac: 3
  alignment: 0
  always_hostile: 1
  attacks:
    - damage: 1d6
      mode: bite
      type: poison
  can_swim: 1
  cannot_pickup_items: 1
  color: red
  corpse:
    poison: 1
  corpse_nutrition: 80
  glyph: S
  hides_under_item: 1
  hitdice: 4
  is_animal: 1
  is_carnivorous: 1
  is_genocidable: 1
  lacks_limbs: 1
  large_group: 1
  lays_eggs: 1
  mr: 0
  name: water moccasin
  not_randomly_generated: 1
  poisonous_corpse: 1
  resist:
    poison: 1
  serpentine_body: 1
  size: small
  sound: hiss
  speed: 15
  weight: 150
water nymph:
  ac: 9
  alignment: 0
  always_hostile: 1
  attacks:
    - damage: 0d0
      mode: claw
      type: stealitem
    - damage: 0d0
      mode: claw
      type: seduce
  can_swim: 1
  color: blue
  corpse: {}
  corpse_nutrition: 300
  glyph: n
  has_teleportitis: 1
  hitdice: 3
  humanoid_body: 1
  infravision_detectable: 1
  is_always_female: 1
  is_genocidable: 1
  mr: 20
  name: water nymph
  rarity: 2
  resist: {}
  size: human
  sound: seduce
  speed: 12
  wants_wargear: 1
  weight: 600
water troll:
  ac: 4
  alignment: -3
  always_hostile: 1
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
  can_swim: 1
  color: blue
  corpse: {}
  corpse_nutrition: 350
  follows_stair_users: 1
  glyph: T
  has_infravision: 1
  hitdice: 11
  humanoid_body: 1
  infravision_detectable: 1
  is_carnivorous: 1
  is_genocidable: 1
  is_very_strong: 1
  mr: 40
  name: water troll
  not_randomly_generated: 1
  regenerates_quickly: 1
  resist: {}
  size: large
  sound: grunt
  speed: 14
  weight: 1200
werejackal:
  ac: 10
  alignment: -7
  always_hostile: 1
  attacks:
    - damage: 2d4
      mode: weapon
      type: physical
  color: red
  corpse: {}
  corpse_nutrition: 400
  glyph: '@'
  hitdice: 2
  humanoid_body: 1
  infravision_detectable: 1
  invalid_polymorph_target: 1
  is_carnivorous: 1
  is_herbivorous: 1
  is_human: 1
  is_lycanthrope: 1
  mr: 10
  name: werejackal
  poisonous_corpse: 1
  rarity: 1
  regenerates_quickly: 1
  resist:
    poison: 1
  size: human
  sound: were
  speed: 12
  wants_wargear: 1
  weight: 1450
wererat:
  ac: 10
  alignment: -7
  always_hostile: 1
  attacks:
    - damage: 2d4
      mode: weapon
      type: physical
  color: brown
  corpse: {}
  corpse_nutrition: 400
  glyph: '@'
  hitdice: 2
  humanoid_body: 1
  infravision_detectable: 1
  invalid_polymorph_target: 1
  is_carnivorous: 1
  is_herbivorous: 1
  is_human: 1
  is_lycanthrope: 1
  mr: 10
  name: wererat
  poisonous_corpse: 1
  rarity: 1
  regenerates_quickly: 1
  resist:
    poison: 1
  size: human
  sound: were
  speed: 12
  wants_wargear: 1
  weight: 1450
werewolf:
  ac: 10
  alignment: -7
  always_hostile: 1
  attacks:
    - damage: 2d4
      mode: weapon
      type: physical
  color: orange
  corpse: {}
  corpse_nutrition: 400
  glyph: '@'
  hitdice: 5
  humanoid_body: 1
  infravision_detectable: 1
  invalid_polymorph_target: 1
  is_carnivorous: 1
  is_herbivorous: 1
  is_human: 1
  is_lycanthrope: 1
  mr: 20
  name: werewolf
  poisonous_corpse: 1
  rarity: 1
  regenerates_quickly: 1
  resist:
    poison: 1
  size: human
  sound: were
  speed: 12
  wants_wargear: 1
  weight: 1450
white dragon:
  ac: -1
  alignment: -5
  always_hostile: 1
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
  can_fly: 1
  color: white
  corpse:
    cold: 1
  corpse_nutrition: 1500
  extra_nasty: 1
  glyph: D
  has_thick_hide: 1
  hitdice: 15
  is_carnivorous: 1
  is_genocidable: 1
  is_very_strong: 1
  lacks_hands: 1
  lays_eggs: 1
  mr: 20
  name: white dragon
  rarity: 1
  resist:
    cold: 1
  sees_invisible: 1
  size: gigantic
  sound: roar
  speed: 9
  wants_gems: 1
  wants_gold: 1
  wants_magic_items: 1
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
  corpse_nutrition: 300
  glyph: u
  hitdice: 4
  infravision_detectable: 1
  is_genocidable: 1
  is_herbivorous: 1
  is_very_strong: 1
  is_wanderer: 1
  lacks_hands: 1
  mr: 70
  name: white unicorn
  rarity: 2
  resist:
    poison: 1
  size: large
  sound: neigh
  speed: 24
  wants_gems: 1
  weight: 1300
winged gargoyle:
  ac: -2
  alignment: -12
  always_hostile: 1
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
  can_fly: 1
  color: magenta
  corpse:
    stone: 1
  corpse_nutrition: 300
  glyph: g
  has_thick_hide: 1
  hitdice: 9
  humanoid_body: 1
  is_breathless: 1
  is_genocidable: 1
  is_rank_lord: 1
  is_very_strong: 1
  lays_eggs: 1
  mr: 0
  name: winged gargoyle
  rarity: 1
  resist:
    stone: 1
  size: human
  sound: grunt
  speed: 15
  wants_magic_items: 1
  weight: 1200
winter wolf:
  absent_from_gehennom: 1
  ac: 4
  alignment: 0
  always_hostile: 1
  attacks:
    - damage: 2d6
      mode: bite
      type: physical
    - damage: 2d6
      mode: breathe
      type: cold
  color: cyan
  corpse:
    cold: 1
  corpse_nutrition: 300
  glyph: d
  hitdice: 7
  is_animal: 1
  is_carnivorous: 1
  is_genocidable: 1
  is_very_strong: 1
  lacks_hands: 1
  mr: 20
  name: winter wolf
  rarity: 1
  resist:
    cold: 1
  size: large
  sound: bark
  speed: 12
  weight: 700
winter wolf cub:
  absent_from_gehennom: 1
  ac: 4
  alignment: -5
  always_hostile: 1
  attacks:
    - damage: 1d8
      mode: bite
      type: physical
    - damage: 1d8
      mode: breathe
      type: cold
  color: cyan
  corpse:
    cold: 1
  corpse_nutrition: 200
  glyph: d
  hitdice: 5
  is_animal: 1
  is_carnivorous: 1
  is_genocidable: 1
  lacks_hands: 1
  mr: 0
  name: winter wolf cub
  rarity: 2
  resist:
    cold: 1
  size: small
  small_group: 1
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
  color: white
  corpse: {}
  corpse_nutrition: 400
  glyph: '@'
  hitdice: 10
  humanoid_body: 1
  infravision_detectable: 1
  invalid_polymorph_target: 1
  is_carnivorous: 1
  is_herbivorous: 1
  is_human: 1
  is_very_strong: 1
  mr: 3
  name: wizard
  not_randomly_generated: 1
  resist: {}
  size: human
  sound: humanoid
  speed: 12
  wants_magic_items: 1
  wants_wargear: 1
  weight: 1450
wolf:
  ac: 4
  alignment: 0
  always_hostile: 1
  attacks:
    - damage: 2d4
      mode: bite
      type: physical
  color: brown
  corpse: {}
  corpse_nutrition: 250
  glyph: d
  hitdice: 5
  infravision_detectable: 1
  is_animal: 1
  is_carnivorous: 1
  is_genocidable: 1
  lacks_hands: 1
  mr: 0
  name: wolf
  rarity: 2
  resist: {}
  size: medium
  small_group: 1
  sound: bark
  speed: 12
  weight: 500
wood golem:
  ac: 4
  alignment: 0
  always_hostile: 1
  attacks:
    - damage: 3d4
      mode: claw
      type: physical
  color: brown
  corpse: {}
  glyph: "'"
  has_thick_hide: 1
  hitdice: 7
  humanoid_body: 1
  is_breathless: 1
  is_genderless: 1
  is_mindless: 1
  mr: 0
  name: wood golem
  never_drops_corpse: 1
  nutrition: 0
  rarity: 1
  resist:
    poison: 1
    sleep: 1
  size: large
  sound: silent
  speed: 3
  weight: 900
wood nymph:
  ac: 9
  alignment: 0
  always_hostile: 1
  attacks:
    - damage: 0d0
      mode: claw
      type: stealitem
    - damage: 0d0
      mode: claw
      type: seduce
  color: green
  corpse: {}
  corpse_nutrition: 300
  glyph: n
  has_teleportitis: 1
  hitdice: 3
  humanoid_body: 1
  infravision_detectable: 1
  is_always_female: 1
  is_genocidable: 1
  mr: 20
  name: wood nymph
  rarity: 2
  resist: {}
  size: human
  sound: seduce
  speed: 12
  wants_wargear: 1
  weight: 600
woodchuck:
  ac: 0
  alignment: 0
  always_hostile: 1
  attacks:
    - damage: 1d6
      mode: bite
      type: physical
  can_eat_rock: 1
  can_swim: 1
  color: brown
  corpse: {}
  corpse_nutrition: 30
  glyph: r
  hitdice: 3
  infravision_detectable: 1
  is_animal: 1
  is_genocidable: 1
  is_herbivorous: 1
  is_wanderer: 1
  lacks_hands: 1
  mr: 20
  name: woodchuck
  not_randomly_generated: 1
  resist: {}
  size: small
  sound: silent
  speed: 3
  weight: 30
wraith:
  ac: 4
  alignment: -6
  always_hostile: 1
  attacks:
    - damage: 1d6
      mode: touch
      type: drain
  can_fly: 1
  color: black
  corpse: {}
  follows_stair_users: 1
  glyph: W
  hitdice: 6
  humanoid_body: 1
  is_breathless: 1
  is_genocidable: 1
  is_undead: 1
  made_of_gas: 1
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
  weight: 0
wumpus:
  ac: 2
  alignment: 0
  always_hostile: 1
  attacks:
    - damage: 3d6
      mode: bite
      type: physical
  clings_to_ceiling: 1
  color: cyan
  corpse: {}
  corpse_nutrition: 500
  glyph: q
  hitdice: 8
  infravision_detectable: 1
  is_animal: 1
  is_carnivorous: 1
  is_genocidable: 1
  is_herbivorous: 1
  is_very_strong: 1
  lacks_hands: 1
  mr: 10
  name: wumpus
  rarity: 1
  resist: {}
  size: large
  sound: burble
  speed: 3
  weight: 2500
xan:
  ac: -4
  alignment: 0
  always_hostile: 1
  attacks:
    - damage: 1d4
      mode: sting
      type: legs
  can_fly: 1
  color: red
  corpse:
    poison: 1
  corpse_nutrition: 300
  glyph: x
  hitdice: 7
  infravision_detectable: 1
  is_animal: 1
  is_genocidable: 1
  lacks_hands: 1
  mr: 0
  name: xan
  poisonous_corpse: 1
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
  always_hostile: 1
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
  can_eat_metal: 1
  color: brown
  corpse:
    stone: 1
  corpse_nutrition: 700
  glyph: X
  has_thick_hide: 1
  hitdice: 8
  ignores_walls: 1
  is_breathless: 1
  is_genocidable: 1
  is_very_strong: 1
  mr: 20
  name: xorn
  rarity: 1
  resist:
    cold: 1
    fire: 1
    stone: 1
  size: medium
  sound: roar
  speed: 9
  weight: 1200
yellow dragon:
  ac: -1
  acidic_corpse: 1
  alignment: 7
  always_hostile: 1
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
  can_fly: 1
  color: yellow
  corpse:
    stone: 1
  corpse_nutrition: 1500
  extra_nasty: 1
  glyph: D
  has_thick_hide: 1
  hitdice: 15
  is_carnivorous: 1
  is_genocidable: 1
  is_very_strong: 1
  lacks_hands: 1
  lays_eggs: 1
  mr: 20
  name: yellow dragon
  rarity: 1
  resist:
    acid: 1
    stone: 1
  sees_invisible: 1
  size: gigantic
  sound: roar
  speed: 9
  wants_gems: 1
  wants_gold: 1
  wants_magic_items: 1
  weight: 4500
yellow light:
  ac: 0
  alignment: 0
  always_hostile: 1
  attacks:
    - damage: 10d20
      mode: explode
      type: blind
  can_fly: 1
  cannot_pickup_items: 1
  color: yellow
  corpse: {}
  glyph: y
  hitdice: 3
  infravision_detectable: 1
  is_amorphous: 1
  is_breathless: 1
  is_genderless: 1
  is_genocidable: 1
  is_mindless: 1
  lacks_eyes: 1
  lacks_head: 1
  lacks_limbs: 1
  made_of_gas: 1
  mr: 0
  name: yellow light
  never_drops_corpse: 1
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
  weight: 0
yellow mold:
  ac: 9
  alignment: 0
  always_hostile: 1
  attacks:
    - damage: 0d4
      mode: passive
      type: stun
  cannot_pickup_items: 1
  color: yellow
  corpse:
    poison: 1
  corpse_nutrition: 30
  glyph: F
  hitdice: 1
  is_breathless: 1
  is_genderless: 1
  is_genocidable: 1
  is_mindless: 1
  lacks_eyes: 1
  lacks_head: 1
  lacks_limbs: 1
  mr: 0
  name: yellow mold
  poisonous_corpse: 1
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
  always_hostile: 1
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
  color: white
  corpse:
    cold: 1
  corpse_nutrition: 700
  glyph: Y
  hitdice: 5
  humanoid_body: 1
  infravision_detectable: 1
  is_animal: 1
  is_carnivorous: 1
  is_genocidable: 1
  is_very_strong: 1
  mr: 0
  name: yeti
  rarity: 2
  resist:
    cold: 1
  size: large
  sound: growl
  speed: 15
  weight: 1600
zruty:
  ac: 3
  alignment: 0
  always_hostile: 1
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
  color: brown
  corpse: {}
  corpse_nutrition: 600
  glyph: z
  hitdice: 9
  humanoid_body: 1
  infravision_detectable: 1
  is_animal: 1
  is_carnivorous: 1
  is_genocidable: 1
  is_very_strong: 1
  mr: 0
  name: zruty
  rarity: 2
  resist: {}
  size: large
  sound: silent
  speed: 8
  weight: 1200
