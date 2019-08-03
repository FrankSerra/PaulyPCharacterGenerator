class AddMaxvalToResources < ActiveRecord::Migration[5.2]
  def change
    add_column :resources, :maxval, :integer
  end
end
