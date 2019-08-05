class AddShortnameToStats < ActiveRecord::Migration[5.2]
  def change
    add_column :stats, :shortname, :string
  end
end
