class AddPoAndProjectNumberToProject < ActiveRecord::Migration
  def change
    add_column :projects, :purchase_order_number, :string
    add_column :projects, :project_number, :string
  end
end
