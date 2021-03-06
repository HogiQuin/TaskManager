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

ActiveRecord::Schema.define(version: 20150810184035) do

  create_table "courses", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.integer  "semester_id", limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "courses_groups", force: :cascade do |t|
    t.integer "course_id", limit: 4
    t.integer "group_id",  limit: 4
  end

  create_table "courses_users", force: :cascade do |t|
    t.integer "course_id", limit: 4
    t.integer "user_id",   limit: 4
  end

  create_table "groups", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.integer  "semester_id", limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "groups_tasks", force: :cascade do |t|
    t.integer "group_id", limit: 4
    t.integer "task_id",  limit: 4
  end

  create_table "groups_users", force: :cascade do |t|
    t.integer "group_id", limit: 4
    t.integer "user_id",  limit: 4
  end

  create_table "semesters", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "status",     limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "tasks", force: :cascade do |t|
    t.string   "title",           limit: 255
    t.string   "description",     limit: 255
    t.datetime "date_to_deliver"
    t.integer  "course_id",       limit: 4
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "user_number",     limit: 255
    t.string   "first_name",      limit: 255
    t.string   "last_name",       limit: 255
    t.string   "password_digest", limit: 255
    t.string   "email",           limit: 255
    t.string   "phone",           limit: 255
    t.string   "role",            limit: 255
    t.integer  "age",             limit: 4
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

end
