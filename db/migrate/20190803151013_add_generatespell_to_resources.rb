class AddGeneratespellToResources < ActiveRecord::Migration[5.2]
  def change
    add_column :resources, :generatespell, :boolean
  end
end
