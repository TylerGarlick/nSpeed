class AddMaterialListToMaterial < ActiveRecord::Migration
  def change
    add_column :materials, :material_list_id, :integer
  end
end
