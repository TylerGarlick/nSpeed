class CreateMaterials < ActiveRecord::Migration
  def change
    create_table :materials do |t|
      t.integer :company_id
      t.string :name
      t.string :heat_number
      t.string :n_number
      t.string :ancestry
      t.boolean :active

      t.timestamps
    end
  end
end
