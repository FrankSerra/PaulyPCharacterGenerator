# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Race.create!([
	{name: 'Race 1'},
	{name: 'Race 2'},
	{name: 'Race 3'},
	{name: 'Race 4'},
	{name: 'Race 5'},
	{name: 'Race 6'},
	{name: 'Race 7'},
	{name: 'Race 8'},
	{name: 'Race 9'},
	{name: 'Race 10'}
	])

Stat.create!([
	{name: 'Strength', minval: 1, maxval: 6},
	{name: 'Agility', minval: 1, maxval: 6},
	{name: 'Perception', minval: 1, maxval: 6}
	])

ArmorType.create!([
	{name: 'Light'},
	{name: 'Medium'},
	{name: 'Heavy'},
	{name: 'Mixed'},
	{name: 'Armorless'}
	])

Element.create!([
	{name: 'Fire'},
	{name: 'Water'},
	{name: 'Earth'},
	{name: 'Wind'}
	])

Modifier.create!([
	{name: 'Greater', replacewithshape: false},
	{name: 'Lesser', replacewithshape: false},
	{name: 'Twin', replacewithshape: false},
	{name: 'Bouncing', replacewithshape: false},
	{name: 'Enhanced', replacewithshape: false},
	{name: 'Efficient', replacewithshape: false},
	{name: 'Chaotic', replacewithshape: false},
	{name: 'Split', replacewithshape: false},
	{name: 'Substitute: Shape', replacewithshape: true}
	])

Shape.create!([
	{name: 'Passive', 			afterelement:false, ordering: 1},
	{name: 'Summon', 				afterelement:false, ordering: 2},
	{name: 'Single-target', afterelement:false, ordering: 3},
	{name: 'Enchantment', 	afterelement:true,  ordering: 4},
	{name: 'Pillar', 				afterelement:true,  ordering: 5},
	{name: 'Wall', 					afterelement:true,  ordering: 6},
	{name: 'Nova', 					afterelement:true,  ordering: 7},
	{name: 'Pool', 					afterelement:true,  ordering: 8},
	{name: 'Projectile', 		afterelement:true,  ordering: 9}
	])

CharConfig.create!([
	{statlinemax: 12, elementdoublepct:50}
	])

o_m_1h  = OffenseType.create!({name: '1-Hand Melee', numberofweapons: 1})
o_m_2h  = OffenseType.create!({name: '2-Hand Melee', numberofweapons: 1})
o_m_s   = OffenseType.create!({name: '1-Hand Melee with Shield', numberofweapons: 1})
o_m_dw  = OffenseType.create!({name: 'Dual-Wield Melee', numberofweapons: 2})
o_r_bow = OffenseType.create!({name: 'Bow', numberofweapons: 1})
o_r_cb  = OffenseType.create!({name: 'Crossbow', numberofweapons: 1})
o_r_1h  = OffenseType.create!({name: '1-Hand Firearm', numberofweapons: 1})
o_r_2h  = OffenseType.create!({name: '2-Hand Firearm', numberofweapons: 1})
o_r_dw  = OffenseType.create!({name: 'Dual-Wield Firearm', numberofweapons: 2})
o_r_th  = OffenseType.create!({name: 'Thrown Weapon', numberofweapons: 1})
o_none  = OffenseType.create!({name: 'Unarmed', numberofweapons: 0})

stamina = Resource.create!({name: 'Stamina', baseval: 2, generatespell: false, addstatline: true, subtractstatline: false})
  focus = Resource.create!({name: 'Focus',   baseval: 2, generatespell: false, addstatline: true, subtractstatline: false})
	 mana = Resource.create!({name: 'Mana',    baseval: 2, generatespell: true,  addstatline: true, subtractstatline: false})

ResourceLoadoutCombo.create!([
	{resource_id: stamina.id, offense_type_id: o_m_1h.id},
	{resource_id: stamina.id, offense_type_id: o_m_2h.id},
	{resource_id: stamina.id, offense_type_id: o_m_s.id},
	{resource_id: stamina.id, offense_type_id: o_m_dw.id},
	{resource_id: stamina.id, offense_type_id: o_none.id},

	{resource_id: focus.id, offense_type_id: o_r_bow.id},
	{resource_id: focus.id, offense_type_id: o_r_cb.id},
	{resource_id: focus.id, offense_type_id: o_r_1h.id},
	{resource_id: focus.id, offense_type_id: o_r_2h.id},
	{resource_id: focus.id, offense_type_id: o_r_dw.id},
	{resource_id: focus.id, offense_type_id: o_r_th.id}

	#nothing for focus, they only get their spell
	])


	   axe = Weapon.create!({name: 'Axe'})
    mace = Weapon.create!({name: 'Mace'})
	shield = Weapon.create!({name: 'Shield'})
   spear = Weapon.create!({name: 'Spear'})
	 sword = Weapon.create!({name: 'Sword'})

	   bow = Weapon.create!({name: 'Bow'})
crossbow = Weapon.create!({name: 'Crossbow'})
  dagger = Weapon.create!({name: 'Dagger'})
	pistol = Weapon.create!({name: 'Pistol'})
	 rifle = Weapon.create!({name: 'Rifle'})

WeaponOffenseTypeCombo.create!([
	{alwayspick: false, weapon_id: axe.id, offense_type_id: o_m_1h.id},
	{alwayspick: false, weapon_id: axe.id, offense_type_id: o_m_2h.id},
	{alwayspick: false, weapon_id: axe.id, offense_type_id: o_m_s.id},
	{alwayspick: false, weapon_id: axe.id, offense_type_id: o_m_dw.id},
	{alwayspick: false, weapon_id: axe.id, offense_type_id: o_r_th.id},

	{alwayspick: false, weapon_id: mace.id, offense_type_id: o_m_1h.id},
	{alwayspick: false, weapon_id: mace.id, offense_type_id: o_m_2h.id},
	{alwayspick: false, weapon_id: mace.id, offense_type_id: o_m_s.id},
	{alwayspick: false, weapon_id: mace.id, offense_type_id: o_m_dw.id},

	{alwayspick: false, weapon_id: spear.id, offense_type_id: o_m_1h.id},
	{alwayspick: false, weapon_id: spear.id, offense_type_id: o_m_2h.id},
	{alwayspick: false, weapon_id: spear.id, offense_type_id: o_m_s.id},
	{alwayspick: false, weapon_id: spear.id, offense_type_id: o_r_th.id},

	{alwayspick: false, weapon_id: sword.id, offense_type_id: o_m_1h.id},
	{alwayspick: false, weapon_id: sword.id, offense_type_id: o_m_2h.id},
	{alwayspick: false, weapon_id: sword.id, offense_type_id: o_m_s.id},
	{alwayspick: false, weapon_id: sword.id, offense_type_id: o_m_dw.id},

	{alwayspick: true,  weapon_id: shield.id, offense_type_id: o_m_s.id},

	{alwayspick: false, weapon_id: bow.id, offense_type_id: o_r_bow.id},

	{alwayspick: false, weapon_id: crossbow.id, offense_type_id: o_r_cb.id},

	{alwayspick: false, weapon_id: dagger.id, offense_type_id: o_r_th.id},

	{alwayspick: false, weapon_id: pistol.id, offense_type_id: o_r_1h.id},
	{alwayspick: false, weapon_id: pistol.id, offense_type_id: o_r_dw.id},

	{alwayspick: false, weapon_id: rifle.id, offense_type_id: o_r_2h.id}
	])
