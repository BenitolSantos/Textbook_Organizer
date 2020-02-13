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

ActiveRecord::Schema.define(version: 2019_12_18_214626) do

  create_table "subjects", force: :cascade do |t|
    t.string "name"
  end

  create_table "textbooks", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.integer "pages"
    t.integer "cost"
    t.integer "subject_id"
  end

  create_table "user_subjects", force: :cascade do |t|
    t.integer "user_id"
    t.integer "subject_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "user_name"
    t.integer "age"
    t.string "image"
    t.string "uid"
    t.integer "email"
    t.boolean "admin", default: false #keep as hidden field for later Dustin (2/13/2020) said remove admins altogether MVP minimal viable product. Make subjects for everyone so facebook omniauth can work
    t.string "password_digest"
  end

end
