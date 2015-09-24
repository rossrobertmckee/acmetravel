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

ActiveRecord::Schema.define(version: 20150922195455) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "airlines", force: true do |t|
    t.string   "airline"
    t.string   "iata_code"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "web_site"
    t.string   "reservations_number"
  end

  create_table "airports", force: true do |t|
    t.string   "code"
    t.float    "lat"
    t.float    "lon"
    t.string   "name"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.integer  "woeid"
    t.string   "tz"
    t.string   "phone"
    t.string   "email"
    t.string   "url"
    t.integer  "runway_length"
    t.integer  "elev"
    t.string   "icao"
    t.integer  "direct_flights"
    t.integer  "carriers"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "current_high_temp"
    t.integer  "current_low_temp"
    t.integer  "tripadvisor_city_geo_code"
  end

  add_index "airports", ["city"], name: "index_airports_on_city", using: :btree
  add_index "airports", ["code", "lat", "lon"], name: "index_airports_on_code_and_lat_and_lon", using: :btree
  add_index "airports", ["code", "name", "city"], name: "index_airports_on_code_and_name_and_city", using: :btree
  add_index "airports", ["code", "woeid"], name: "index_airports_on_code_and_woeid", using: :btree
  add_index "airports", ["code"], name: "index_airports_on_code", using: :btree
  add_index "airports", ["name"], name: "index_airports_on_name", using: :btree
  add_index "airports", ["woeid"], name: "index_airports_on_woeid", using: :btree

  create_table "flights", force: true do |t|
    t.integer  "adultcount"
    t.integer  "childcount"
    t.integer  "infantlapcount"
    t.integer  "infantseatcount"
    t.integer  "seniorcount"
    t.string   "origin"
    t.string   "destination"
    t.string   "departuredate"
    t.string   "maxprice"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
