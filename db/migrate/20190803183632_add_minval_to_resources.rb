class AddMinvalToResources < ActiveRecord::Migration[5.2]
  def change
    add_column :resources, :minval, :integer
  end
end
