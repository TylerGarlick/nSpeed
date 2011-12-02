class CreateDocumentAssets < ActiveRecord::Migration
  def change
    create_table :document_assets do |t|
      t.integer :document_id
      t.string :asset_url

      t.timestamps
    end
  end
end
