class AddTypeToDocument < ActiveRecord::Migration
  def change
    add_column :documents, :document_type, :string
    remove_column :documents, :document_type_id
    drop_table :document_types
  end
end
