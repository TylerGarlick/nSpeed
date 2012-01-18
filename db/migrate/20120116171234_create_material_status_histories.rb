class CreateMaterialStatusHistories < ActiveRecord::Migration
  def change
    create_table :material_status_histories do |t|
      t.integer :material_status_id
      t.integer :material_id
      t.datetime :occurrence_date

      t.timestamps
    end
  end
end
