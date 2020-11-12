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

ActiveRecord::Schema.define(version: 2020_11_12_063940) do

  create_table "categories", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "choices", force: :cascade do |t|
    t.integer "year"
    t.string "season"
    t.integer "city_id"
    t.string "choice"
    t.text "summary"
    t.string "choice_type"
    t.string "result"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "region"
    t.integer "category_id"
    t.index ["city_id"], name: "index_choices_on_city_id"
  end

  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "decisions", force: :cascade do |t|
    t.integer "user_id"
    t.integer "choice_id"
    t.string "decision"
    t.string "link"
    t.text "annotation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["choice_id"], name: "index_decisions_on_choice_id"
    t.index ["user_id"], name: "index_decisions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.integer "city_id"
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.boolean "admin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "group"
    t.string "username"
    t.index ["city_id"], name: "index_users_on_city_id"
  end

end
