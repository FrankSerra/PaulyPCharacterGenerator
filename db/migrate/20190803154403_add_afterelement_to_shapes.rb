class AddAfterelementToShapes < ActiveRecord::Migration[5.2]
  def change
    add_column :shapes, :afterelement, :boolean
  end
end
