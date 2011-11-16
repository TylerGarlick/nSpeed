class AddIndexToMaterial < ActiveRecord::Migration
  def self.up
    add_index :materials, :ancestry
  end

  def self.down
    remove_index :materials, :ancestry
  end
end
