class CreateSubmitalLogItems < ActiveRecord::Migration
  def change
    create_table :submittal_log_items do |t|
      t.integer :project_requirement_id
      t.integer :customer_document_id
      t.integer :pti_document_id
      t.integer :submittal_log_item_type_id
      t.text :description
      t.integer :responsibility_person_id
      t.datetime :sent_date
      t.datetime :returned_date
      t.integer :submittal_status_id
      t.integer :customer_returned_document_id

      t.timestamps
    end
  end
end
