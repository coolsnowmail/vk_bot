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

ActiveRecord::Schema.define(version: 20170225051312) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string   "name"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "bots", force: :cascade do |t|
    t.integer  "task_id"
    t.string   "description"
    t.string   "login_vk"
    t.string   "password_vk"
    t.string   "access_token"
    t.boolean  "status",       default: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "bots", ["task_id"], name: "index_bots_on_task_id", using: :btree

  create_table "comment_trakings", force: :cascade do |t|
    t.integer  "bot_id"
    t.integer  "comment_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "comment_trakings", ["bot_id"], name: "index_comment_trakings_on_bot_id", using: :btree

  create_table "comments", force: :cascade do |t|
    t.integer  "task_id"
    t.string   "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "comments", ["task_id"], name: "index_comments_on_task_id", using: :btree

  create_table "groups", force: :cascade do |t|
    t.integer  "task_id"
    t.string   "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "groups", ["task_id"], name: "index_groups_on_task_id", using: :btree

  create_table "like_trakings", force: :cascade do |t|
    t.integer  "bot_id"
    t.string   "vk_user_id"
    t.integer  "offset"
    t.string   "vk_group_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "like_trakings", ["bot_id"], name: "index_like_trakings_on_bot_id", using: :btree

  create_table "message_trakings", force: :cascade do |t|
    t.integer  "bot_id"
    t.string   "vk_user_id"
    t.integer  "message_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "message_trakings", ["bot_id"], name: "index_message_trakings_on_bot_id", using: :btree

  create_table "messages", force: :cascade do |t|
    t.integer  "task_id"
    t.string   "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "messages", ["task_id"], name: "index_messages_on_task_id", using: :btree

  create_table "tasks", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "tasks", ["user_id"], name: "index_tasks_on_user_id", using: :btree

  create_table "user_groups", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "description"
    t.string   "url"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "user_groups", ["user_id"], name: "index_user_groups_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.integer  "admin_id"
    t.string   "name"
    t.string   "password_digest"
    t.string   "vk_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "users", ["admin_id"], name: "index_users_on_admin_id", using: :btree

end
