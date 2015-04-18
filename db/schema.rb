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

ActiveRecord::Schema.define(:version => 20150411221501) do

  create_table "announcements", :force => true do |t|
    t.datetime "date_written"
    t.text     "body"
    t.boolean  "pinned"
    t.string   "announcement_type"
    t.string   "title"
  end

  create_table "events", :force => true do |t|
    t.string   "event_name"
    t.string   "location"
    t.datetime "date"
    t.float    "duration"
    t.integer  "num_volunteers"
    t.text     "description"
    t.datetime "start_time"
    t.datetime "end_time"
  end

  create_table "languages", :force => true do |t|
    t.string  "lang"
    t.string  "fluency"
    t.integer "member_id"
  end

  create_table "members", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "phone",                  :limit => 8
    t.string   "email"
    t.boolean  "is_admin"
    t.datetime "grad_date"
    t.integer  "warnings"
    t.string   "encrypted_password",                  :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.integer  "sign_in_count",                       :default => 0,  :null => false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
  end

  add_index "members", ["email"], :name => "index_members_on_email", :unique => true
  add_index "members", ["reset_password_token"], :name => "index_members_on_reset_password_token", :unique => true

  create_table "memevents", :force => true do |t|
    t.float    "hours"
    t.boolean  "waitlisted"
    t.datetime "date_added"
    t.integer  "member_id"
    t.integer  "event_id"
    t.boolean  "approved"
  end

  create_table "settings", :force => true do |t|
    t.string   "var",                      :null => false
    t.text     "value"
    t.integer  "thing_id"
    t.string   "thing_type", :limit => 30
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

  add_index "settings", ["thing_type", "thing_id", "var"], :name => "index_settings_on_thing_type_and_thing_id_and_var", :unique => true

end
