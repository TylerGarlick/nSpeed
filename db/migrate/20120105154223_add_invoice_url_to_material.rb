class AddInvoiceUrlToMaterial < ActiveRecord::Migration
  def change
    add_column :materials, :invoice_url, :string
  end
end
