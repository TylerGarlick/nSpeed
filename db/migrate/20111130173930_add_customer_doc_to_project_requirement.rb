class AddCustomerDocToProjectRequirement < ActiveRecord::Migration
  def change
    add_column :project_requirements, :customer_document_reference, :string
    add_column :project_requirements, :project_requirement_type_id, :integer
    add_column :project_requirements, :person_id, :integer
  end
end
