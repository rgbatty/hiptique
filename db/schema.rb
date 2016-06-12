ActiveRecord::Schema.define(version: 20160612201314) do

  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name"
  end

  create_table "categories_items", id: false, force: :cascade do |t|
    t.integer "item_id",     null: false
    t.integer "category_id", null: false
  end

  create_table "items", force: :cascade do |t|
    t.string  "name"
    t.string  "description"
    t.integer "price"
    t.string  "image"
    t.integer "status",      default: 0
  end

  create_table "order_items", id: false, force: :cascade do |t|
    t.integer "order_id", null: false
    t.integer "item_id",  null: false
  end

  add_index "order_items", ["item_id"], name: "index_order_items_on_item_id", using: :btree
  add_index "order_items", ["order_id"], name: "index_order_items_on_order_id", using: :btree

  create_table "orders", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "orders", ["user_id"], name: "index_orders_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "password_digest"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "role",            default: 0
  end

  add_foreign_key "orders", "users"
end
