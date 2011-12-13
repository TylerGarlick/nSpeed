class CreateRoleResources < ActiveRecord::Migration
  def change
    create_table :role_resources do |t|
      t.integer :role_id
      t.integer :resource_id
      t.string :resource_type

      t.timestamps
    end
  end
end
