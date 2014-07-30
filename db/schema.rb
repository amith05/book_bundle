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

ActiveRecord::Schema.define(:version => 20140716185107) do

  create_table "authors", :force => true do |t|
    t.string   "name"
    t.string   "firstname"
    t.string   "middlename"
    t.string   "lastname"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "books", :force => true do |t|
    t.string   "bookno"
    t.integer  "title_id",     :precision => 38, :scale => 0
    t.integer  "mrp",          :precision => 38, :scale => 0, :default => 0
    t.string   "status"
    t.integer  "location",     :precision => 38, :scale => 0
    t.integer  "origlocation", :precision => 38, :scale => 0
    t.datetime "created_at",                                                 :null => false
    t.datetime "updated_at",                                                 :null => false
  end

  create_table "branches", :force => true do |t|
    t.string   "name"
    t.string   "address"
    t.string   "phone"
    t.string   "email"
    t.string   "category"
    t.integer  "parent_id",   :precision => 38, :scale => 0
    t.string   "parent_name"
    t.string   "card_id"
    t.integer  "city_id",     :precision => 38, :scale => 0
    t.string   "subdomain"
    t.datetime "created_at",                                 :null => false
    t.datetime "updated_at",                                 :null => false
  end

  create_table "bundle_titles", :force => true do |t|
    t.integer  "bundle_id",  :precision => 38, :scale => 0
    t.integer  "title_id",   :precision => 38, :scale => 0
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
  end

  create_table "bundles", :force => true do |t|
    t.string   "name"
    t.string   "type"
    t.integer  "amount",     :precision => 38, :scale => 0
    t.string   "category"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
  end

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.string   "category_type"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "cities", :force => true do |t|
    t.string   "name"
    t.integer  "state_id",   :precision => 38, :scale => 0
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
  end

  create_table "delivery_addresses", :force => true do |t|
    t.integer  "order_id",      :precision => 38, :scale => 0
    t.string   "address_line1"
    t.string   "address_line2"
    t.string   "pincode"
    t.integer  "city_id",       :precision => 38, :scale => 0
    t.integer  "state_id",      :precision => 38, :scale => 0
    t.string   "phone_no"
    t.datetime "created_at",                                   :null => false
    t.datetime "updated_at",                                   :null => false
  end

  create_table "languages", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "orders", :force => true do |t|
    t.integer  "user_id",     :precision => 38, :scale => 0
    t.integer  "bundle_id",   :precision => 38, :scale => 0
    t.integer  "paid_amount", :precision => 38, :scale => 0
    t.string   "state"
    t.datetime "created_at",                                 :null => false
    t.datetime "updated_at",                                 :null => false
  end

  create_table "publishers", :force => true do |t|
    t.string   "name"
    t.string   "country"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "states", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "titlebranches", :force => true do |t|
    t.integer  "title_id",   :precision => 38, :scale => 0
    t.integer  "branch_id",  :precision => 38, :scale => 0
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
  end

  create_table "titlelanguages", :force => true do |t|
    t.integer  "title_id",    :precision => 38, :scale => 0
    t.integer  "language_id", :precision => 38, :scale => 0
    t.datetime "created_at",                                 :null => false
    t.datetime "updated_at",                                 :null => false
  end

  create_table "titles", :force => true do |t|
    t.string   "title"
    t.integer  "authorid",          :precision => 38, :scale => 0
    t.integer  "publisherid",       :precision => 38, :scale => 0
    t.integer  "yearofpublication", :precision => 38, :scale => 0
    t.string   "isbn"
    t.string   "titletype"
    t.integer  "mrp",               :precision => 38, :scale => 0
    t.string   "author_name"
    t.string   "language"
    t.integer  "category_id",       :precision => 38, :scale => 0
    t.datetime "insertdate"
    t.datetime "created_at",                                       :null => false
    t.datetime "updated_at",                                       :null => false
  end

  create_table "transactions", :force => true do |t|
    t.integer  "amount",     :precision => 38, :scale => 0
    t.string   "email"
    t.string   "status"
    t.integer  "order_id",   :precision => 38, :scale => 0
    t.string   "phone_no"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                                                 :default => "", :null => false
    t.string   "encrypted_password",                                    :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :precision => 38, :scale => 0, :default => 0,  :null => false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                                            :null => false
    t.datetime "updated_at",                                                            :null => false
    t.string   "address_line1"
    t.string   "address_line2"
    t.string   "pincode"
    t.integer  "city_id",                :precision => 38, :scale => 0
    t.integer  "state_id",               :precision => 38, :scale => 0
    t.string   "phone_no"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "i_users_reset_password_token", :unique => true

end
