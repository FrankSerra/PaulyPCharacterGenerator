class CreateElementUpgrades < ActiveRecord::Migration[5.2]
  def change
    create_table :element_upgrades do |t|
      t.string :combohash
      t.string :name

      t.timestamps
    end
  end
end
