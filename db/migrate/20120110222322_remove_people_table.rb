class RemovePeopleTable < ActiveRecord::Migration
  def up
    drop_table :people
    drop_table :people_projects
  end

  def down
  end
end
