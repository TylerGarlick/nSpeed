class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.string :name
      t.text :description
      t.string :asset_url
      t.boolean :active

      t.timestamps
    end
  end
end
