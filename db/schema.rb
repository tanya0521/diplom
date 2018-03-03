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

ActiveRecord::Schema.define(version: 20171013203335) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "faculties", force: :cascade do |t|
    t.text     "namef",      null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "financings", force: :cascade do |t|
    t.text     "name_financing",        null: false
    t.integer  "suum",                  null: false
    t.integer  "faculty_id",            null: false
    t.integer  "scholarship_period_id", null: false
    t.integer  "type_scholarship_id",   null: false
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.index ["faculty_id"], name: "index_financings_on_faculty_id", using: :btree
    t.index ["scholarship_period_id"], name: "index_financings_on_scholarship_period_id", using: :btree
    t.index ["type_scholarship_id"], name: "index_financings_on_type_scholarship_id", using: :btree
  end

  create_table "groups", force: :cascade do |t|
    t.string   "numberg",    null: false
    t.integer  "faculty_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["faculty_id"], name: "index_groups_on_faculty_id", using: :btree
  end

  create_table "order_lines", force: :cascade do |t|
    t.date     "begin_date",            null: false
    t.date     "end_date",              null: false
    t.integer  "scholarship",           null: false
    t.integer  "student_id",            null: false
    t.integer  "order_id",              null: false
    t.integer  "scholarship_period_id", null: false
    t.integer  "type_scholarship_id",   null: false
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.index ["order_id"], name: "index_order_lines_on_order_id", using: :btree
    t.index ["scholarship_period_id"], name: "index_order_lines_on_scholarship_period_id", using: :btree
    t.index ["student_id"], name: "index_order_lines_on_student_id", using: :btree
    t.index ["type_scholarship_id"], name: "index_order_lines_on_type_scholarship_id", using: :btree
  end

  create_table "orders", force: :cascade do |t|
    t.string   "number",     null: false
    t.date     "data",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "perform_data", force: :cascade do |t|
    t.integer  "quantity5",             null: false
    t.integer  "quantity4",             null: false
    t.integer  "quantity3",             null: false
    t.integer  "quantity2",             null: false
    t.integer  "student_id",            null: false
    t.integer  "scholarship_period_id", null: false
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.index ["scholarship_period_id"], name: "index_perform_data_on_scholarship_period_id", using: :btree
    t.index ["student_id"], name: "index_perform_data_on_student_id", using: :btree
  end

  create_table "role_users", force: :cascade do |t|
    t.integer  "role_id"
    t.integer  "user_id"
    t.jsonb    "data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["role_id"], name: "index_role_users_on_role_id", using: :btree
    t.index ["user_id"], name: "index_role_users_on_user_id", using: :btree
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.string   "info"
    t.text     "full_info"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "scholarship_periods", force: :cascade do |t|
    t.date     "begin",      null: false
    t.date     "end",        null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "students", force: :cascade do |t|
    t.text     "fn",         null: false
    t.text     "sn",         null: false
    t.text     "ln",         null: false
    t.string   "birthday",   null: false
    t.integer  "course",     null: false
    t.integer  "faculty_id", null: false
    t.integer  "group_id",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["faculty_id"], name: "index_students_on_faculty_id", using: :btree
    t.index ["group_id"], name: "index_students_on_group_id", using: :btree
  end

  create_table "type_scholarships", force: :cascade do |t|
    t.text     "name_financing",  null: false
    t.text     "typescholarship", null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                           null: false
    t.string   "crypted_password"
    t.string   "salt"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_me_token"
    t.datetime "remember_me_token_expires_at"
    t.string   "reset_password_token"
    t.datetime "reset_password_token_expires_at"
    t.datetime "reset_password_email_sent_at"
    t.string   "activation_state"
    t.string   "activation_token"
    t.datetime "activation_token_expires_at"
    t.index ["activation_token"], name: "index_users_on_activation_token", using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["remember_me_token"], name: "index_users_on_remember_me_token", using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", using: :btree
  end

  add_foreign_key "financings", "faculties"
  add_foreign_key "financings", "scholarship_periods"
  add_foreign_key "financings", "type_scholarships"
  add_foreign_key "groups", "faculties"
  add_foreign_key "order_lines", "orders"
  add_foreign_key "order_lines", "scholarship_periods"
  add_foreign_key "order_lines", "students"
  add_foreign_key "order_lines", "type_scholarships"
  add_foreign_key "perform_data", "scholarship_periods"
  add_foreign_key "perform_data", "students"
  add_foreign_key "role_users", "roles"
  add_foreign_key "role_users", "users"
  add_foreign_key "students", "faculties"
  add_foreign_key "students", "groups"
end
