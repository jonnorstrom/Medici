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

ActiveRecord::Schema.define(version: 20161215201104) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "charges", force: :cascade do |t|
    t.integer  "amount"
    t.integer  "coupon_id"
    t.integer  "stripe_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "coupons", force: :cascade do |t|
    t.string   "code"
    t.float    "discount_percent"
    t.datetime "expires_at"
    t.string   "description"
    t.integer  "quantity_redeemed", default: 0
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.integer  "ticket_id"
    t.boolean  "active",            default: true
  end

  create_table "events", force: :cascade do |t|
    t.string   "name"
    t.datetime "start_date"
    t.datetime "end_date"
    t.time     "opening_time"
    t.time     "closing_time"
    t.string   "blurb"
    t.string   "description"
    t.float    "price"
    t.integer  "museum_id"
    t.string   "website"
    t.string   "ticketsite"
    t.string   "address"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "transportation_info"
    t.boolean  "main",                default: false
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.boolean  "ticketable"
    t.float    "max_price"
  end

  create_table "exhibits", force: :cascade do |t|
    t.string   "name"
    t.string   "blurb"
    t.string   "description"
    t.float    "price"
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "museum_id"
    t.string   "ticketsite"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.boolean  "permanent"
  end

  create_table "favorable_tags", force: :cascade do |t|
    t.integer  "tag_id",     null: false
    t.integer  "event_id"
    t.integer  "museum_id"
    t.integer  "exhibit_id"
    t.integer  "piece_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "identities", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.string   "accesstoken"
    t.string   "refreshtoken"
    t.string   "uid"
    t.string   "name"
    t.string   "email"
    t.string   "image"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["user_id"], name: "index_identities_on_user_id", using: :btree
  end

  create_table "museums", force: :cascade do |t|
    t.string   "name"
    t.string   "blurb"
    t.string   "description"
    t.float    "price"
    t.boolean  "active"
    t.time     "opening_time"
    t.time     "closing_time"
    t.string   "website"
    t.string   "ticketsite"
    t.string   "address"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "transportation_info"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.time     "sun_open"
    t.time     "sun_close"
    t.time     "mon_open"
    t.time     "mon_close"
    t.time     "tue_open"
    t.time     "tue_close"
    t.time     "wed_open"
    t.time     "wed_close"
    t.time     "thu_open"
    t.time     "thu_close"
    t.time     "fri_open"
    t.time     "fri_close"
    t.time     "sat_open"
    t.time     "sat_close"
  end

  create_table "orders", force: :cascade do |t|
    t.decimal  "subtotal",   precision: 12, scale: 3
    t.decimal  "tax",        precision: 12, scale: 3
    t.decimal  "shipping",   precision: 12, scale: 3
    t.decimal  "total",      precision: 12, scale: 3
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  create_table "pieces", force: :cascade do |t|
    t.string   "name"
    t.string   "blurb"
    t.string   "description"
    t.integer  "museum_id"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.boolean  "main",               default: false
    t.string   "external_url"
  end

  create_table "taggings", force: :cascade do |t|
    t.integer  "user_id",    default: 0
    t.integer  "museum_id",  default: 0
    t.integer  "exhibit_id", default: 0
    t.integer  "event_id",   default: 0
    t.integer  "piece_id",   default: 0
    t.integer  "tag_id",     default: 0
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "tags", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "category"
  end

  create_table "tickets", force: :cascade do |t|
    t.integer  "museum_id"
    t.integer  "exhibit_id"
    t.integer  "event_id"
    t.integer  "user_id"
    t.float    "unit_price"
    t.integer  "quantity"
    t.string   "redemption_code"
    t.integer  "original_quantity"
    t.integer  "order_id"
    t.float    "total_price"
    t.boolean  "paid",              default: false
    t.boolean  "redeemed",          default: false
    t.date     "date_redeemed"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "coupon_code"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.boolean  "admin",                  default: false
    t.string   "image_url"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "provider"
    t.string   "uid"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "first_name",             default: "",    null: false
    t.string   "last_name",              default: "",    null: false
    t.string   "full_name",                              null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "identities", "users"
end
