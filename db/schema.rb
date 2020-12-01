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

ActiveRecord::Schema.define(version: 2020_12_01_093954) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "game_sheets", force: :cascade do |t|
    t.string "title", null: false
    t.text "description", null: false
    t.integer "nb_players_max", null: false
    t.integer "nb_players_min", null: false
    t.integer "playing_time", null: false
    t.integer "age_min", null: false
    t.string "languages", null: false
    t.date "publication_date", null: false
    t.integer "difficulty", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "games", force: :cascade do |t|
    t.string "stock_id", null: false
    t.string "status", default: "en stock", null: false
    t.string "conditions", default: "comme neuf", null: false
    t.float "weight"
    t.float "height"
    t.float "length"
    t.float "width"
    t.integer "nb_times_rent", default: 0, null: false
    t.bigint "game_sheet_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_sheet_id"], name: "index_games_on_game_sheet_id"
  end

end
