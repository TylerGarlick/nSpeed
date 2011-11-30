class CreateProjectRequirements < ActiveRecord::Migration
  def change
    create_table :project_requirements do |t|
      t.integer :project_id
      t.string :name
      t.integer :ordinal

      t.timestamps
    end
  end
end
