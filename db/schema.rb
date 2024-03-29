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

ActiveRecord::Schema.define(:version => 20110928140920) do

  create_table "animals", :force => true do |t|
    t.string   "tag"
    t.string   "description"
    t.string   "sex"
    t.string   "age"
    t.integer  "weight"
    t.integer  "farm_id"
    t.string   "breed"
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "herd_id"
  end

  add_index "animals", ["farm_id"], :name => "index_animals_on_farm_id"
  add_index "animals", ["herd_id"], :name => "index_animals_on_herd_id"

  create_table "farms", :force => true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "acres"
  end

  add_index "farms", ["user_id"], :name => "index_farms_on_user_id"

  create_table "herds", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "farm_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "quantity"
  end

  add_index "herds", ["farm_id"], :name => "index_herds_on_farm_id"

  create_table "posts", :force => true do |t|
    t.string   "name"
    t.string   "title"
    t.text     "content"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "posts", ["user_id"], :name => "index_posts_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "userName"
    t.string   "firstName"
    t.string   "lastName"
    t.string   "phoneNumber"
    t.string   "email"
    t.boolean  "isSuperUser"
    t.string   "hashed_password"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "salt"
  end

end
