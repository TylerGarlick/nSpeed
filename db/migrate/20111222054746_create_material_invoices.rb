class CreateMaterialInvoices < ActiveRecord::Migration
  def change
    create_table :material_invoices do |t|
      t.integer :material_id
      t.integer :document_id
      t.integer :line_item
      t.integer :quantity_ordered
      t.integer :quantity_received
      t.datetime :checked_on
      t.integer :user_id

      t.timestamps
    end
  end
end
