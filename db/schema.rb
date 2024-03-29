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

ActiveRecord::Schema[7.0].define(version: 2024_03_20_125925) do
  create_table "day_tasks", charset: "utf8", force: :cascade do |t|
    t.date "start_time", null: false
    t.bigint "task_id", null: false
    t.bigint "user_id", null: false
    t.bigint "family_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "completed", default: false, null: false
    t.index ["family_id"], name: "index_day_tasks_on_family_id"
    t.index ["task_id"], name: "index_day_tasks_on_task_id"
    t.index ["user_id"], name: "index_day_tasks_on_user_id"
  end

  create_table "families", charset: "utf8", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "family_users", charset: "utf8", force: :cascade do |t|
    t.bigint "family_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["family_id"], name: "index_family_users_on_family_id"
    t.index ["user_id"], name: "index_family_users_on_user_id"
  end

  create_table "schedules", charset: "utf8", force: :cascade do |t|
    t.string "event", null: false
    t.datetime "start_time", null: false
    t.datetime "end_time", null: false
    t.bigint "family_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["family_id"], name: "index_schedules_on_family_id"
    t.index ["user_id"], name: "index_schedules_on_user_id"
  end

  create_table "tasks", charset: "utf8", force: :cascade do |t|
    t.string "content", null: false
    t.integer "category_id", null: false
    t.bigint "family_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["family_id"], name: "index_tasks_on_family_id"
  end

  create_table "users", charset: "utf8", force: :cascade do |t|
    t.string "nickname", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer "invitation_limit"
    t.string "invited_by_type"
    t.bigint "invited_by_id"
    t.integer "invitations_count", default: 0
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["invitation_token"], name: "index_users_on_invitation_token", unique: true
    t.index ["invited_by_id"], name: "index_users_on_invited_by_id"
    t.index ["invited_by_type", "invited_by_id"], name: "index_users_on_invited_by"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "day_tasks", "families"
  add_foreign_key "day_tasks", "tasks"
  add_foreign_key "day_tasks", "users"
  add_foreign_key "family_users", "families"
  add_foreign_key "family_users", "users"
  add_foreign_key "schedules", "families"
  add_foreign_key "schedules", "users"
  add_foreign_key "tasks", "families"
end
