# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_01_04_070128) do
  create_table "customers", force: :cascade do |t|
    t.string "name"
    t.integer "contact"
    t.string "branch_name"
    t.string "address"
    t.string "city"
    t.string "state"
    t.integer "pincode"
    t.string "email"
    t.string "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "security_question"
    t.string "security_answer"
    t.string "role"
    t.boolean "admin", default: false
  end

  create_table "fixed_deposits", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "account_number"
    t.integer "total_amount"
    t.integer "customer_id"
    t.float "rate_of_interest"
    t.string "fixed_deposit_name"
    t.float "tenure"
    t.float "n"
    t.index ["customer_id"], name: "index_fixed_deposits_on_customer_id"
  end

  create_table "saving_accounts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "account_number"
    t.integer "customer_id"
    t.integer "total_amount", default: 0
    t.index ["customer_id"], name: "index_saving_accounts_on_customer_id"
  end

  create_table "transactions", force: :cascade do |t|
    t.string "type_of_transaction"
    t.integer "total_amount"
    t.integer "customer_id", null: false
    t.integer "saving_account_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_transactions_on_customer_id"
    t.index ["saving_account_id"], name: "index_transactions_on_saving_account_id"
  end

  add_foreign_key "transactions", "customers"
  add_foreign_key "transactions", "saving_accounts"
end
