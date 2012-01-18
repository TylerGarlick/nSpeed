class AddDocumentTypeToDocument < ActiveRecord::Migration
  def change
    add_column :documents, :document_type_id, :integer
  end
end
