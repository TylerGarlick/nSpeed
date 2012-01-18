class CreateMaterialPos < ActiveRecord::Migration
  def change
    create_table :material_pos do |t|
      t.integer :document_id
      t.integer :material_id
      t.integer :quantity_ordered
      t.integer :quantity_received

      t.timestamps
    end
  end
end
