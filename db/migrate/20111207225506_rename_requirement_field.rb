class RenameRequirementField < ActiveRecord::Migration
  def up
    rename_column :submittals, :requirement_id, :project_requirement_id
  end

  def down
    rename_column :submittals, :project_requirement_id, :requirement_id
  end
end
