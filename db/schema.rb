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

ActiveRecord::Schema.define(version: 20140605145821) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admissions", force: true do |t|
    t.integer  "cohort_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "assignments", force: true do |t|
    t.string  "title"
    t.text    "description"
    t.integer "cohort_id"
  end

  create_table "cohorts", force: true do |t|
    t.integer "course_id"
    t.integer "location_id"
    t.integer "instructor_id"
    t.date    "start_date"
    t.date    "end_date"
  end

  create_table "comments", force: true do |t|
    t.integer  "user_id"
    t.text     "content"
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "courses", force: true do |t|
    t.string "name"
    t.text   "description"
  end

  create_table "locations", force: true do |t|
    t.string "city"
    t.string "state"
  end

  create_table "roles", force: true do |t|
    t.string "name"
  end

  create_table "submissions", force: true do |t|
    t.integer  "user_id"
    t.string   "title"
    t.text     "description"
    t.integer  "assignment_id"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string  "first_name"
    t.string  "last_name"
    t.string  "email"
    t.string  "password_digest"
    t.integer "role_id"
    t.string  "facebook_token"
  end

end
