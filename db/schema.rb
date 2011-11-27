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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20111127231254) do

  create_table "addresses", :force => true do |t|
    t.string   "description"
    t.string   "zip_code"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.integer  "institution_id"
    t.integer  "contact_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "addresses", ["contact_id"], :name => "index_addresses_on_contact_id"
  add_index "addresses", ["institution_id"], :name => "index_addresses_on_institution_id"

  create_table "contacts", :force => true do |t|
    t.integer  "institution_id"
    t.string   "name"
    t.date     "dob"
    t.string   "site"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "emails", :force => true do |t|
    t.string   "address"
    t.integer  "contact_id"
    t.integer  "institution_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "institutions", :force => true do |t|
    t.string   "name"
    t.text     "mission"
    t.date     "fundation_at"
    t.string   "site"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "phones", :force => true do |t|
    t.string   "number"
    t.string   "phone_type"
    t.integer  "institution_id"
    t.integer  "contact_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "phones", ["contact_id"], :name => "index_phones_on_contact_id"
  add_index "phones", ["institution_id"], :name => "index_phones_on_institution_id"

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "email"
    t.string   "crypted_password"
    t.string   "password_salt"
    t.string   "perishable_token"
    t.string   "persistence_token"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
