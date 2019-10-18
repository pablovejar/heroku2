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

ActiveRecord::Schema.define(version: 2019_10_17_035540) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.text "body", null: false
    t.date "date", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.bigint "dish_id"
    t.bigint "restaurant_id"
    t.index ["dish_id"], name: "index_comments_on_dish_id"
    t.index ["restaurant_id"], name: "index_comments_on_restaurant_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "dishes", force: :cascade do |t|
    t.string "name", null: false
    t.float "price", null: false
    t.text "description"
    t.integer "quantity"
    t.float "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "restaurant_id"
    t.index ["restaurant_id"], name: "index_dishes_on_restaurant_id"
  end

  create_table "orders", force: :cascade do |t|
    t.float "price", null: false
    t.string "payment", null: false
    t.string "delivery_address", null: false
    t.time "delivery_time", null: false
    t.string "status", null: false
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.bigint "dish_id"
    t.bigint "restaurant_id"
    t.index ["dish_id"], name: "index_orders_on_dish_id"
    t.index ["restaurant_id"], name: "index_orders_on_restaurant_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "restaurants", force: :cascade do |t|
    t.string "name", null: false
    t.string "mail", null: false
    t.string "address", null: false
    t.float "rating"
    t.string "phone", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "dish_id"
    t.bigint "user_id"
    t.index ["dish_id"], name: "index_restaurants_on_dish_id"
    t.index ["user_id"], name: "index_restaurants_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.text "body"
    t.integer "value"
    t.bigint "dish_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dish_id"], name: "index_reviews_on_dish_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "comments", "dishes"
  add_foreign_key "comments", "restaurants"
  add_foreign_key "comments", "users"
  add_foreign_key "dishes", "restaurants"
  add_foreign_key "orders", "dishes"
  add_foreign_key "orders", "restaurants"
  add_foreign_key "orders", "users"
  add_foreign_key "restaurants", "dishes"
  add_foreign_key "restaurants", "users"
  add_foreign_key "reviews", "dishes"
  add_foreign_key "reviews", "users"
end
