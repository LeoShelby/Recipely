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

ActiveRecord::Schema.define(version: 20170820100818) do

  create_table "allergens", force: :cascade do |t|
    t.string   "type_allergen"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "recipe_id"
    t.integer  "user_id"
  end

  create_table "badges", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "type_bad"
    t.integer  "level"
    t.string   "picture"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_badges_on_user_id"
  end

  create_table "comments", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "recipe_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text     "content"
    t.index ["recipe_id"], name: "index_comments_on_recipe_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "doneits", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "recipe_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["recipe_id"], name: "index_doneits_on_recipe_id"
    t.index ["user_id"], name: "index_doneits_on_user_id"
  end

  create_table "events", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "title"
    t.string   "content"
    t.string   "data_ev"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "location"
    t.index ["user_id"], name: "index_events_on_user_id"
  end

  create_table "ingredients", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "recipe_id"
  end

  create_table "invitations", force: :cascade do |t|
    t.integer  "event_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "status"
    t.index ["event_id"], name: "index_invitations_on_event_id"
    t.index ["user_id"], name: "index_invitations_on_user_id"
  end

  create_table "likes", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "recipe_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["recipe_id"], name: "index_likes_on_recipe_id"
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "menus", force: :cascade do |t|
    t.integer  "event_id"
    t.integer  "primo_id"
    t.integer  "secondo_id"
    t.integer  "contorno_id"
    t.integer  "dessert_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["contorno_id"], name: "index_menus_on_contorno_id"
    t.index ["dessert_id"], name: "index_menus_on_dessert_id"
    t.index ["event_id"], name: "index_menus_on_event_id"
    t.index ["primo_id"], name: "index_menus_on_primo_id"
    t.index ["secondo_id"], name: "index_menus_on_secondo_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "notified_by_id"
    t.integer  "recipe_id"
    t.string   "type_not"
    t.boolean  "read",           default: false
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.integer  "badge_id"
    t.integer  "event_id"
    t.index ["badge_id"], name: "index_notifications_on_badge_id"
    t.index ["event_id"], name: "index_notifications_on_event_id"
    t.index ["notified_by_id"], name: "index_notifications_on_notified_by_id"
    t.index ["recipe_id"], name: "index_notifications_on_recipe_id"
    t.index ["user_id"], name: "index_notifications_on_user_id"
  end

  create_table "quantities", force: :cascade do |t|
    t.integer  "recipe_id"
    t.integer  "ingredient_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "measure"
  end

  create_table "ratings", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "recipe_id"
    t.integer  "score",      default: 0
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["recipe_id"], name: "index_ratings_on_recipe_id"
    t.index ["user_id"], name: "index_ratings_on_user_id"
  end

  create_table "recipes", force: :cascade do |t|
    t.text     "title"
    t.text     "content"
    t.integer  "rate"
    t.string   "category"
    t.integer  "user_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "picture"
    t.integer  "time"
    t.integer  "ingredient_id"
    t.index ["user_id", "created_at"], name: "index_recipes_on_user_id_and_created_at"
    t.index ["user_id"], name: "index_recipes_on_user_id"
  end

  create_table "relationships", force: :cascade do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["followed_id"], name: "index_relationships_on_followed_id"
    t.index ["follower_id", "followed_id"], name: "index_relationships_on_follower_id_and_followed_id", unique: true
    t.index ["follower_id"], name: "index_relationships_on_follower_id"
  end

  create_table "searches", force: :cascade do |t|
    t.string   "title"
    t.string   "category"
    t.integer  "rate"
    t.integer  "time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "password_digest"
    t.string   "remember_digest"
    t.boolean  "admin",             default: false
    t.string   "activation_digest"
    t.boolean  "activated",         default: false
    t.datetime "activated_at"
    t.string   "reset_digest"
    t.datetime "reset_sent_at"
    t.string   "uid"
    t.string   "provider"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["provider", "uid"], name: "index_users_on_provider_and_uid", unique: true
    t.index ["provider"], name: "index_users_on_provider"
    t.index ["uid"], name: "index_users_on_uid"
  end

end
