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

ActiveRecord::Schema.define(version: 2022_02_02_015129) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bogs", force: :cascade do |t|
    t.string "name"
    t.float "ph"
    t.boolean "radioactive", default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "frogs", force: :cascade do |t|
    t.string "name"
    t.integer "age"
    t.boolean "singing"
    t.bigint "bog_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["bog_id"], name: "index_frogs_on_bog_id"
  end

  add_foreign_key "frogs", "bogs"
end
