# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_03_12_144713) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "api_users", force: :cascade do |t|
    t.string "access_token", default: "", null: false
    t.string "email", default: "", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["access_token"], name: "index_api_users_on_access_token", unique: true
    t.index ["email"], name: "index_api_users_on_email", unique: true
  end

  create_table "coins", force: :cascade do |t|
    t.integer "value", default: 0
    t.string "name", default: "", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "api_user_id", null: false
    t.index ["api_user_id"], name: "index_coins_on_api_user_id"
    t.index ["name"], name: "index_coins_on_name", unique: true
  end

  create_table "transactions", force: :cascade do |t|
    t.string "transaction_type"
    t.bigint "coin_id", null: false
    t.bigint "api_user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["api_user_id"], name: "index_transactions_on_api_user_id"
    t.index ["coin_id"], name: "index_transactions_on_coin_id"
  end

  add_foreign_key "coins", "api_users"
  add_foreign_key "transactions", "api_users"
  add_foreign_key "transactions", "coins"
end
