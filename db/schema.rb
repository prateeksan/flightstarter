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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160523181015) do

  create_table "campaigns", force: :cascade do |t|
    t.string   "title"
    t.string   "type"
    t.string   "description"
    t.decimal  "requisite_funding", precision: 15, scale: 3
    t.boolean  "confirmed"
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.integer  "user_id"
  end

  add_index "campaigns", ["user_id"], name: "index_campaigns_on_user_id"

  create_table "cities", force: :cascade do |t|
    t.string   "name"
    t.string   "country"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "legs", force: :cascade do |t|
    t.string   "title"
    t.string   "type"
    t.date     "start_date"
    t.date     "max_start_date"
    t.date     "min_start_date"
    t.date     "end_date"
    t.date     "max_end_date"
    t.date     "min_end_date"
    t.integer  "campaign_id"
    t.integer  "startpoint_id"
    t.integer  "endpoint_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "legs", ["campaign_id"], name: "index_legs_on_campaign_id"

  create_table "locations", force: :cascade do |t|
    t.string   "title"
    t.string   "latitude"
    t.string   "longitude"
    t.integer  "city_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "locations", ["city_id"], name: "index_locations_on_city_id"

  create_table "pledges", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "campaign_id"
    t.decimal  "amount",      precision: 15, scale: 3
    t.string   "condition"
    t.boolean  "accepted"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  add_index "pledges", ["campaign_id"], name: "index_pledges_on_campaign_id"
  add_index "pledges", ["user_id"], name: "index_pledges_on_user_id"

  create_table "residences", force: :cascade do |t|
    t.string   "name"
    t.string   "type"
    t.integer  "location_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "residences", ["location_id"], name: "index_residences_on_location_id"

  create_table "stations", force: :cascade do |t|
    t.string   "name"
    t.string   "type"
    t.integer  "location_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "stations", ["location_id"], name: "index_stations_on_location_id"

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "password_digest"
    t.string   "email"
    t.integer  "age"
    t.string   "pronoun"
    t.integer  "zip"
    t.integer  "city_id"
    t.integer  "location_id"
    t.string   "street_address"
    t.string   "avatar"
    t.string   "bio"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "users", ["city_id"], name: "index_users_on_city_id"
  add_index "users", ["location_id"], name: "index_users_on_location_id"

end
