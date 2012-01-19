class CreateMaterialDocuments < ActiveRecord::Migration
  def change
    create_table :material_documents do |t|
      t.integer :document_id
      t.integer :material_id

      t.timestamps
    end
  end
end
