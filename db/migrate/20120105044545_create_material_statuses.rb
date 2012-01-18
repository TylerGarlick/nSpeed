class CreateMaterialStatuses < ActiveRecord::Migration
  def change
    create_table :material_statuses do |t|
      t.integer :company_id
      t.string :name
      t.boolean :active

      t.timestamps
    end

    add_column :materials, :material_status_id, :integer
  end
end
