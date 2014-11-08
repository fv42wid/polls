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

ActiveRecord::Schema.define(version: 20141108203239) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bills", force: true do |t|
    t.string   "bill_id"
    t.string   "bill_uri"
    t.string   "title"
    t.string   "sponsor_uri"
    t.date     "introduced_date"
    t.string   "cosponsors"
    t.string   "committees"
    t.date     "latest_major_action_date"
    t.text     "latest_major_action"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "body"
    t.text     "summary"
  end

  create_table "rep_votes", force: true do |t|
    t.integer  "rep_id"
    t.integer  "bill_id"
    t.string   "vote"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reps", force: true do |t|
    t.string   "nyt_id"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "rep_url"
    t.string   "role"
    t.string   "gender"
    t.string   "party"
    t.string   "twitter_id"
    t.string   "youtube_id"
    t.integer  "seniority"
    t.date     "next_election"
    t.string   "govtrack_id"
    t.string   "state"
    t.string   "district"
    t.date     "start_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_polls", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "bill_id"
    t.string   "user_zip"
    t.string   "user_vote"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "zip"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "votes", force: true do |t|
    t.integer  "bill_i"
    t.integer  "user_id"
    t.string   "user_zip"
    t.string   "vote"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
