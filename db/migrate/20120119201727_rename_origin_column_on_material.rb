class RenameOriginColumnOnMaterial < ActiveRecord::Migration
  def change
    rename_column :materials, :country_of_orgin, :country_of_origin
  end

end
