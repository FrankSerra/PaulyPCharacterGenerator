class CreateArmorTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :armor_types do |t|
      t.string :name

      t.timestamps
    end
  end
end
