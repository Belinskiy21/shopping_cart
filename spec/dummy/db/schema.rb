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

ActiveRecord::Schema.define(version: 20171110134635) do

  create_table "shopping_cart_addresses", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "address"
    t.string "city"
    t.string "zip"
    t.string "countryphone"
    t.string "type"
    t.integer "user_id"
    t.integer "order_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_shopping_cart_addresses_on_order_id"
    t.index ["user_id"], name: "index_shopping_cart_addresses_on_user_id"
  end

  create_table "shopping_cart_countries", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shopping_cart_coupons", force: :cascade do |t|
    t.string "code"
    t.decimal "discont", precision: 3, scale: 2
    t.integer "order_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_shopping_cart_coupons_on_order_id"
  end

  create_table "shopping_cart_credit_cards", force: :cascade do |t|
    t.string "number"
    t.string "name"
    t.string "cvv"
    t.string "mm_yy"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_shopping_cart_credit_cards_on_user_id"
  end

  create_table "shopping_cart_order_items", force: :cascade do |t|
    t.integer "order_id"
    t.integer "book_id"
    t.decimal "unit_price", precision: 8, scale: 2
    t.decimal "total_price", precision: 8, scale: 2
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_shopping_cart_order_items_on_book_id"
    t.index ["order_id"], name: "index_shopping_cart_order_items_on_order_id"
  end

  create_table "shopping_cart_orders", force: :cascade do |t|
    t.integer "user_id"
    t.integer "shipping_method_id"
    t.string "order_state"
    t.integer "credit_card_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["credit_card_id"], name: "index_shopping_cart_orders_on_credit_card_id"
    t.index ["shipping_method_id"], name: "index_shopping_cart_orders_on_shipping_method_id"
    t.index ["user_id"], name: "index_shopping_cart_orders_on_user_id"
  end

  create_table "shopping_cart_shipping_methods", force: :cascade do |t|
    t.string "name"
    t.integer "min_days"
    t.integer "max_days"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
