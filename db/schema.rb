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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130203135145) do

  create_table "companies", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "city"
    t.string   "street"
    t.integer  "number"
    t.integer  "cap"
    t.string   "link"
    t.text     "description"
    t.date     "funded"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
    t.string   "password_digest"
    t.string   "remember_token"
    t.string   "password_reset_token"
    t.datetime "password_reset_sent_at"
  end

  add_index "companies", ["remember_token"], :name => "index_companies_on_remember_token"

  create_table "jobs", :force => true do |t|
    t.string   "title"
    t.string   "company_id"
    t.string   "address"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.text     "jobDescription"
    t.text     "companyDescription"
    t.text     "desiredSkills"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.string   "remember_token_user"
    t.string   "uid"
    t.string   "provider"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
  end

  add_index "users", ["remember_token_user"], :name => "index_users_on_remember_token_user"

end
