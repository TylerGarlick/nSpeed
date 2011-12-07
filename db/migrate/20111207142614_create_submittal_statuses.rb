class CreateSubmittalStatuses < ActiveRecord::Migration
  def change
    create_table :submittal_statuses do |t|
      t.integer :project_id
      t.string :name
      t.string :color
      t.boolean :active
      t.timestamps
    end
  end
end
