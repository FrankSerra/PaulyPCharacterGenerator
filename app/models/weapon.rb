class Weapon < ApplicationRecord
  has_many :weaponoffensetypecombos, :class_name => 'WeaponOffenseTypeCombo'
  has_many :offense_types, :class_name => 'OffenseType', through: :weaponoffensetypecombos, :class_name => 'WeaponOffenseTypeCombo'

  def style_ids
    a = []
    weaponoffensetypecombos.each do |c|
      a << c.offense_type_id
    end
    return a
  end
end
