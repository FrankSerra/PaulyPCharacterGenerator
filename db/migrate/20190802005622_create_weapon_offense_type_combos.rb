class CreateWeaponOffenseTypeCombos < ActiveRecord::Migration[5.2]
  def change
    create_table :weapon_offense_type_combos do |t|
      t.boolean :alwayspick
      t.references :weapon, foreign_key: true
      t.references :offense_type, foreign_key: true

      t.timestamps
    end
  end
end
