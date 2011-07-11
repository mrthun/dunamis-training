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

ActiveRecord::Schema.define(:version => 20110711110021) do

  create_table "addresses", :force => true do |t|
    t.integer  "client_id"
    t.string   "client_type"
    t.string   "billing_contact_name"
    t.text     "billing_address_1"
    t.text     "billing_address_2"
    t.string   "billing_city"
    t.integer  "billing_zip"
    t.text     "billing_phone"
    t.text     "billing_fax"
    t.text     "billing_email"
    t.string   "location_contact_name"
    t.text     "location_address_1"
    t.text     "location_address_2"
    t.string   "location_city"
    t.integer  "location_zip"
    t.text     "location_phone"
    t.text     "location_fax"
    t.text     "location_email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "assets", :force => true do |t|
    t.integer  "user_id"
    t.string   "asset_file_name"
    t.string   "asset_content_type"
    t.integer  "asset_file_size"
    t.datetime "asset_updated_at"
    t.string   "asset_asset_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "basic_data", :force => true do |t|
    t.integer  "client_id"
    t.string   "client_type"
    t.text     "name"
    t.string   "comment"
    t.integer  "client_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "billing_data", :force => true do |t|
    t.integer  "client_id"
    t.string   "client_type"
    t.string   "preferred_bill_in"
    t.string   "pay_term"
    t.string   "week_start"
    t.string   "week_end"
    t.string   "over_time"
    t.integer  "lunch_rule"
    t.integer  "lunch_break"
    t.integer  "time_rounding"
    t.integer  "pay_type_id"
    t.integer  "credit_line"
    t.integer  "intrest"
    t.boolean  "charge_intrest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "client_locations", :force => true do |t|
    t.integer  "client_id"
    t.string   "client_type"
    t.string   "name"
    t.string   "contact_name"
    t.text     "address_1"
    t.text     "address_2"
    t.string   "city"
    t.integer  "zip"
    t.text     "phone"
    t.text     "fax"
    t.text     "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "client_types", :force => true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contract_types", :force => true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "data", :force => true do |t|
    t.integer  "registrant_id"
    t.string   "registrant_type"
    t.datetime "license_expiration_date"
    t.datetime "insurance_expiration_date"
    t.text     "health_exam_1_title"
    t.datetime "health_exam_1_date"
    t.text     "health_exam_2_title"
    t.datetime "health_exam_2_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "occupation_types", :force => true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pay_types", :force => true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pays", :force => true do |t|
    t.integer  "registrant_id"
    t.string   "registrant_type"
    t.datetime "regular_hours_from"
    t.datetime "regular_hours_to"
    t.datetime "overtime_hours_from"
    t.datetime "overtime_hours_to"
    t.datetime "night_hours_from"
    t.datetime "night_hours_to"
    t.datetime "weekend_hours_from"
    t.datetime "weekend_hours_to"
    t.integer  "pay_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "personal_data", :force => true do |t|
    t.integer  "registrant_id"
    t.string   "registrant_type"
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "birth_date"
    t.text     "home_address_1"
    t.text     "home_address_2"
    t.string   "city"
    t.integer  "zip"
    t.text     "home_phone"
    t.text     "cell_phone"
    t.datetime "hire_date"
    t.integer  "social_security_number"
    t.string   "bank"
    t.text     "account_number"
    t.text     "routing_number"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "preferences", :force => true do |t|
    t.integer  "registrant_id"
    t.string   "registrant_type"
    t.boolean  "work_on_weekends"
    t.boolean  "work_after_hours"
    t.integer  "max_driving_distance"
    t.integer  "contract_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", :force => true do |t|
    t.string "title"
  end

  create_table "roles_users", :id => false, :force => true do |t|
    t.integer "role_id"
    t.integer "user_id"
  end

  create_table "skills", :force => true do |t|
    t.integer  "registrant_id"
    t.string   "registrant_type"
    t.integer  "occupation_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "statuses", :force => true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                     :limit => 100
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token",            :limit => 40
    t.datetime "remember_token_expires_at"
    t.string   "activation_code",           :limit => 40
    t.datetime "activated_at"
    t.integer  "status_id"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true

  create_table "work_locations", :force => true do |t|
    t.integer  "registrant_id"
    t.string   "registrant_type"
    t.string   "name"
    t.string   "first_worked"
    t.datetime "received_orientation"
    t.boolean  "do_not_schedual"
    t.text     "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
