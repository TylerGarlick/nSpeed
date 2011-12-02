class AddDocumentsToProjects < ActiveRecord::Migration
  def change
    create_table :documents_projects, :id => false do |t|
      t.integer :document_id
      t.integer :project_id
    end
  end
end
