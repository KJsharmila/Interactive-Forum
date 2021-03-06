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

ActiveRecord::Schema.define(version: 20150311041449) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "announcements", force: true do |t|
    t.string   "title"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "announcements", ["user_id"], name: "index_announcements_on_user_id", using: :btree

  create_table "comments", force: true do |t|
    t.text     "comment_text"
    t.integer  "announcement_id"
    t.integer  "general_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["announcement_id"], name: "index_comments_on_announcement_id", using: :btree
  add_index "comments", ["general_id"], name: "index_comments_on_general_id", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "generals", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "generals", ["user_id"], name: "index_generals_on_user_id", using: :btree

  create_table "latests", force: true do |t|
    t.integer  "announcement_id"
    t.integer  "general_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "latests", ["announcement_id"], name: "index_latests_on_announcement_id", using: :btree
  add_index "latests", ["general_id"], name: "index_latests_on_general_id", using: :btree
  add_index "latests", ["user_id"], name: "index_latests_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "provider"
    t.string   "uid"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
    t.string   "image"
  end

  create_table "visits", force: true do |t|
    t.integer  "visitor_id"
    t.integer  "announcement_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "general_id"
  end

  add_index "visits", ["general_id"], name: "index_visits_on_general_id", using: :btree

end
