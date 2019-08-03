class OffenseType < ApplicationRecord
  validates :name, uniqueness: true
  has_many :weaponoffensetypecombos, :class_name => 'WeaponOffenseTypeCombo'
  has_many :resourceloadoutcombos, :class_name => 'ResourceLoadoutCombo'
  has_many :weapons, :class_name => 'Weapon', through: :weaponoffensetypecombos, :class_name => 'WeaponOffenseTypeCombo'
  has_many :resources, :class_name => 'OffenseType', through: :resourceloadoutcombos, :class_name => 'ResourceLoadoutCombo'

  def weapon_ids
    a = []
    weaponoffensetypecombos.each do |c|
      a << c.weapon_id
    end
    return a
  end

  def self.label
    return 'Style'
  end
end
