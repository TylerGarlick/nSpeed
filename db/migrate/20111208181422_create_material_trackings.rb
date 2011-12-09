class CreateMaterialTrackings < ActiveRecord::Migration
  def change
    create_table :material_trackings do |t|
      t.integer :project_id
      t.string :name
      t.text :description
      t.integer :document_id

      t.timestamps
    end
  end
end
