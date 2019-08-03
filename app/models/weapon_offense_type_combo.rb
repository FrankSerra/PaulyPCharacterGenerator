class WeaponOffenseTypeCombo < ApplicationRecord
  belongs_to :weapon, :class_name => 'Weapon'
  belongs_to :offense_type, :class_name => 'OffenseType'
  validates :weapon_id, uniqueness: {scope: :offense_type_id}
  validates :offense_type_id, uniqueness: {scope: :weapon_id}

  def pick(sayno=true)
    return (alwayspick == true ? 'Yes' : (sayno == true ? 'No' : '-'))
  end

  def self.label
    return Weapon.label + '-' + OffenseType.label + ' pairing'
  end
end
