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

ActiveRecord::Schema.define(version: 2019_07_08_071641) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accelerometers", force: :cascade do |t|
    t.bigint "wearable_label_id"
    t.decimal "x_value"
    t.decimal "y_value"
    t.decimal "z_value"
    t.datetime "timest"
    t.index ["wearable_label_id"], name: "index_accelerometers_on_wearable_label_id"
  end

  create_table "activities", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "controllers", force: :cascade do |t|
    t.string "pages"
    t.string "home"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "devices", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "gyroscopes", force: :cascade do |t|
    t.bigint "wearable_label_id"
    t.decimal "x_value"
    t.decimal "y_value"
    t.decimal "z_value"
    t.datetime "timest"
    t.index ["wearable_label_id"], name: "index_gyroscopes_on_wearable_label_id"
  end

  create_table "wearable_labels", force: :cascade do |t|
    t.bigint "device_id"
    t.bigint "activity_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "time_end"
    t.index ["activity_id"], name: "index_wearable_labels_on_activity_id"
    t.index ["device_id"], name: "index_wearable_labels_on_device_id"
  end

end
