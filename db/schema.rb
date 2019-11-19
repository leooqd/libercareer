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

ActiveRecord::Schema.define(version: 2019_11_18_215447) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "unaccent"

  create_table "automobiles", force: :cascade do |t|
    t.string "color", default: "", null: false
    t.string "model", default: "", null: false
    t.string "year"
    t.string "license_plate", default: "", null: false
    t.string "kind", default: "", null: false
    t.decimal "cost", default: "0.0", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "licenses", force: :cascade do |t|
    t.string "number", default: "", null: false
    t.date "expiration", null: false
    t.bigint "person_id", null: false
    t.json "modalities_ids", default: []
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["person_id"], name: "index_licenses_on_person_id"
  end

  create_table "modalities", force: :cascade do |t|
    t.string "category", default: "", null: false
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "people", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.string "last_name"
    t.string "document", default: "", null: false
    t.string "email", default: "", null: false
    t.date "birth_date", null: false
    t.bigint "preferred_phone_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["preferred_phone_id"], name: "index_people_on_preferred_phone_id"
  end

  create_table "phones", force: :cascade do |t|
    t.string "number", default: "", null: false
    t.string "ddd", default: "", null: false
    t.string "kind", default: "particular", null: false
    t.bigint "person_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["person_id"], name: "index_phones_on_person_id"
  end

  create_table "rents", force: :cascade do |t|
    t.bigint "person_id"
    t.bigint "automobile_id"
    t.decimal "cost"
    t.date "start_date"
    t.date "end_date"
    t.date "pickup_date"
    t.date "return_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["automobile_id"], name: "index_rents_on_automobile_id"
    t.index ["person_id"], name: "index_rents_on_person_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
