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

ActiveRecord::Schema[7.1].define(version: 2024_04_22_113901) do
  create_table "first_people", force: :cascade do |t|
    t.string "name"
    t.boolean "is_base"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "learned_lists", force: :cascade do |t|
    t.text "text"
    t.integer "is_learned"
    t.integer "main_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "mains", force: :cascade do |t|
    t.string "title"
    t.text "first_comment"
    t.text "second_comment"
    t.integer "user_id"
    t.integer "vol"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "is_remote"
    t.boolean "did_send"
  end

  create_table "points", force: :cascade do |t|
    t.string "text"
    t.integer "is_good"
    t.integer "main_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "to_dos", force: :cascade do |t|
    t.string "name"
    t.datetime "time_limit"
    t.boolean "is_finished", default: false, null: false
    t.integer "main_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name"
    t.string "kana"
    t.text "sign"
    t.integer "vol", default: 0, null: false
    t.integer "first_person_id", default: 0
    t.string "affiliation"
    t.integer "grade"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_shareable_zoho"
    t.boolean "is_shared_zoho"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "what_to_dos", force: :cascade do |t|
    t.string "name"
    t.time "from_time"
    t.time "to_time"
    t.integer "main_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
