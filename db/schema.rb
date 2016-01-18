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

ActiveRecord::Schema.define(version: 20160117110710) do

  create_table "authors", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "books", force: :cascade do |t|
    t.string   "title",        limit: 255
    t.float    "price",        limit: 24
    t.string   "isbn",         limit: 255
    t.boolean  "available"
    t.integer  "publisher_id", limit: 4,   null: false
    t.integer  "author_id",    limit: 4,   null: false
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "image",        limit: 255
    t.integer  "quantity",     limit: 4
  end

  add_index "books", ["author_id"], name: "index_books_on_author_id", using: :btree
  add_index "books", ["publisher_id"], name: "index_books_on_publisher_id", using: :btree

  create_table "orders", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.float    "price",      limit: 24
    t.string   "isbn",       limit: 255
    t.integer  "quantity",   limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "publishers", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",            limit: 255
    t.string   "password_digest",  limit: 255
    t.string   "confirm_password", limit: 255
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_foreign_key "books", "authors"
  add_foreign_key "books", "publishers"
end
