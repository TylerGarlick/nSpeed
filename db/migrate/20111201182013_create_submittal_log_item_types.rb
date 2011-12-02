class CreateSubmittalLogItemTypes < ActiveRecord::Migration
  def change
    create_table :submittal_log_item_types do |t|
      t.integer :project_id
      t.string :name

      t.timestamps
    end
  end
end
