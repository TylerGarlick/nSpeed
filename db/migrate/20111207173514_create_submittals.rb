class CreateSubmittals < ActiveRecord::Migration
  def change
    create_table :submittals do |t|
      t.integer :requirement_id
      t.string :customer_document
      t.integer :user_id

      t.timestamps
    end
  end
end
