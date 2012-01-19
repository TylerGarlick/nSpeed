# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120119040222) do

  create_table "companies", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "customers", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "company_id"
  end

  create_table "document_assets", :force => true do |t|
    t.integer  "document_id"
    t.string   "asset_url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "customer_response_url"
    t.datetime "customer_response_date"
    t.integer  "submittal_status_id"
    t.integer  "user_id"
  end

  create_table "document_types", :force => true do |t|
    t.string   "name"
    t.boolean  "active"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "documents", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.boolean  "active"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "document_type_id"
  end

  create_table "documents_project_requirements", :id => false, :force => true do |t|
    t.integer "document_id"
    t.integer "project_requirement_id"
  end

  create_table "documents_projects", :id => false, :force => true do |t|
    t.integer "document_id"
    t.integer "project_id"
  end

  create_table "material_documents", :force => true do |t|
    t.integer  "document_id"
    t.integer  "material_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "quantity_ordered"
    t.integer  "quantity_received"
  end

  create_table "material_lists", :force => true do |t|
    t.integer  "project_id"
    t.integer  "document_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "material_status_histories", :force => true do |t|
    t.integer  "material_status_id"
    t.integer  "material_id"
    t.datetime "occurrence_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "material_statuses", :force => true do |t|
    t.string   "name"
    t.boolean  "active"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "material_types", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "heat_number"
    t.string   "astm_number"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "company_id"
  end

  create_table "materials", :force => true do |t|
    t.string   "name"
    t.string   "heat_number"
    t.boolean  "active"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "project_id"
    t.integer  "document_id"
    t.integer  "item_number"
    t.integer  "quantity"
    t.string   "vendor"
    t.text     "description"
    t.string   "astm_number"
    t.string   "material_tracking_number"
    t.integer  "material_status_id"
    t.integer  "tested_user_id"
    t.integer  "received_user_id"
    t.integer  "ordered_user_id"
    t.integer  "quantity_received"
    t.integer  "quantity_ordered"
    t.datetime "received_date"
    t.datetime "ordered_date"
    t.datetime "tested_date"
    t.string   "invoice_url"
    t.integer  "material_type_id"
    t.integer  "material_list_id"
  end

  create_table "prerequisites", :force => true do |t|
    t.integer  "project_id"
    t.string   "name"
    t.boolean  "active"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "project_requirements", :force => true do |t|
    t.integer  "project_id"
    t.string   "name"
    t.integer  "ordinal"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "customer_document_reference"
    t.integer  "project_requirement_type_id"
    t.integer  "person_id"
    t.integer  "prerequisite_id"
  end

  create_table "project_types", :force => true do |t|
    t.integer  "company_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "projects", :force => true do |t|
    t.integer  "company_id"
    t.string   "name"
    t.text     "description"
    t.boolean  "is_active"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "custom_fields"
    t.integer  "customer_id"
    t.integer  "project_type_id"
    t.string   "purchase_order_number"
    t.string   "project_name"
  end

  create_table "rails_admin_histories", :force => true do |t|
    t.text     "message"
    t.string   "username"
    t.integer  "item"
    t.string   "table"
    t.integer  "month",      :limit => 2
    t.integer  "year",       :limit => 8
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rails_admin_histories", ["item", "table", "month", "year"], :name => "index_rails_admin_histories"

  create_table "role_resources", :force => true do |t|
    t.integer  "role_id"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "mode"
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.integer  "company_id"
    t.boolean  "active"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles_users", :id => false, :force => true do |t|
    t.integer "role_id"
    t.integer "user_id"
  end

  create_table "submittal_documents", :force => true do |t|
    t.integer  "submittal_id"
    t.integer  "document_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "submittal_statuses", :force => true do |t|
    t.integer  "project_id"
    t.string   "name"
    t.string   "color"
    t.boolean  "active"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "submittals", :force => true do |t|
    t.integer  "project_requirement_id"
    t.string   "customer_document"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                                 :default => "", :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "username"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "company_id"
    t.string   "user_type"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "initials"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
