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

ActiveRecord::Schema.define(version: 20140608200845) do

  create_table "currencies", force: true do |t|
    t.string   "name",       limit: 50, null: false
    t.string   "acronym",    limit: 5,  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "description_items", force: true do |t|
    t.string   "title",                     limit: 75,         null: false
    t.text     "long_description",          limit: 2147483647, null: false
    t.integer  "project_id"
    t.string   "avatar_piece_file_name"
    t.string   "avatar_piece_content_type"
    t.integer  "avatar_piece_file_size"
    t.datetime "avatar_piece_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "description_items", ["project_id"], name: "index_description_items_on_project_id", using: :btree

  create_table "payment_methods", force: true do |t|
    t.string   "through",     limit: 55,  null: false
    t.string   "type",        limit: 55,  null: false
    t.string   "description", limit: 140
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "project_goals", force: true do |t|
    t.decimal  "value",                     precision: 9, scale: 2, null: false
    t.decimal  "decimal",                   precision: 9, scale: 2, null: false
    t.string   "justification", limit: 140
    t.integer  "currency_id"
    t.integer  "project_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "project_types", force: true do |t|
    t.string   "name",        limit: 30,  null: false
    t.string   "description", limit: 140
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "projects", force: true do |t|
    t.string   "name",                      limit: 50,                 null: false
    t.string   "alias_name",                limit: 50,                 null: false
    t.string   "resume",                    limit: 144,                null: false
    t.string   "url_video",                 limit: 50
    t.boolean  "active",                                default: true, null: false
    t.integer  "creator_id"
    t.string   "avatar_piece_file_name"
    t.string   "avatar_piece_content_type"
    t.integer  "avatar_piece_file_size"
    t.datetime "avatar_piece_updated_at"
    t.integer  "project_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "projects", ["creator_id"], name: "index_projects_on_creator_id", using: :btree

  create_table "receipts", force: true do |t|
    t.string   "token",          limit: 50,  null: false
    t.string   "id_on_operator", limit: 45,  null: false
    t.string   "url_access",     limit: 140, null: false
    t.string   "tid",            limit: 45
    t.integer  "transaction_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "receipts", ["transaction_id"], name: "index_receipts_on_transaction_id", using: :btree

  create_table "social_sessions", force: true do |t|
    t.string   "id_on_social", limit: 45, null: false
    t.string   "name",         limit: 65, null: false
    t.string   "username",     limit: 45, null: false
    t.string   "email",        limit: 55, null: false
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "transactions", force: true do |t|
    t.decimal  "value",                      precision: 9, scale: 2, null: false
    t.decimal  "decimal",                    precision: 9, scale: 2, null: false
    t.boolean  "banking",                                            null: false
    t.string   "receipt_access", limit: 140,                         null: false
    t.integer  "payer_id",                                           null: false
    t.integer  "receiver_id",                                        null: false
    t.integer  "currency_id",                                        null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "transactions", ["currency_id"], name: "index_transactions_on_currency_id", using: :btree
  add_index "transactions", ["payer_id"], name: "index_transactions_on_payer_id", using: :btree
  add_index "transactions", ["receiver_id"], name: "index_transactions_on_receiver_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "name",           limit: 55, null: false
    t.string   "email",          limit: 55, null: false
    t.string   "academic_email", limit: 55
    t.string   "pass_salt",      limit: 29, null: false
    t.string   "password",       limit: 60, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["academic_email"], name: "index_users_on_academic_email", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

end
