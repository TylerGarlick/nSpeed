class RemoveProjectRequirementTypeFromProjectRequirement < ActiveRecord::Migration
  def change
    add_column :project_requirements, :prerequisite_id, :integer
  end



end
