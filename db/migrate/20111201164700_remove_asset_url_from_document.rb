class RemoveAssetUrlFromDocument < ActiveRecord::Migration
  def up
    remove_column :documents, :asset_url
  end
  def down
    add_column :documents, :asset_url, :integer
  end
end