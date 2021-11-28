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

ActiveRecord::Schema.define(version: 2021_11_20_103755) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "access_level_actions", force: :cascade do |t|
    t.bigint "access_level_id"
    t.string "action", null: false
    t.datetime "created_at"
    t.index ["access_level_id"], name: "index_access_level_actions_on_access_level_id"
  end

  create_table "access_levels", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at"
  end

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
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "product_images", force: :cascade do |t|
    t.string "name"
    t.string "attachment"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "products", force: :cascade do |t|
    t.bigint "user_id"
    t.string "name", limit: 100, null: false
    t.float "price", null: false
    t.text "description"
    t.text "imageurl"
    t.boolean "isDeleted", default: false
    t.integer "quantity", null: false
    t.datetime "created_at"
    t.index ["user_id"], name: "index_products_on_user_id"
  end

  create_table "sales", force: :cascade do |t|
    t.bigint "product_id"
    t.date "date", null: false
    t.float "price", null: false
    t.integer "quantity", null: false
    t.datetime "created_at"
    t.index ["product_id"], name: "index_sales_on_product_id"
  end

  create_table "users", force: :cascade do |t|
    t.bigint "access_level_id"
    t.string "name", null: false
    t.string "email", null: false
    t.string "password", null: false
    t.string "address", null: false
    t.datetime "created_at"
    t.index ["access_level_id"], name: "index_users_on_access_level_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "sales", "products"
end