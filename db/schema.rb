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

ActiveRecord::Schema.define(version: 20140907070800) do

  create_table "campaigns", force: true do |t|
    t.integer  "publication_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "campaigns", ["publication_id"], name: "index_campaigns_on_publication_id"

  create_table "charges", force: true do |t|
    t.string   "token"
    t.integer  "reward_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "charges", ["reward_id"], name: "index_charges_on_reward_id"
  add_index "charges", ["user_id"], name: "index_charges_on_user_id"

  create_table "contents", force: true do |t|
    t.string   "title"
    t.text     "body"
    t.integer  "sort_value"
    t.integer  "publication_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "contents", ["publication_id"], name: "index_contents_on_publication_id"

  create_table "genres", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pg_search_documents", force: true do |t|
    t.text     "content"
    t.integer  "searchable_id"
    t.string   "searchable_type"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "publications", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "genre_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "publications", ["genre_id"], name: "index_publications_on_genre_id"
  add_index "publications", ["user_id"], name: "index_publications_on_user_id"

  create_table "reviews", force: true do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "publication_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "reviews", ["publication_id"], name: "index_reviews_on_publication_id"
  add_index "reviews", ["user_id"], name: "index_reviews_on_user_id"

  create_table "rewards", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "limit"
    t.decimal  "price",          precision: 10, scale: 2
    t.integer  "publication_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rewards", ["publication_id"], name: "index_rewards_on_publication_id"

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.text     "description"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
