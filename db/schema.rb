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

ActiveRecord::Schema.define(version: 2022_07_26_022441) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "practice_logs", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "url", null: false
    t.integer "duration", null: false
    t.text "memo"
    t.date "practice_on", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id", "practice_on"], name: "index_practice_logs_on_user_id_and_practice_on", unique: true
    t.index ["user_id"], name: "index_practice_logs_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "provider", null: false
    t.string "uid", null: false
    t.string "image_url", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["provider", "uid"], name: "index_users_on_provider_and_uid", unique: true
  end

  add_foreign_key "practice_logs", "users"
end
