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

ActiveRecord::Schema[7.0].define(version: 2022_11_09_223807) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "assignments", force: :cascade do |t|
    t.integer "calendar_id"
    t.string "name"
    t.datetime "due_date"
    t.integer "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "calendars", force: :cascade do |t|
    t.string "name"
    t.integer "user_id"
    t.boolean "shared"
    t.string "invite_token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["invite_token"], name: "index_calendars_on_invite_token", unique: true
  end

  create_table "class_periods", force: :cascade do |t|
    t.integer "calendar_id"
    t.integer "course_id"
    t.string "name"
    t.string "start_time"
    t.string "end_time"
    t.date "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "courses", force: :cascade do |t|
    t.integer "calendar_id"
    t.string "name"
    t.date "start_date"
    t.date "end_date"
    t.string "start_time"
    t.string "end_time"
    t.string "location"
    t.string "professor_name"
    t.string "repetition_frequency"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "holidays", force: :cascade do |t|
    t.integer "calendar_id"
    t.string "name"
    t.datetime "date"
    t.string "holiday_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "other_events", force: :cascade do |t|
    t.integer "calendar_id"
    t.string "name"
    t.string "start_time"
    t.string "end_time"
    t.date "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_calendars", force: :cascade do |t|
    t.integer "user_id"
    t.integer "calendar_id"
    t.boolean "creator", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.integer "student_id"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "user_calendars", "calendars"
  add_foreign_key "user_calendars", "users"
end
