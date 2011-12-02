class CreatePrerequisites < ActiveRecord::Migration
  def change
    create_table :prerequisites do |t|
      t.integer :project_id
      t.string :name
      t.boolean :active

      t.timestamps
    end
  end
end
