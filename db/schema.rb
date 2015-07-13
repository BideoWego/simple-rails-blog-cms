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

ActiveRecord::Schema.define(version: 20150712045320) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "authors", force: :cascade do |t|
    t.string   "first",           limit: 50
    t.string   "last",            limit: 50
    t.string   "username",        limit: 50
    t.string   "email",                      default: "", null: false
    t.string   "password_digest"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
  end

  add_index "authors", ["username"], name: "index_authors_on_username", using: :btree

  create_table "authors_comments", force: :cascade do |t|
    t.integer "author_id"
    t.integer "comment_id"
  end

  add_index "authors_comments", ["author_id", "comment_id"], name: "index_authors_comments_on_author_id_and_comment_id", using: :btree

  create_table "authors_posts", force: :cascade do |t|
    t.integer "author_id"
    t.integer "post_id"
  end

  add_index "authors_posts", ["author_id", "post_id"], name: "index_authors_posts_on_author_id_and_post_id", using: :btree

  create_table "comments", force: :cascade do |t|
    t.integer  "post_id"
    t.integer  "author_id"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "comments", ["author_id"], name: "index_comments_on_author_id", using: :btree
  add_index "comments", ["post_id"], name: "index_comments_on_post_id", using: :btree

  create_table "comments_posts", force: :cascade do |t|
    t.integer "comment_id"
    t.integer "post_id"
  end

  add_index "comments_posts", ["comment_id", "post_id"], name: "index_comments_posts_on_comment_id_and_post_id", using: :btree

  create_table "posts", force: :cascade do |t|
    t.integer  "author_id"
    t.string   "title"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "posts", ["author_id"], name: "index_posts_on_author_id", using: :btree

end
