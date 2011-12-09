class CreateSubmittalDocuments < ActiveRecord::Migration
  def change
    create_table :submittal_documents do |t|
      t.integer :submittal_id
      t.integer :document_id

      t.timestamps
    end
  end
end
