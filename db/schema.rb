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

ActiveRecord::Schema.define(version: 20150109222649) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "tasting_notes", force: true do |t|
    t.integer  "wine_rating"
    t.string   "color_depth"
    t.string   "color_hue"
    t.string   "color_clarity"
    t.string   "aroma_intensity"
    t.string   "aroma_age"
    t.string   "aromas"
    t.string   "taste_dry"
    t.string   "taste_body"
    t.string   "taste_acid"
    t.string   "taste_tannin"
    t.string   "taste_balance"
    t.string   "taste_intensity"
    t.string   "flavors"
    t.string   "taste_finish"
    t.string   "notes"
    t.integer  "wine_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string  "name"
    t.string  "email"
    t.string  "password_digest"
    t.string  "location"
    t.boolean "admin",            default: false
    t.boolean "advanced",         default: false
    t.integer "tasting_notes_id"
  end

  create_table "wineries", force: true do |t|
    t.string   "name"
    t.string   "street"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "county"
    t.string   "hours"
    t.string   "phone_number"
    t.string   "email"
    t.integer  "rating"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "website"
    t.string   "winery_pic"
    t.string   "yelp_id"
    t.string   "yelp_url"
    t.string   "yelp_review_count"
    t.integer  "yelp_rating"
    t.string   "yelp_rating_img_small"
    t.integer  "wine_id"
  end

  create_table "wines", force: true do |t|
    t.string  "grape_varietal"
    t.string  "country"
    t.string  "state"
    t.string  "vineyard"
    t.integer "year"
    t.integer "rating"
    t.string  "name"
    t.integer "winery_id"
    t.integer "tasting_notes_id"
    t.string  "wine_pic"
  end

end
