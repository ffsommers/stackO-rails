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

ActiveRecord::Schema.define(version: 20161116043411) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.text     "body"
    t.boolean  "best_flag"
    t.integer  "user_id"
    t.integer  "post_id"
    t.string   "commentable_type"
    t.integer  "commentable_id"
    t.integer  "voteable_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["commentable_type", "commentable_id"], name: "index_answers_on_commentable_type_and_commentable_id", using: :btree
    t.index ["voteable_id"], name: "index_answers_on_voteable_id", using: :btree
  end

  create_table "comments", force: :cascade do |t|
    t.text     "body"
    t.integer  "user_id"
    t.integer  "commentable_id"
    t.string   "comentable_type"
    t.string   "voteable_type"
    t.integer  "voteable_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["voteable_type", "voteable_id"], name: "index_comments_on_voteable_type_and_voteable_id", using: :btree
  end

  create_table "posts", force: :cascade do |t|
    t.string   "title"
    t.text     "body"
    t.integer  "user_id"
    t.string   "comentable_type"
    t.integer  "comentable_id"
    t.string   "voteable_type"
    t.integer  "voteable_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["comentable_type", "comentable_id"], name: "index_posts_on_comentable_type_and_comentable_id", using: :btree
    t.index ["voteable_type", "voteable_id"], name: "index_posts_on_voteable_type_and_voteable_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "votes", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "voteable_id"
    t.string   "voteable_type"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

end
