class CreateOffenseTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :offense_types do |t|
      t.string :name
      t.integer :numberofweapons

      t.timestamps
    end
  end
end
