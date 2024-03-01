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

ActiveRecord::Schema[7.1].define(version: 2024_02_18_231432) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "parking_lots", force: :cascade do |t|
    t.string "name"
    t.integer "capacity"
    t.integer "available_spaces"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "parking_records", force: :cascade do |t|
    t.datetime "entry_date"
    t.datetime "left_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "vehicle_id", null: false
    t.string "status"
    t.bigint "payment_transaction_id", null: false
    t.bigint "parking_lot_id", null: false
    t.index ["parking_lot_id"], name: "index_parking_records_on_parking_lot_id"
    t.index ["payment_transaction_id"], name: "index_parking_records_on_payment_transaction_id"
    t.index ["vehicle_id"], name: "index_parking_records_on_vehicle_id"
  end

  create_table "parking_spaces", force: :cascade do |t|
    t.string "name"
    t.float "width"
    t.float "height"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "parking_lot_id", null: false
    t.index ["parking_lot_id"], name: "index_parking_spaces_on_parking_lot_id"
  end

  create_table "payment_transactions", force: :cascade do |t|
    t.float "value"
    t.string "payment_method"
    t.datetime "payment_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "price_policies", force: :cascade do |t|
    t.string "name"
    t.float "hourly_rate"
    t.float "daily_rate"
    t.datetime "valid_from"
    t.datetime "valid_until"
    t.boolean "is_active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "jti"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["jti"], name: "index_users_on_jti"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "vehicle_descriptors", force: :cascade do |t|
    t.string "name"
    t.string "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "vehicle_id", null: false
    t.index ["vehicle_id"], name: "index_vehicle_descriptors_on_vehicle_id"
  end

  create_table "vehicle_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "vehicles", force: :cascade do |t|
    t.string "plate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.bigint "vehicle_type_id", null: false
    t.index ["user_id"], name: "index_vehicles_on_user_id"
    t.index ["vehicle_type_id"], name: "index_vehicles_on_vehicle_type_id"
  end

  add_foreign_key "parking_records", "parking_lots"
  add_foreign_key "parking_records", "payment_transactions"
  add_foreign_key "parking_records", "vehicles"
  add_foreign_key "parking_spaces", "parking_lots"
  add_foreign_key "vehicle_descriptors", "vehicles"
  add_foreign_key "vehicles", "users"
  add_foreign_key "vehicles", "vehicle_types"
end
