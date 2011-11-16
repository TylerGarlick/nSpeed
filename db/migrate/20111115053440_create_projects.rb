class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.integer :company_id
      t.string :name
      t.text :description
      t.boolean :is_active

      t.timestamps
    end
  end
end
