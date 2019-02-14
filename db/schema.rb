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

ActiveRecord::Schema.define(version: 2019_02_14_025407) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clients", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "phone_number"
    t.string "email"
    t.string "street_address"
    t.string "city"
    t.string "province"
    t.string "postal_code"
    t.boolean "marketing_consent"
    t.integer "broker_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "full_address"
    t.float "latitude"
    t.float "longitude"
    t.index ["email"], name: "index_clients_on_email"
  end

  create_table "coverages", force: :cascade do |t|
    t.string "coverage_type"
    t.float "coverage_limit"
    t.bigint "policy_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["policy_id"], name: "index_coverages_on_policy_id"
  end

  create_table "policies", force: :cascade do |t|
    t.string "policy_number"
    t.float "annual_premium"
    t.bigint "client_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_policies_on_client_id"
    t.index ["policy_number"], name: "index_policies_on_policy_number", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "password_digest"
    t.boolean "admin", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "coverages", "policies"
  add_foreign_key "policies", "clients"
end
