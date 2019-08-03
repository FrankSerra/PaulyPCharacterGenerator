class CreateResources < ActiveRecord::Migration[5.2]
  def change
    create_table :resources do |t|
      t.string :name
      t.integer :baseval
      t.boolean :addstatline
      t.boolean :subtractstatline

      t.timestamps
    end
  end
end
