class WeaponOffenseTypeCombo < ApplicationRecord
  belongs_to :weapon, :class_name => 'Weapon'
  belongs_to :offense_type, :class_name => 'OffenseType'

  def pick
    return (alwayspick == true ? 'Yes' : 'No')
  end
end
