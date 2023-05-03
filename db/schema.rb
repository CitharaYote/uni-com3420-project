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

ActiveRecord::Schema[7.0].define(version: 2023_05_01_205033) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "courses", force: :cascade do |t|
    t.string "module_code"
    t.integer "credit"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "courses_programs", id: false, force: :cascade do |t|
    t.bigint "course_id", null: false
    t.bigint "program_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_courses_programs_on_course_id"
    t.index ["program_id"], name: "index_courses_programs_on_program_id"
  end

  create_table "current_users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer "priority", default: 0, null: false
    t.integer "attempts", default: 0, null: false
    t.text "handler", null: false
    t.text "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string "locked_by"
    t.string "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["priority", "run_at"], name: "delayed_jobs_priority"
  end

  create_table "marks", primary_key: "mark_id", force: :cascade do |t|
    t.bigint "course_id", null: false
    t.bigint "student_id", null: false
    t.bigint "fst_grade"
    t.bigint "scd_grade"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status"
    t.float "average_grade"
    t.index ["course_id"], name: "index_marks_on_course_id"
    t.index ["mark_id"], name: "index_marks_on_mark_id"
    t.index ["student_id"], name: "index_marks_on_student_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.integer "program_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "identifier"
    t.string "alert"
    t.boolean "isModule"
    t.bigint "course_id"
    t.index ["course_id"], name: "index_notifications_on_course_id"
  end

  create_table "programs", force: :cascade do |t|
    t.string "program_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
  end

  create_table "sessions", force: :cascade do |t|
    t.string "session_id", null: false
    t.text "data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "cas_ticket"
    t.index ["session_id"], name: "index_sessions_on_session_id", unique: true
    t.index ["updated_at"], name: "index_sessions_on_updated_at"
  end

  create_table "staffs", force: :cascade do |t|
    t.string "username"
    t.boolean "is_admin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "students", force: :cascade do |t|
    t.bigint "regID", null: false
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "program_name"
    t.string "forename"
    t.string "surname"
    t.bigint "program_id"
    t.integer "mean_grade"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.string "uid"
    t.string "mail"
    t.string "ou"
    t.string "dn"
    t.string "sn"
    t.string "givenname"
    t.boolean "admin", default: false
    t.index ["email"], name: "index_users_on_email"
    t.index ["username"], name: "index_users_on_username"
  end

  add_foreign_key "notifications", "courses"
end
