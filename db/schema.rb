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

ActiveRecord::Schema.define(version: 20190418012712) do

  create_table "companies", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "add_ln1"
    t.string   "add_ln2"
    t.string   "suite"
    t.string   "city_state_zip"
  end

  create_table "entries", force: :cascade do |t|
    t.string   "description"
    t.float    "time_worked"
    t.integer  "task_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["task_id"], name: "index_entries_on_task_id"
  end

  create_table "invoices", force: :cascade do |t|
    t.date     "billing_start"
    t.date     "billing_end"
    t.string   "contact"
    t.integer  "company_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "task_id"
    t.string   "notes"
    t.float    "subtotal"
    t.float    "adjustments",   default: 0.0
    t.float    "total"
    t.boolean  "paid"
    t.string   "project"
    t.date     "due"
    t.index ["company_id"], name: "index_invoices_on_company_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.string   "description"
    t.float    "rate"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "invoice_id"
    t.float    "hours"
    t.float    "total"
    t.index ["invoice_id"], name: "index_tasks_on_invoice_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "f_name"
    t.string   "l_name"
    t.string   "email"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "password_digest"
    t.integer  "company_id"
    t.string   "role"
    t.string   "password_reset_token"
    t.string   "password_reset_send_at"
    t.index ["company_id"], name: "index_users_on_company_id"
  end

end
