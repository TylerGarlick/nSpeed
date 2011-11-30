class ChangeColumnProjectNumberToProjectName < ActiveRecord::Migration
  def up
    rename_column :projects, :project_number, :project_name
  end

  def down
    rename_column :projects, :project_name, :project_number
  end
end
