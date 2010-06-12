# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100612222517) do

  create_table "answers", :force => true do |t|
    t.integer  "attendee_id"
    t.integer  "question_id"
    t.integer  "answer"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "attendees", :force => true do |t|
    t.integer  "event_id"
    t.string   "name"
    t.string   "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", :force => true do |t|
    t.string   "title"
    t.string   "description"
    t.string   "questions"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "questions", :force => true do |t|
    t.integer  "event_id"
    t.string   "text"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
