class RemoveSubmittalLogTables < ActiveRecord::Migration
  def change
    drop_table :submittal_log_item_types
    drop_table :submittal_log_items
  end
end
