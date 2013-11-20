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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20131120155840) do

  create_table "articles", :force => true do |t|
    t.integer  "feed_id"
    t.string   "title"
    t.text     "content"
    t.text     "link"
    t.text     "description"
    t.string   "author"
    t.text     "comment_link"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.datetime "posted_at"
  end

  create_table "feeds", :force => true do |t|
    t.string   "title"
    t.text     "image_link"
    t.text     "link"
    t.text     "rss"
    t.string   "provider"
    t.string   "category"
    t.text     "description"
    t.string   "image_title"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.datetime "last_modified"
    t.string   "guid"
  end

  create_table "labels", :force => true do |t|
    t.integer  "article_id"
    t.integer  "user_id"
    t.boolean  "archive"
    t.boolean  "bookmark"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "labels", ["article_id"], :name => "index_tags_on_article_id"
  add_index "labels", ["user_id"], :name => "index_tags_on_user_id"

  create_table "subscriptions", :force => true do |t|
    t.integer  "feed_id"
    t.integer  "user_id"
    t.string   "category"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.boolean  "show_on_profile"
  end

  add_index "subscriptions", ["feed_id"], :name => "index_subscriptions_on_feed_id"
  add_index "subscriptions", ["user_id"], :name => "index_subscriptions_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0,  :null => false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "role"
    t.text     "image"
    t.string   "bio"
    t.string   "provider"
    t.string   "uid"
  end

  add_index "users", ["confirmation_token"], :name => "index_users_on_confirmation_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
