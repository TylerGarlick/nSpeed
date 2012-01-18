class RemoveMaterialInvoicesAddColumnsToMaterials < ActiveRecord::Migration
  def up
    add_column :materials, :tested_user_id, :integer
    add_column :materials, :received_user_id, :integer
    add_column :materials, :ordered_user_id, :integer
    add_column :materials, :quantity_received, :integer
    add_column :materials, :quantity_ordered, :integer
    add_column :materials, :received_date, :datetime
    add_column :materials, :ordered_date, :datetime
    add_column :materials, :tested_date, :datetime


    drop_table :material_invoices
  end

  def down
    remove_column :materials, :quantity_ordered
    remove_column :materials, :quantity_received
    remove_column :materials, :ordered_user_id
    remove_column :materials, :received_user_id
    remove_column :materials, :tested_user_id
    remove_column :materials, :received_date
    remove_column :materials, :ordered_date
    remove_column :materials, :tested_date

  end
end
