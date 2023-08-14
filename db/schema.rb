# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_08_14_211839) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "postgis"

  create_table "stockers", force: :cascade do |t|
    t.date "date_stocked"
    t.string "species"
    t.integer "quantity"
    t.decimal "avg_length"
    t.string "water_name"
    t.string "county"
    t.geometry "lonlat", limit: {:srid=>0, :type=>"st_point"}
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "interpreted_address"
    t.string "state"
    t.integer "verification_status", default: 0
    t.integer "verification_problem"
    t.index ["lonlat"], name: "index_stockers_on_lonlat", using: :gist
  end

  create_table "tasks", force: :cascade do |t|
    t.string "description", limit: 200
    t.boolean "completed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
