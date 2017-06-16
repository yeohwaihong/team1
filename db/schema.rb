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

ActiveRecord::Schema.define(version: 20170616065606) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "authentications", force: :cascade do |t|
    t.string   "uid"
    t.string   "token"
    t.string   "provider"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_authentications_on_user_id", using: :btree
  end

  create_table "bids", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "stock_id"
    t.integer  "bidding_price"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "size"
    t.string   "gender"
    t.string   "closing_date"
    t.index ["stock_id"], name: "index_bids_on_stock_id", using: :btree
    t.index ["user_id"], name: "index_bids_on_user_id", using: :btree
  end

  create_table "historical_tables", force: :cascade do |t|
    t.string   "model_number"
    t.datetime "date_time"
    t.integer  "transacted_price"
    t.integer  "item_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["item_id"], name: "index_historical_tables_on_item_id", using: :btree
  end

  create_table "images", force: :cascade do |t|
    t.integer  "item_id"
    t.string   "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_images_on_item_id", using: :btree
  end

  create_table "items", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name"
    t.string   "color"
    t.string   "model_number"
    t.string   "category"
    t.string   "brand"
    t.integer  "retail_price"
    t.date     "release_date"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["user_id"], name: "index_items_on_user_id", using: :btree
  end

  create_table "stocks", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "item_id"
    t.integer  "size"
    t.string   "gender"
    t.integer  "resell_price"
    t.string   "closing_date"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["item_id"], name: "index_stocks_on_item_id", using: :btree
    t.index ["user_id"], name: "index_stocks_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "email",                          null: false
    t.string   "encrypted_password", limit: 128
    t.string   "confirmation_token", limit: 128
    t.string   "remember_token",     limit: 128, null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "username"
    t.string   "state"
    t.string   "vice"
    t.integer  "role"
    t.index ["email"], name: "index_users_on_email", using: :btree
    t.index ["remember_token"], name: "index_users_on_remember_token", using: :btree
  end

  add_foreign_key "authentications", "users"
  add_foreign_key "images", "items"
  add_foreign_key "items", "users"
end
