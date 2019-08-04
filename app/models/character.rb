class Character
  attr_accessor :race
  attr_accessor :stats
  attr_accessor :resourcename
  attr_accessor :resourcevalue
  attr_accessor :style
  attr_accessor :loadout
  attr_accessor :armor
  attr_accessor :spell

  def choose_config
    #Config
    @config = CharConfig.all.first
  end

  def choose_race
    @race = Race.limit(1).order("RANDOM()").first().name
  end

  def choose_armor
    @armor = ArmorType.limit(1).order("RANDOM()").first().name
  end

  def choose_stats
    stats = Stat.all
    statline = {}
    @statline_total = 0

    loop do
      statline_okay = true
      statline = {}
      @statline_total = 0
      stats.each do |stat|
        roll = rand(stat.minval..stat.maxval)
        statline[stat.name] = roll.to_s
        @statline_total += roll
        if(@statline_total > @config.statlinemax)
          statline_okay = false
        end
      end
      stats.reset
    break if statline_okay == true
    end

    @stats = statline
  end

  def choose_resource
    resource = Resource.limit(1).order("RANDOM()").first
    @resource_id = resource.id.to_s
    @generatespell = (resource.generatespell == true)
    resource_pool = resource.baseval
    statexcess = (@config.statlinemax - @statline_total)
    if resource.addstatline #base add statline
      resource_pool += statexcess
    elsif resource.subtractstatline #base minus statline
      resource_pool -= statexcess
    end

    if resource.minval != 0 && resource_pool < resource.minval
      resource_pool = resource.minval
    elsif resource.maxval != 0 && resource_pool > resource.maxval
      resource_pool = resource.maxval
    end


    @resourcename  = resource.name
    @resourcevalue = resource_pool.to_s
  end

  def choose_style
    @style = OffenseType.joins(:resourceloadoutcombos).where(resource_loadout_combos: {resource_id: @resource_id}).limit(1).order("RANDOM()").first
  end

  def choose_weapons
    if @style
      mandatory_weapons = Weapon.joins(:weaponoffensetypecombos).where(weapon_offense_type_combos: {alwayspick: 1, offense_type_id: @style.id})
      weapons = Weapon.joins(:weaponoffensetypecombos).where(weapon_offense_type_combos: {alwayspick: 0, offense_type_id: @style.id}).limit(@style.numberofweapons).order("RANDOM()")

      loadout = []
      mandatory_weapons.each do |w|
        loadout.append(w.name)
      end

      weapons.each do |w|
        loadout.append(w.name)
      end

      if loadout.count < @style.numberofweapons
        loadout.append(loadout[-1])
      end
      @loadout = loadout
    end
  end

  def choose_spell
    spell = ''
    #if Resource generates a spell
    if @generatespell == true
      number_shapes = 1

    #Modifier, then check if we get 2 shapes instead
      modifier = Modifier.limit(1).order("RANDOM()").first
      if modifier.replacewithshape == true
        number_shapes += 1
      else
        spell += modifier.name + ' '
      end

    #Shape
      shape_after_text = ''
      shapes = Shape.limit(number_shapes).order("RANDOM()")

      shapes.each do |shape|
        puts shape.afterelement
        if shape.afterelement == false
          spell += shape.name
          spell += ' '
        else
          shape_after_text += shape.name
          shape_after_text += ' '
        end
      end

    #Elements
      number_elements = 1

      #roll chance of double elements
      if rand(1..100) <= @config.elementdoublepct
        number_elements += 1
      end

      element_text = ''
      element_combo_hash = ''
      number_elements.times do
        element = Element.limit(1).order("RANDOM()").first
        if element_text != ''
          element_text += '+'
        end
        if number_elements > 1
          if element_combo_hash != ''
            element_combo_hash += '$'
          end
          element_combo_hash += element.id.to_s.rjust(3, '0')
        end
        element_text += element.name
      end

      if number_elements > 1 && @config.useelementmath == true
        hash1 = element_combo_hash
        hash2 = element_combo_hash.split('$')[1] + '$' + element_combo_hash.split('$')[0]
        element_upgrade = ElementUpgrade.where(combohash: hash1).or(ElementUpgrade.where(combohash: hash2)).limit(1).first
        spell += element_upgrade.name != '' ? element_upgrade.name : element_text
      else
        spell += element_text
      end

      if shape_after_text != ''
        spell += ' ' + shape_after_text
      end
    end
    @spell = spell
  end

  def output
    pad = 10
    sep = "\n"
    frame = "----------------------------------------"
    out = frame + sep

    out += ('Race'.rjust(pad) + ': ' + @race + sep)
    out += ('Armor'.rjust(pad) + ': ' + @armor + sep + sep)

    @stats.each do |k,v|
      out += (k.rjust(pad) + ": " + v + sep)
    end

    out += (sep + @resourcename.rjust(pad) + ': ' + @resourcevalue + sep)

    if @loadout != nil
      out += ('Loadout'.rjust(pad) + ': ' + @style.name)
      if @loadout.count > 0
        out += ' (' + @loadout.join(', ') + ')'
      end
      out += (sep + sep)
    end

    if @spell != ''
      out += ('Spell'.rjust(pad) + ': ' + @spell + sep + sep)
    end

    out += frame
    return out
  end

  def initialize
    choose_config()
    choose_race()
    choose_stats()
    choose_resource()
    choose_armor()
    choose_style()
    choose_weapons()
    choose_spell()

    #Ability
    #not implemented yet
  end
end
