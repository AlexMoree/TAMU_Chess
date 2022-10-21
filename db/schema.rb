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

ActiveRecord::Schema.define(version: 2022_10_21_165528) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attendences", force: :cascade do |t|
    t.string "uin"
    t.date "day_of_event"
  end

  create_table "chesses", force: :cascade do |t|
    t.string "actual_name"
    t.string "chess_com_username"
    t.integer "blitz"
    t.integer "rapid"
    t.integer "total_played"
  end

  create_table "lichesses", force: :cascade do |t|
    t.string "actual_name"
    t.string "lichess_org_username"
    t.integer "blitz"
    t.integer "rapid"
    t.integer "total_played"
  end

  create_table "personal_informations", force: :cascade do |t|
    t.string "uin"
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.boolean "membership"
    t.date "start_date"
    t.date "end_date"
    t.string "discord_username"
    t.string "chess_com_username"
    t.string "lichess_org_username"
  end

  create_table "qr_codes", force: :cascade do |t|
    t.string "title"
    t.string "qr_url"
  end

  create_table "statistics", force: :cascade do |t|
    t.string "actual_name"
    t.string "chess_username"
    t.integer "chess_blitz"
    t.integer "chess_rapid"
    t.integer "chess_total_played"
    t.string "lichess_username"
    t.integer "lichess_blitz"
    t.integer "lichess_rapid"
    t.integer "lichess_total_played"
  end

end
