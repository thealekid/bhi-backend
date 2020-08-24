# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_07_29_104902) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "hair_product_comments", force: :cascade do |t|
    t.string "description"
    t.bigint "user_id"
    t.bigint "hair_product_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["hair_product_id"], name: "index_hair_product_comments_on_hair_product_id"
    t.index ["user_id"], name: "index_hair_product_comments_on_user_id"
  end

  create_table "hair_products", force: :cascade do |t|
    t.string "name"
    t.string "image_url"
    t.string "description"
    t.string "use"
    t.string "ingredients"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "shop_comments", force: :cascade do |t|
    t.string "description"
    t.bigint "user_id"
    t.bigint "shop_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["shop_id"], name: "index_shop_comments_on_shop_id"
    t.index ["user_id"], name: "index_shop_comments_on_user_id"
  end

  create_table "shops", force: :cascade do |t|
    t.string "name"
    t.string "image_url"
    t.string "opening_hours"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "address"
    t.string "town"
    t.string "county"
    t.string "country"
    t.string "postcode"
    t.string "service"
    t.boolean "approved", default: false
    t.string "phone_number"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "username"
    t.string "password_digest"
    t.string "email_address"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "approved", default: false
  end

end
