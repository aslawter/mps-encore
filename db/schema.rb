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

ActiveRecord::Schema.define(version: 20140808175316) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "contacts", force: true do |t|
    t.integer  "organization_id",                null: false
    t.string   "organization_type",              null: false
    t.string   "first_name",        default: "", null: false
    t.string   "last_name",         default: "", null: false
    t.string   "title",             default: "", null: false
    t.string   "email",             default: "", null: false
    t.string   "phone",             default: "", null: false
    t.string   "fax",               default: "", null: false
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  add_index "contacts", ["email"], name: "index_contacts_on_email", unique: true, using: :btree
  add_index "contacts", ["organization_id", "organization_type"], name: "index_contacts_on_organization_id_and_organization_type", using: :btree

  create_table "contacts_performances", id: false, force: true do |t|
    t.integer  "performance_id",              null: false
    t.integer  "contact_id",                  null: false
    t.string   "role",           default: "", null: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "contacts_performances", ["contact_id"], name: "index_contacts_performances_on_contact_id", using: :btree
  add_index "contacts_performances", ["performance_id"], name: "index_contacts_performances_on_performance_id", using: :btree

  create_table "customers", force: true do |t|
    t.string   "name",       default: "",   null: false
    t.boolean  "federal",    default: true, null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "customers", ["name"], name: "index_customers_on_name", unique: true, using: :btree

  create_table "partners", force: true do |t|
    t.string   "name",       default: "",   null: false
    t.string   "website",    default: "",   null: false
    t.boolean  "enabled",    default: true, null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "partners", ["name"], name: "index_partners_on_name", unique: true, using: :btree
  add_index "partners", ["website"], name: "index_partners_on_website", unique: true, using: :btree

  create_table "performances", force: true do |t|
    t.string   "title"
    t.integer  "customer_id",                                              null: false
    t.integer  "partner_id",                                               null: false
    t.integer  "user_id",                                                  null: false
    t.boolean  "prime",                                    default: false, null: false
    t.string   "contract_type",                            default: "",    null: false
    t.string   "contract_number",                          default: "",    null: false
    t.decimal  "value",           precision: 10, scale: 2, default: 0.0,   null: false
    t.date     "starts_on",                                                null: false
    t.date     "ends_on",                                                  null: false
    t.datetime "created_at",                                               null: false
    t.datetime "updated_at",                                               null: false
  end

  add_index "performances", ["customer_id"], name: "index_performances_on_customer_id", using: :btree
  add_index "performances", ["partner_id"], name: "index_performances_on_partner_id", using: :btree
  add_index "performances", ["user_id"], name: "index_performances_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                           null: false
    t.string   "password_digest",                 null: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "first_name",      default: "",    null: false
    t.string   "last_name",       default: "",    null: false
    t.boolean  "admin",           default: false, null: false
    t.boolean  "approver",        default: false, null: false
    t.boolean  "active",          default: false, null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

end