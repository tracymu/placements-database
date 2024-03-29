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

ActiveRecord::Schema.define(version: 20130916074212) do

  create_table "client_sites", force: true do |t|
    t.string   "name"
    t.string   "url"
    t.integer  "page_rank"
    t.integer  "backlinks"
    t.integer  "twitter_followers"
    t.integer  "facebook_likes"
    t.integer  "google_plus_likes"
    t.string   "twitter_handle"
    t.string   "facebook_page"
    t.string   "google_plus_page"
    t.integer  "pages_indexed"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "client_id"
    t.integer  "user_id"
  end

  create_table "clients", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "site_relationships", force: true do |t|
    t.integer  "client_site_id"
    t.integer  "target_site_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "target_sites", force: true do |t|
    t.string   "name"
    t.string   "url"
    t.boolean  "do_not_contact"
    t.string   "contact_name"
    t.integer  "page_rank"
    t.integer  "backlinks"
    t.integer  "twitter_followers"
    t.integer  "facebook_likes"
    t.integer  "google_plus_likes"
    t.string   "twitter_handle"
    t.string   "facebook_page"
    t.string   "google_plus_page"
    t.integer  "pages_indexed"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
