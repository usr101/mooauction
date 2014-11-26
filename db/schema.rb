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

ActiveRecord::Schema.define(version: 20141124195231) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "auctions", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bidders", force: true do |t|
    t.integer "seller_id"
    t.integer "buyer_id"
  end

  create_table "buyers", force: true do |t|
    t.integer  "number",     null: false
    t.string   "name",       null: false
    t.integer  "auction_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "buyers", ["auction_id"], name: "index_buyers_on_auction_id", using: :btree

  create_table "seller_types", force: true do |t|
    t.string   "name",                                    null: false
    t.integer  "auction_id",                              null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "packercalc", limit: 6, default: "NOCALC"
    t.string   "buyercalc",  limit: 6, default: "NOCALC"
  end

  add_index "seller_types", ["auction_id"], name: "index_seller_types_on_auction_id", using: :btree

  create_table "sellers", force: true do |t|
    t.integer  "number",                                                null: false
    t.integer  "order",                                   default: 0,   null: false
    t.string   "name",                                                  null: false
    t.decimal  "packerbid",      precision: 30, scale: 2, default: 0.0
    t.integer  "seller_type_id",                                        null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "buyerbid",       precision: 30, scale: 2, default: 0.0, null: false
    t.integer  "option"
    t.decimal  "weight",         precision: 10, scale: 2, default: 0.0
  end

  add_index "sellers", ["seller_type_id"], name: "index_sellers_on_seller_type_id", using: :btree

end
