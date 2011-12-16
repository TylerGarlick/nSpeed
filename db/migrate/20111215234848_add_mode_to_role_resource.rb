class AddModeToRoleResource < ActiveRecord::Migration
  def change
    add_column :role_resources, :mode, :string
  end
end
