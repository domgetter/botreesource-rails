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

ActiveRecord::Schema.define(version: 20130722070329) do

  create_table "categories", force: true do |t|
    t.integer  "type_id"
    t.string   "name",       limit: 100
    t.string   "image"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "status"
  end

  create_table "images", force: true do |t|
    t.string   "permalink"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "product_id"
    t.integer  "category_id"
    t.integer  "type_id"
    t.string   "img_file_name"
    t.string   "img_content_type"
    t.integer  "img_file_size"
    t.datetime "img_updated_at"
    t.boolean  "default",            default: false, null: false
  end

  create_table "products", force: true do |t|
    t.integer  "category_id"
    t.string   "identifier"
    t.string   "name"
    t.string   "description"
    t.string   "length"
    t.string   "width"
    t.string   "height"
    t.integer  "position"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "types", force: true do |t|
    t.string   "name",       limit: 100
    t.string   "image"
    t.integer  "position",               default: 0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "status"
  end

  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "hashed_password", limit: 40
    t.string   "salt",            limit: 40
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
