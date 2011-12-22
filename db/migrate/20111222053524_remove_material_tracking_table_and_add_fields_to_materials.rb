class RemoveMaterialTrackingTableAndAddFieldsToMaterials < ActiveRecord::Migration
  def change
    drop_table :material_tracking_items
    drop_table :material_trackings

    remove_column :materials, :company_id
    remove_column :materials, :n_number
    remove_column :materials, :ancestry

    add_column :materials, :project_id, :integer
    add_column :materials, :document_id, :integer
    add_column :materials, :item_number, :integer
    add_column :materials, :quantity, :integer
    add_column :materials, :vendor, :string
    add_column :materials, :description, :text
    add_column :materials, :astm_number, :string
    add_column :materials, :material_tracking_number, :string

  end
end
