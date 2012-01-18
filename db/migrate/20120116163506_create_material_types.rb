class CreateMaterialTypes < ActiveRecord::Migration
  def change
    create_table :material_types do |t|
      t.string :name
      t.text :description
      t.string :heat_number
      t.string :astm_number

      t.timestamps
    end
  end
end
