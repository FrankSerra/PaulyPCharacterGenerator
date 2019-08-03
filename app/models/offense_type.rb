class OffenseType < ApplicationRecord
  has_many :weaponoffensetypecombos, :class_name => 'WeaponOffenseTypeCombo'
  has_many :weapons, :class_name => 'Weapon', through: :weaponoffensetypecombos, :class_name => 'WeaponOffenseTypeCombo'

  def weapon_ids
    a = []
    weaponoffensetypecombos.each do |c|
      a << c.weapon_id
    end
    return a
  end
end
