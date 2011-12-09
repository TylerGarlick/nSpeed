class CreateMaterialTrackingItems < ActiveRecord::Migration
  def change
    create_table :material_tracking_items do |t|
      t.integer :material_tracking_id
      t.integer :user_id
      t.integer :item_number
      t.string :material
      t.text :description
      t.integer :quantity
      t.datetime :verified_on

      t.timestamps
    end
  end
end
