class RemoveCompanyFromMaterialStatus < ActiveRecord::Migration
  def up
    remove_column :material_statuses, :company_id
  end

  def down
    add_column :material_statuses, :company_id, :integer
  end
end
