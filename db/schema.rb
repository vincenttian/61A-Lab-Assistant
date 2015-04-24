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

ActiveRecord::Schema.define(version: 20150424024357) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string   "confirmation_token"
    t.string   "unlock_token"
  end

  add_index "admins", ["confirmation_token"], name: "index_admins_on_confirmation_token", unique: true, using: :btree
  add_index "admins", ["email"], name: "index_admins_on_email", unique: true, using: :btree
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true, using: :btree
  add_index "admins", ["unlock_token"], name: "index_admins_on_unlock_token", unique: true, using: :btree

  create_table "check_in_forms", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "teaching_assistant"
    t.string   "SID"
    t.integer  "event"
    t.integer  "course_id"
  end

  add_index "check_in_forms", ["course_id"], name: "index_check_in_forms_on_course_id", using: :btree

  create_table "contracts", force: true do |t|
    t.integer  "lab_assistant_id"
    t.string   "email_address"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "student_id"
    t.string   "times_assisted"
    t.string   "units"
    t.string   "lab_assisting_rules"
    t.string   "conditions_to_view_anothers_code"
    t.string   "abide_by_rules"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "contracts", ["lab_assistant_id"], name: "index_contracts_on_lab_assistant_id", using: :btree

  create_table "courses", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "lab_assistants", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "teaching_assistant_id"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.boolean  "validated",              default: false
    t.integer  "preferred_lab_times",    default: [],                 array: true
    t.integer  "SID"
    t.integer  "course_id"
  end

  add_index "lab_assistants", ["course_id"], name: "index_lab_assistants_on_course_id", using: :btree
  add_index "lab_assistants", ["teaching_assistant_id"], name: "index_lab_assistants_on_teaching_assistant_id", using: :btree

  create_table "lab_assistants_times", force: true do |t|
    t.integer "lab_time_id"
    t.integer "lab_assistant_id"
  end

  add_index "lab_assistants_times", ["lab_assistant_id"], name: "index_lab_assistants_times_on_lab_assistant_id", using: :btree
  add_index "lab_assistants_times", ["lab_time_id"], name: "index_lab_assistants_times_on_lab_time_id", using: :btree

  create_table "lab_times", force: true do |t|
    t.time     "open"
    t.time     "close"
    t.date     "day"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "course_id"
  end

  add_index "lab_times", ["course_id"], name: "index_lab_times_on_course_id", using: :btree

  create_table "lab_times_teaching_assistants", force: true do |t|
    t.integer "lab_time_id"
    t.integer "teaching_assistant_id"
  end

  add_index "lab_times_teaching_assistants", ["lab_time_id"], name: "index_lab_times_teaching_assistants_on_lab_time_id", using: :btree
  add_index "lab_times_teaching_assistants", ["teaching_assistant_id"], name: "index_lab_times_teaching_assistants_on_teaching_assistant_id", using: :btree

  create_table "teaching_assistants", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email"
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string   "confirmation_token"
    t.string   "unlock_token"
    t.string   "first_name"
    t.string   "last_name"
    t.boolean  "validated",              default: false
    t.integer  "course_id"
  end

  add_index "teaching_assistants", ["confirmation_token"], name: "index_teaching_assistants_on_confirmation_token", unique: true, using: :btree
  add_index "teaching_assistants", ["course_id"], name: "index_teaching_assistants_on_course_id", using: :btree
  add_index "teaching_assistants", ["email"], name: "index_teaching_assistants_on_email", unique: true, using: :btree
  add_index "teaching_assistants", ["reset_password_token"], name: "index_teaching_assistants_on_reset_password_token", unique: true, using: :btree
  add_index "teaching_assistants", ["unlock_token"], name: "index_teaching_assistants_on_unlock_token", unique: true, using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.integer  "role"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
