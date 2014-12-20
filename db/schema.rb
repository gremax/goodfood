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

ActiveRecord::Schema.define(version: 20141217150821) do

  create_table "categories", force: true do |t|
    t.string "name"
    t.string "ancestry"
  end

  add_index "categories", ["ancestry"], name: "index_categories_on_ancestry"

  create_table "recipes", force: true do |t|
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "name",                    null: false
    t.text     "body",                    null: false
    t.text     "ingredients",             null: false
    t.integer  "views",       default: 0
    t.integer  "category_id"
    t.integer  "user_id"
  end

  add_index "recipes", ["category_id"], name: "index_recipes_on_category_id"
  add_index "recipes", ["name"], name: "index_recipes_on_name"
  add_index "recipes", ["user_id"], name: "index_recipes_on_user_id"

  create_table "users", force: true do |t|
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "name",                            null: false
    t.string   "email",                           null: false
    t.string   "password_digest",                 null: false
    t.boolean  "admin",           default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["name"], name: "index_users_on_name"

end
