require 'sqlite3'

class Character
  attr_accessor :race
  attr_accessor :stats
  attr_accessor :resourcename
  attr_accessor :resourcevalue
  attr_accessor :style
  attr_accessor :loadout
  attr_accessor :armor
  attr_accessor :spell

  def output
    pad = 10
    sep = "\n"
    out = "----------" + sep

    out += ('Race'.rjust(pad) + ': ' + @race + sep)
    out += ('Armor'.rjust(pad) + ': ' + @armor + sep + sep)

    @stats.each do |k,v|
      out += (k.rjust(pad) + ": " + v + sep)
    end

    out += (sep + @resourcename.rjust(pad) + ': ' + @resourcevalue + sep)

    if @loadout != nil
      out += ('Loadout'.rjust(pad) + ': ' + @style)
      if @loadout.count > 0
        out += ' (' + @loadout.join(', ') + ')'
      end
      out += (sep + sep)
    end

    if @spell != ''
      out += ('Spell'.rjust(pad) + ': ' + @spell + sep + sep)
    end

    out += '----------'
    return out
  end
end

char = Character.new()

db = SQLite3::Database.open 'db/development.sqlite3'

#Config
config = (db.query 'SELECT statlinemax, elementdoublepct FROM char_configs LIMIT 1').next

#Race
race = (db.query 'SELECT ID, NAME from races ORDER BY RANDOM() LIMIT 1').next
char.race = race[1]

#Stats
stats = db.query 'SELECT ID, NAME, MINVAL, MAXVAL from stats ORDER BY ID'
statline = {}
statline_total = 0

loop do
  statline_okay = true
  statline = {}
  statline_total = 0
  stats.each do |stat|
    roll = rand(stat[2]..stat[3])
    statline[stat[1]] = roll.to_s
    statline_total += roll
    if(statline_total > config[0])
      statline_okay = false
    end
  end
  stats.reset
break if statline_okay == true
end

char.stats = statline

#Choose and calculate resource
resource = (db.query 'SELECT ID, NAME, BASEVAL, ADDSTATLINE, SUBTRACTSTATLINE, GENERATESPELL from resources ORDER BY RANDOM() LIMIT 1').next
resource_pool = resource[2]
statexcess = (config[0] - statline_total)
if resource[3] #base add statline
  resource_pool += statexcess
  if resource_pool < resource[2]
    resource_pool = resource[2]
  end
elsif resource[4] #base minus statline
  resource_pool -= statexcess
  if resource_pool > resource[2]
    resource_pool = resource[2]
  end
end

char.resourcename  = resource[1]
char.resourcevalue = resource_pool.to_s

#Style
style = (db.query 'SELECT offense_types.ID, offense_types.NAME, offense_types.NUMBEROFWEAPONS from offense_types INNER JOIN resource_loadout_combos ON offense_types.ID = resource_loadout_combos.offense_type_id AND resource_loadout_combos.resource_id = ' + resource[0].to_s + ' ORDER BY RANDOM() LIMIT 1').next
if style != nil
  char.style = style[1]
end

#Weapons
if style != nil
  mandatory_weapons = db.query 'SELECT weapons.ID, weapons.NAME from weapons INNER JOIN weapon_offense_type_combos ON weapon_offense_type_combos.alwayspick = 1 AND weapon_offense_type_combos.weapon_id = weapons.id AND weapon_offense_type_combos.offense_type_id = ' + style[0].to_s
  weapons = db.query 'SELECT weapons.ID, weapons.NAME from weapons INNER JOIN weapon_offense_type_combos ON weapon_offense_type_combos.weapon_id = weapons.id AND weapon_offense_type_combos.offense_type_id = ' + style[0].to_s + ' ORDER BY RANDOM() LIMIT ' + style[2].to_s

  loadout = []
  mandatory_weapons.each do |w|
    loadout.append(w[1])
  end
  weapons.each do |w|
    loadout.append(w[1])
  end

  if loadout.count < style[2]
    loadout.append(loadout[-1])
  end

  char.loadout = loadout
end

#Armor
armor = (db.query 'SELECT ID, NAME from armor_types ORDER BY RANDOM() LIMIT 1').next
char.armor = armor[1]

#Spell
spell = ''
  #if Resource generates a spell
  if resource[5] == 1
    number_shapes = 1

#Modifier, then check if we get 2 shapes instead
  modifier = (db.query 'SELECT ID, NAME, REPLACEWITHSHAPE from modifiers ORDER BY RANDOM() LIMIT 1').next
  if modifier[2] == 1
    number_shapes += 1
  else
    spell += modifier[1] + ' '
  end

#Shape
  shape_after_text = ''
  shapes = db.query 'SELECT ID, NAME, AFTERELEMENT from shapes ORDER BY RANDOM(), ORDERING LIMIT '+number_shapes.to_s

  shapes.each do |shape|
    if shape[2] == 0
      spell += shape[1]
      spell += ' '
    else
      shape_after_text += shape[1]
      shape_after_text += ' '
    end
  end

#Elements
  number_elements = 1

  #roll chance of double elements
  if rand(1..100) <= config[1]
    number_elements += 1
  end

  element_text = ''
  number_elements.times do
    element = (db.query 'SELECT ID, NAME from elements ORDER BY RANDOM() LIMIT 1').next
    if element_text != ''
      element_text += '+'
    end
    element_text += element[1]
  end

  spell += element_text

  if shape_after_text != ''
    spell += ' ' + shape_after_text
  end
end
char.spell = spell

#Ability
#not implemented yet

puts char.output
