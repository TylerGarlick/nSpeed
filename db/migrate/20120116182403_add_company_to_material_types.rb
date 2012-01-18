class AddCompanyToMaterialTypes < ActiveRecord::Migration
  def change
    add_column :material_types, :company_id, :integer
  end
end
