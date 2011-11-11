class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.integer :company_id
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone
      t.string :address
      t.string :address2
      t.string :city
      t.string :state
      t.string :zip
      t.datetime :birthday
      t.boolean :active

      t.timestamps
    end
  end
end
