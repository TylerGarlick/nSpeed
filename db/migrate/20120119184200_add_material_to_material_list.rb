class AddMaterialToMaterialList < ActiveRecord::Migration
  def change
    add_column :material_lists, :material_id, :integer
    add_column :materials, :created_user_id, :integer
    add_column :materials, :country_of_orgin, :string


    remove_column :materials, :heat_number
    remove_column :materials, :active
    remove_column :materials, :document_id
    remove_column :materials, :vendor
    remove_column :materials, :astm_number
    remove_column :materials, :material_tracking_number
    remove_column :materials, :tested_user_id
    remove_column :materials, :received_user_id
    remove_column :materials, :ordered_user_id
    remove_column :materials, :quantity_received
    remove_column :materials, :quantity_ordered
    remove_column :materials, :received_date
    remove_column :materials, :ordered_date
    remove_column :materials, :tested_date
    remove_column :materials, :material_list_id

    Material.delete_all

  end
end