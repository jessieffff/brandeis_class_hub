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

ActiveRecord::Schema[7.0].define(version: 2022_10_13_005059) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "assignments", force: :cascade do |t|
    t.integer "event_id"
    t.string "event_name"
    t.string "event_category"
    t.datetime "due_date"
    t.integer "class_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "calendars", force: :cascade do |t|
    t.string "calendar_name"
    t.integer "user_id"
    t.boolean "shared"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "class_periods", force: :cascade do |t|
    t.integer "course_id"
    t.datetime "start_time"
    t.datetime "end_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "courses", force: :cascade do |t|
    t.integer "event_id"
    t.string "event_name"
    t.string "event_category"
    t.date "start_date"
    t.date "end_date"
    t.string "location"
    t.string "professor_first_name"
    t.string "professor_last_name"
    t.string "repetition_frequency"
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", force: :cascade do |t|
    t.integer "calendar_id"
    t.string "event_category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "holidays", force: :cascade do |t|
    t.integer "event_id"
    t.string "event_name"
    t.string "event_category"
    t.date "date"
    t.string "holiday_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_calendars", force: :cascade do |t|
    t.integer "user_id"
    t.integer "calendar_id"
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
  end

end
