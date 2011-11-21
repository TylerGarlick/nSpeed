class AddHashToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :custom_fields, :text
  end
end
