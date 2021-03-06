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

ActiveRecord::Schema.define(version: 20140529062315) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "product_statuses", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "price"
    t.string   "image_url"
    t.integer  "product_status_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "products", ["product_status_id"], name: "index_products_on_product_status_id", using: :btree

  create_table "roles", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "txn_statuses", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "provider"
    t.string   "uid"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
    t.string   "full_name"
    t.string   "location"
    t.string   "image"
    t.string   "venmo_access_token"
    t.datetime "venmo_expires_at"
    t.string   "venmo_token_type"
    t.string   "venmo_refresh_token"
    t.string   "venmo_id"
    t.string   "venmo_email"
  end

  create_table "users_products", force: true do |t|
    t.integer  "user_id"
    t.integer  "product_id"
    t.integer  "role_id"
    t.integer  "txn_status_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users_products", ["product_id"], name: "index_users_products_on_product_id", using: :btree
  add_index "users_products", ["role_id"], name: "index_users_products_on_role_id", using: :btree
  add_index "users_products", ["txn_status_id"], name: "index_users_products_on_txn_status_id", using: :btree
  add_index "users_products", ["user_id"], name: "index_users_products_on_user_id", using: :btree

  create_table "venmo_charges", force: true do |t|
    t.string   "payment_id"
    t.string   "payment_status"
    t.datetime "payment_created_at"
    t.datetime "payment_completed_at"
    t.integer  "product_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "venmo_charges", ["product_id"], name: "index_venmo_charges_on_product_id", using: :btree

end
