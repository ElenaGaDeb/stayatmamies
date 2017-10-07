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

ActiveRecord::Schema.define(version: 20171007102427) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "amenities", force: :cascade do |t|
    t.string "category"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "apartment_amenities", force: :cascade do |t|
    t.bigint "amenity_id"
    t.bigint "apartment_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["amenity_id"], name: "index_apartment_amenities_on_amenity_id"
    t.index ["apartment_id"], name: "index_apartment_amenities_on_apartment_id"
  end

  create_table "apartments", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "deal"
    t.string "street"
    t.string "city"
    t.integer "zip_code"
    t.string "country"
    t.integer "bedrooms"
    t.integer "bathrooms"
    t.string "street2"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.float "latitude"
    t.float "longitude"
    t.index ["user_id"], name: "index_apartments_on_user_id"
  end

  create_table "bookings", force: :cascade do |t|
    t.date "start_date"
    t.date "end_date"
    t.string "status"
    t.bigint "apartment_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["apartment_id"], name: "index_bookings_on_apartment_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "characteristics", force: :cascade do |t|
    t.string "name"
    t.string "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "messages", force: :cascade do |t|
    t.text "content"
    t.string "booking_status"
    t.bigint "user_id"
    t.bigint "booking_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["booking_id"], name: "index_messages_on_booking_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "profile_characteristics", force: :cascade do |t|
    t.bigint "characteristic_id"
    t.bigint "profile_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["characteristic_id"], name: "index_profile_characteristics_on_characteristic_id"
    t.index ["profile_id"], name: "index_profile_characteristics_on_profile_id"
    t.index ["user_id"], name: "index_profile_characteristics_on_user_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.string "username"
    t.string "first_name"
    t.string "last_name"
    t.integer "age"
    t.string "city_from"
    t.string "gender"
    t.string "detailed_description"
    t.string "short_description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.string "profile_type"
    t.integer "phone_number"
    t.string "country_from"
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "rating"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "for_user_id"
    t.bigint "by_user_id"
    t.index ["by_user_id"], name: "index_reviews_on_by_user_id"
    t.index ["for_user_id"], name: "index_reviews_on_for_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "provider"
    t.string "uid"
    t.string "facebook_picture_url"
    t.string "first_name"
    t.string "last_name"
    t.string "token"
    t.datetime "token_expiry"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "apartment_amenities", "amenities"
  add_foreign_key "apartment_amenities", "apartments"
  add_foreign_key "apartments", "users"
  add_foreign_key "bookings", "apartments"
  add_foreign_key "bookings", "users"
  add_foreign_key "messages", "bookings"
  add_foreign_key "messages", "users"
  add_foreign_key "profile_characteristics", "characteristics"
  add_foreign_key "profile_characteristics", "profiles"
  add_foreign_key "profile_characteristics", "users"
  add_foreign_key "profiles", "users"
  add_foreign_key "reviews", "users", column: "by_user_id"
  add_foreign_key "reviews", "users", column: "for_user_id"
end
