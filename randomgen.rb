require 'sqlite3'

db = SQLite3::Database.open 'db/development.sqlite3'

#Config
config = (db.query 'SELECT statlinemax, elementdoublepct FROM char_configs LIMIT 1').next

#Race
race = (db.query 'SELECT ID, NAME from races ORDER BY RANDOM() LIMIT 1').next
puts "Race: " + race[1]

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

puts statline

#Choose and calculate resource
resource = (db.query 'SELECT ID, NAME, BASEVAL, ADDSTATLINE, SUBTRACTSTATLINE from resources ORDER BY RANDOM() LIMIT 1').next
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

puts resource[1] + ": " + resource_pool.to_s

#Style
style = (db.query 'SELECT ID, NAME, NUMBEROFWEAPONS from offense_types ORDER BY RANDOM() LIMIT 1').next
puts "Style: " + style[1]

#Weapons
mandatory_weapons = db.query 'SELECT weapons.ID, weapons.NAME from weapons INNER JOIN weapon_offense_type_combos ON weapon_offense_type_combos.alwayspick = 1 AND weapon_offense_type_combos.weapon_id = weapons.id AND weapon_offense_type_combos.offense_type_id = ' + style[0].to_s
weapons = db.query 'SELECT weapons.ID, weapons.NAME from weapons INNER JOIN weapon_offense_type_combos ON weapon_offense_type_combos.weapon_id = weapons.id AND weapon_offense_type_combos.offense_type_id = ' + style[0].to_s + ' ORDER BY RANDOM() LIMIT ' + style[2].to_s

loadout = []
mandatory_weapons.each do |w|
  loadout.append(w[1])
end
weapons.each do |w|
  loadout.append(w[1])
end

puts "Weapons: " + loadout.join(', ')
#Armor

#Spell

#Ability
