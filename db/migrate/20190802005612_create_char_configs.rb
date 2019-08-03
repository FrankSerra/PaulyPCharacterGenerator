class CreateCharConfigs < ActiveRecord::Migration[5.2]
  def change
    create_table :char_configs do |t|
      t.integer :statlinemax
      t.integer :elementdoublepct

      t.timestamps
    end
  end
end
