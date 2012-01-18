class AddMaterialTypeToMaterial < ActiveRecord::Migration
  def change
    add_column :materials, :material_type_id, :integer
  end
end
