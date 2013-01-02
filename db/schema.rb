# encoding: UTF-8
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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121227224428) do

  create_table "matches", :force => true do |t|
    t.date     "date"
    t.integer  "goals_team_a"
    t.integer  "goals_team_b"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "player_matches", :force => true do |t|
    t.integer  "match_id"
    t.integer  "player_id"
    t.string   "team"
    t.string   "result"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "players", :force => true do |t|
    t.string   "name"
    t.string   "user"
    t.string   "password_digest"
    t.string   "remember_token"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.boolean  "admin",           :default => false
  end

  create_table "rankings", :force => true do |t|
    t.integer  "player_id"
    t.decimal  "percent"
    t.integer  "points"
    t.integer  "matches"
    t.integer  "victories"
    t.integer  "draws"
    t.integer  "losses"
    t.integer  "goals_scored"
    t.integer  "goals_against"
    t.integer  "goals_differential"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

end
