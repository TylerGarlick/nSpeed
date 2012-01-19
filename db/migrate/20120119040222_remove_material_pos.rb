class RemoveMaterialPos < ActiveRecord::Migration
  def up
    drop_table :material_pos
    add_column :document_assets, :user_id, :integer
    add_column :material_documents, :quantity_ordered, :integer
    add_column :material_documents, :quantity_received, :integer

  end

  def down
    remove_column :document_assets, :user_id
    remove_column :material_documents, :quantity_ordered
    remove_column :material_documents, :quantity_received
  end
end
