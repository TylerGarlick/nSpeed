class RemoveNameFromMaterial < ActiveRecord::Migration
  def up
    remove_column :materials, :name
  end

  def down
    add_column :materials, :name, :string
  end
end
