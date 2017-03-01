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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170228192146) do

  create_table "events", force: :cascade do |t|
    t.string   "title"
    t.float    "lat"
    t.float    "lng"
    t.text     "description"
    t.boolean  "status"
    t.integer  "user_id"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.datetime "scheduled_at"
    t.string   "address"
    t.string   "city"
    t.index ["user_id"], name: "index_events_on_user_id"
  end

  create_table "helper_lists", force: :cascade do |t|
    t.integer  "event_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_helper_lists_on_event_id"
    t.index ["user_id"], name: "index_helper_lists_on_user_id"
  end

  create_table "locations", force: :cascade do |t|
    t.float    "startlat"
    t.float    "startlng"
    t.float    "endlat"
    t.float    "endlng"
    t.integer  "user_id"
    t.integer  "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_locations_on_event_id"
    t.index ["user_id"], name: "index_locations_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "image"
    t.text     "description"
    t.date     "DoB"
    t.integer  "phone_number"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

end
