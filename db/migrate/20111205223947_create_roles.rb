class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :name
      t.integer :company_id
      t.boolean :active

      t.timestamps
    end
  end
end
