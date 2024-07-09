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

ActiveRecord::Schema[7.1].define(version: 2024_07_03_152733) do
  create_table "clients", force: :cascade do |t|
    t.string "fname"
    t.string "mname"
    t.string "lname"
    t.string "email"
    t.string "phone"
    t.string "address"
    t.string "city"
    t.string "state"
    t.string "zip"
    t.date "dob"
    t.string "ssn"
    t.string "gender"
    t.boolean "married"
    t.text "summary"
    t.date "doh"
    t.date "dot"
    t.string "job_title"
    t.string "work_email"
    t.boolean "exempt"
    t.boolean "commissions"
    t.integer "pay_type"
    t.decimal "pay_rate", precision: 8, scale: 2
    t.string "emergency_contact"
    t.string "emergency_phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "courtdates", force: :cascade do |t|
    t.date "complaint"
    t.string "old_complaint"
    t.date "paga"
    t.string "old_paga"
    t.date "answer"
    t.string "old_answer"
    t.date "cmc"
    t.string "old_cmc"
    t.date "first_expert_exchange"
    t.date "second_expert_exchange"
    t.date "discovery_cutoff"
    t.string "old_discovery_cutoff"
    t.date "trc"
    t.string "old_trc"
    t.date "trial"
    t.string "old_trial"
    t.integer "lawsuit_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lawsuit_id"], name: "index_courtdates_on_lawsuit_id"
  end

  create_table "depositions", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "depo_date"
    t.time "depo_time"
    t.string "propounding_party"
    t.string "title"
    t.integer "lawsuit_id"
    t.boolean "doc_req"
    t.string "deponent"
  end

  create_table "discoveries", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "group"
    t.date "date_served"
    t.string "propounding_party"
    t.string "responding_party"
    t.integer "req_or_resp"
    t.integer "discovery"
    t.integer "set"
    t.integer "service"
    t.date "resp_due"
    t.text "atty_notes"
    t.integer "extension_id"
    t.integer "lawsuit_id"
  end

  create_table "journals", force: :cascade do |t|
    t.integer "lawsuit_id", null: false
    t.text "entry"
    t.string "binder"
    t.string "issue"
    t.decimal "costs", precision: 8, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status"
    t.date "due_date"
    t.string "source"
    t.index ["lawsuit_id"], name: "index_journals_on_lawsuit_id"
  end

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
    t.string "dname"
    t.string "ct_county"
    t.string "ct_street_address"
    t.string "ct_mail_address"
    t.string "ct_city_zip"
    t.string "ct_branch"
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
    t.string "status"
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
    t.string "type"
    t.string "address"
    t.string "phone"
    t.string "email"
    t.index ["lawsuit_id"], name: "index_participants_on_lawsuit_id"
  end

  create_table "responses", force: :cascade do |t|
    t.string "group"
    t.string "responding_party"
    t.string "propounding_party"
    t.string "discovery_type"
    t.string "discovery_set"
    t.integer "lawsuit_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lawsuit_id"], name: "index_responses_on_lawsuit_id"
  end

  create_table "user_clients", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "client_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_user_clients_on_client_id"
    t.index ["user_id"], name: "index_user_clients_on_user_id"
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

  add_foreign_key "courtdates", "lawsuits"
  add_foreign_key "journals", "lawsuits"
  add_foreign_key "ocs", "lawsuits"
  add_foreign_key "participants", "lawsuits"
  add_foreign_key "responses", "lawsuits"
  add_foreign_key "user_clients", "clients"
  add_foreign_key "user_clients", "users"
  add_foreign_key "user_lawsuits", "lawsuits"
  add_foreign_key "user_lawsuits", "users"
end
