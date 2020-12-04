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

ActiveRecord::Schema.define(version: 2020_12_04_094712) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "addresses", force: :cascade do |t|
    t.string "street"
    t.string "zipcode"
    t.string "city"
    t.string "country"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_addresses_on_user_id"
  end

  create_table "carts", force: :cascade do |t|
    t.string "statuses", default: "panier actuel", null: false
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_carts_on_user_id"
  end

  create_table "game_sheets", force: :cascade do |t|
    t.string "title", null: false
    t.text "description", null: false
    t.integer "nb_players_max", null: false
    t.integer "nb_players_min", null: false
    t.integer "playing_time", null: false
    t.integer "age_min", null: false
    t.string "language", null: false
    t.date "publication_date", null: false
    t.integer "difficulty", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "games", force: :cascade do |t|
    t.string "stock_id", null: false
    t.string "status", default: "en stock", null: false
    t.string "condition", default: "comme neuf", null: false
    t.float "weight"
    t.float "height"
    t.float "length"
    t.float "width"
    t.integer "nb_times_rent", default: 0, null: false
    t.bigint "game_sheet_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "cart_id"
    t.index ["cart_id"], name: "index_games_on_cart_id"
    t.index ["game_sheet_id"], name: "index_games_on_game_sheet_id"
  end

  create_table "order_lines", force: :cascade do |t|
    t.bigint "order_id"
    t.bigint "game_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_order_lines_on_game_id"
    t.index ["order_id"], name: "index_order_lines_on_order_id"
  end

  create_table "orders", force: :cascade do |t|
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "shippings", force: :cascade do |t|
    t.decimal "price", null: false
    t.string "provider", null: false
    t.string "trakcing_number"
    t.datetime "send_at"
    t.string "status", default: "en attente d'envoi", null: false
    t.float "total_weight"
    t.float "total_height"
    t.float "total_lenght"
    t.float "total_width"
    t.bigint "order_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_shippings_on_order_id"
  end

  create_table "subscriptions", force: :cascade do |t|
    t.string "stripe_id"
    t.bigint "user_id"
    t.string "status"
    t.decimal "price", null: false
    t.datetime "start_date", null: false
    t.integer "duration", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_subscriptions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.string "first_name"
    t.string "last_name"
    t.date "date_of_birth"
    t.integer "phone_number"
    t.string "gender"
    t.string "stripe_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "addresses", "users"
  add_foreign_key "games", "carts"
  add_foreign_key "order_lines", "games"
  add_foreign_key "order_lines", "orders"
  add_foreign_key "orders", "users"
  add_foreign_key "shippings", "orders"
  add_foreign_key "subscriptions", "users"
end
