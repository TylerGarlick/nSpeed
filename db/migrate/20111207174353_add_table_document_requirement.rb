class AddTableDocumentRequirement < ActiveRecord::Migration
  def change
    create_table :documents_project_requirements, :id => false do |t|
      t.integer :document_id
      t.integer :project_requirement_id
    end
  end
end
