class CreateStats < ActiveRecord::Migration[5.2]
  def change
    create_table :stats do |t|
      t.string :name
      t.integer :minval
      t.integer :maxval

      t.timestamps
    end
  end
end
