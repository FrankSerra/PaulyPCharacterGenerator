class CreateResourceLoadoutCombos < ActiveRecord::Migration[5.2]
  def change
    create_table :resource_loadout_combos do |t|
      t.references :resource, foreign_key: true
      t.references :offense_type, foreign_key: true

      t.timestamps
    end
  end
end
