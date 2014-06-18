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

ActiveRecord::Schema.define(:version => 20140618150507) do

  create_table "employees", :force => true do |t|
    t.string   "name",            :limit => 100
    t.integer  "age"
    t.string   "email_id",        :limit => 100
    t.string   "location",        :limit => 100
    t.string   "designation",     :limit => 100
    t.string   "department",      :limit => 100
    t.datetime "soft_deleted_at"
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
  end

  add_index "employees", ["department"], :name => "fulltext_department"
  add_index "employees", ["designation"], :name => "fulltext_designation"
  add_index "employees", ["email_id"], :name => "fulltext_email"
  add_index "employees", ["location"], :name => "fulltext_location"
  add_index "employees", ["name"], :name => "fulltext_name"
  add_index "employees", ["soft_deleted_at"], :name => "index_employees_on_soft_deleted_at"

end
