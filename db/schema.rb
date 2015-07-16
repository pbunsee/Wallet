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

ActiveRecord::Schema.define(version: 20150716060717) do

  create_table "accounts", force: :cascade do |t|
    t.string   "number"
    t.string   "acctype"
    t.decimal  "balance",    default: 0.0
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "accounts", ["number"], name: "index_accounts_on_number"

  create_table "cards", force: :cascade do |t|
    t.string   "number"
    t.string   "category"
    t.decimal  "credit_limit"
    t.date     "exp_date"
    t.integer  "cvv"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "cards", ["number"], name: "index_cards_on_number"

  create_table "transactions", force: :cascade do |t|
    t.string   "description"
    t.decimal  "amount"
    t.string   "currency"
    t.datetime "transaction_date"
    t.datetime "post_date"
    t.string   "from_account"
    t.string   "to_account"
    t.integer  "account_id"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.string   "associated_entity", limit: 50
    t.integer  "card_id"
  end

  add_index "transactions", ["account_id"], name: "index_transactions_on_account_id"
  add_index "transactions", ["card_id"], name: "index_transactions_on_card_id"

  create_table "user_accounts", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "account_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_accounts", ["account_id", "user_id"], name: "index_user_accounts_on_account_id_and_user_id"

  create_table "user_cards", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "card_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "user_cards", ["card_id", "user_id"], name: "index_user_cards_on_card_id_and_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "password"
    t.string   "email"
    t.string   "phone"
    t.string   "firstname"
    t.string   "lastname"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
