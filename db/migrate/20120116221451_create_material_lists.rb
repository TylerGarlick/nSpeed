class CreateMaterialLists < ActiveRecord::Migration
  def change
    create_table :material_lists do |t|
      t.integer :project_id
      t.integer :document_id
      t.timestamps
    end
  end
end
