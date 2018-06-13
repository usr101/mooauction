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

ActiveRecord::Schema.define(version: 20180613010739) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "auctions", force: :cascade do |t|
    t.string   "name",           limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "checks_payable", limit: 255
    t.string   "invoice_title",  limit: 50
    t.string   "address1",       limit: 255
    t.string   "address2",       limit: 255
    t.string   "address3",       limit: 255
  end

  create_table "bidders", force: :cascade do |t|
    t.integer "buyer_id"
    t.integer "bid_id"
  end

  create_table "bids", force: :cascade do |t|
    t.decimal  "buyerbid",       precision: 30, scale: 2
    t.integer  "option"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "seller_type_id"
  end

  create_table "buyers", force: :cascade do |t|
    t.integer  "number",                 null: false
    t.string   "name",       limit: 255, null: false
    t.integer  "auction_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "buyers", ["auction_id"], name: "index_buyers_on_auction_id", using: :btree

  create_table "seller_types", force: :cascade do |t|
    t.string   "name",       limit: 255,                    null: false
    t.integer  "auction_id",                                null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "packercalc", limit: 6,   default: "NOCALC"
    t.string   "buyercalc",  limit: 6,   default: "NOCALC"
  end

  add_index "seller_types", ["auction_id"], name: "index_seller_types_on_auction_id", using: :btree

  create_table "sellers", force: :cascade do |t|
    t.string   "number",         limit: 255,                                        null: false
    t.integer  "order",                                               default: 0,   null: false
    t.string   "name",           limit: 255,                                        null: false
    t.decimal  "packerbid",                  precision: 30, scale: 2, default: 0.0
    t.integer  "seller_type_id",                                                    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "weight",                     precision: 10, scale: 2, default: 0.0
  end

  add_index "sellers", ["seller_type_id"], name: "index_sellers_on_seller_type_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name",            limit: 255
    t.string   "email",           limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest", limit: 255
    t.string   "role",            limit: 255
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

end
