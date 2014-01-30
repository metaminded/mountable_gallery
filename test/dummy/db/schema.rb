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

ActiveRecord::Schema.define(version: 20120612082724) do

  create_table "galleries", force: true do |t|
    t.string   "title"
    t.string   "sid"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "gallery_memberships", force: true do |t|
    t.integer  "gallery_id"
    t.integer  "artifact_id"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "gallery_memberships", ["artifact_id"], name: "index_gallery_memberships_on_artifact_id"
  add_index "gallery_memberships", ["gallery_id"], name: "index_gallery_memberships_on_gallery_id"

  create_table "mountable_gallery_artifacts", force: true do |t|
    t.string   "title"
    t.string   "sid"
    t.string   "file"
    t.string   "icon"
    t.string   "type"
    t.text     "caption"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
