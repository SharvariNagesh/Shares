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

ActiveRecord::Schema.define(version: 20160408005456) do

  create_table "reviews", force: :cascade do |t|
    t.string   "name"
    t.integer  "priority"
    t.text     "comment"
    t.integer  "share_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "reviews", ["share_id"], name: "index_reviews_on_share_id"

  create_table "shares", force: :cascade do |t|
    t.string   "name"
    t.decimal  "current_price"
    t.decimal  "year_low"
    t.decimal  "year_high"
    t.decimal  "current_PE_ratio"
    t.decimal  "market_cap"
    t.decimal  "book_value"
    t.text     "description"
    t.decimal  "price_to_book_value"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "sector"
  end

end
