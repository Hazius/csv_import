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

ActiveRecord::Schema.define(version: 20141226091942) do

  create_table "csv_import_lines", force: true do |t|
    t.string   "article"
    t.string   "title"
    t.string   "size"
    t.integer  "csv_import_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "csv_import_lines", ["csv_import_id"], name: "index_csv_import_lines_on_csv_import_id"

  create_table "csv_imports", force: true do |t|
    t.string   "file"
    t.datetime "proccessed_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
