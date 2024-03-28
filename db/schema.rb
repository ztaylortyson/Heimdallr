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

ActiveRecord::Schema[7.1].define(version: 2024_03_28_171245) do
  create_table "lawsuits", force: :cascade do |t|
    t.string "cn"
    t.string "ct"
    t.string "forum"
    t.string "location"
    t.string "stage"
    t.string "status"
    t.string "judge"
    t.string "old_judge"
    t.string "dept"
    t.string "lroa"
    t.string "old_lroa"
    t.string "atty_for"
    t.integer "user_id"
    t.string "plt_caption"
    t.string "def_caption"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_lawsuits_on_user_id"
  end

  create_table "ocs", force: :cascade do |t|
    t.string "full_name"
    t.string "sbn"
    t.string "fname"
    t.string "address"
    t.string "phone"
    t.string "email"
    t.string "website"
    t.integer "lawsuit_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lawsuit_id"], name: "index_ocs_on_lawsuit_id"
  end

  create_table "participants", force: :cascade do |t|
    t.string "name"
    t.string "role"
    t.boolean "clt"
    t.integer "lawsuit_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "rep"
    t.index ["lawsuit_id"], name: "index_participants_on_lawsuit_id"
  end

  create_table "user_lawsuits", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "lawsuit_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lawsuit_id"], name: "index_user_lawsuits_on_lawsuit_id"
    t.index ["user_id"], name: "index_user_lawsuits_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "full_name"
    t.string "sbn"
    t.string "fname"
    t.string "address"
    t.string "wphone"
    t.string "cphone"
    t.string "website"
    t.boolean "admin"
    t.boolean "dev"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "ocs", "lawsuits"
  add_foreign_key "participants", "lawsuits"
  add_foreign_key "user_lawsuits", "lawsuits"
  add_foreign_key "user_lawsuits", "users"
end
