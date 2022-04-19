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

ActiveRecord::Schema[7.0].define(version: 2022_04_18_114936) do
  create_table "answers", force: :cascade do |t|
    t.text "content"
    t.integer "user_id", null: false
    t.integer "discussion_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["discussion_id"], name: "index_answers_on_discussion_id"
    t.index ["user_id"], name: "index_answers_on_user_id"
  end

  create_table "comments", force: :cascade do |t|
    t.text "content"
    t.integer "user_id", null: false
    t.integer "feed_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["feed_id"], name: "index_comments_on_feed_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "connections", force: :cascade do |t|
    t.integer "person"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_connections_on_user_id"
  end

  create_table "crop_productions", force: :cascade do |t|
    t.float "value"
    t.integer "crop_id", null: false
    t.integer "year_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["crop_id"], name: "index_crop_productions_on_crop_id"
    t.index ["year_id"], name: "index_crop_productions_on_year_id"
  end

  create_table "crops", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "discussions", force: :cascade do |t|
    t.text "content"
    t.integer "count", default: 0
    t.integer "user_id", null: false
    t.integer "region_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["region_id"], name: "index_discussions_on_region_id"
    t.index ["user_id"], name: "index_discussions_on_user_id"
  end

  create_table "feeds", force: :cascade do |t|
    t.text "content"
    t.integer "count", default: 0
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_feeds_on_user_id"
  end

  create_table "messages", force: :cascade do |t|
    t.string "name"
    t.text "content"
    t.boolean "is_private", default: false
    t.integer "sender_id", null: false
    t.integer "receiver_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["receiver_id"], name: "index_messages_on_receiver_id"
    t.index ["sender_id"], name: "index_messages_on_sender_id"
  end

  create_table "regions", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.integer "phone"
    t.integer "count", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", null: false
    t.string "password_digest"
    t.string "fav_plant"
    t.integer "region_id"
    t.index ["region_id"], name: "index_users_on_region_id"
  end

  create_table "years", force: :cascade do |t|
    t.string "year"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "answers", "discussions"
  add_foreign_key "answers", "users"
  add_foreign_key "comments", "feeds"
  add_foreign_key "comments", "users"
  add_foreign_key "connections", "users"
  add_foreign_key "crop_productions", "crops"
  add_foreign_key "crop_productions", "years"
  add_foreign_key "discussions", "regions"
  add_foreign_key "discussions", "users"
  add_foreign_key "feeds", "users"
  add_foreign_key "messages", "users", column: "receiver_id"
  add_foreign_key "messages", "users", column: "sender_id"
  add_foreign_key "users", "regions"
end
