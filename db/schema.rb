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

ActiveRecord::Schema.define(:version => 20110423043434) do

  create_table "travelers", :force => true do |t|
    t.string   "nick",            :limit => 20, :null => false
    t.string   "email",           :limit => 50, :null => false
    t.string   "hashed_password",               :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "salt",                          :null => false
  end

  create_table "trips", :force => true do |t|
    t.string   "name",            :null => false
    t.string   "destination",     :null => false
    t.float    "destination_lat"
    t.float    "destination_lon"
    t.date     "start_date"
    t.date     "end_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
