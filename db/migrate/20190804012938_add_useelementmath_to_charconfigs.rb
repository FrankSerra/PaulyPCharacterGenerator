class AddUseelementmathToCharconfigs < ActiveRecord::Migration[5.2]
  def change
    add_column :char_configs, :useelementmath, :boolean
  end
end
