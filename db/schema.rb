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

ActiveRecord::Schema.define(:version => 20150403061716) do

  create_table "announcements", :force => true do |t|
    t.datetime "date_written"
    t.text     "body"
    t.boolean  "pinned"
    t.string   "announcement_type"
  end

  create_table "events", :force => true do |t|
    t.string   "event_name"
    t.string   "location"
    t.datetime "date"
    t.float    "duration"
    t.integer  "num_volunteers"
    t.text     "description"
  end

  create_table "languages", :force => true do |t|
    t.string  "lang"
    t.string  "fluency"
    t.integer "member_id"
  end

  create_table "members", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "phone",      :limit => 8
    t.string   "email"
    t.string   "password"
    t.boolean  "is_admin"
    t.datetime "grad_date"
    t.integer  "warnings"
  end

  create_table "memevents", :force => true do |t|
    t.float    "hours_attended"
    t.boolean  "waitlisted"
    t.datetime "date_added"
    t.integer  "member_id"
    t.integer  "event_id"
  end

end
