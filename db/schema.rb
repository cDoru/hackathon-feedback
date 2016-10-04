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

ActiveRecord::Schema.define(version: 20161004125554) do

  create_table "feedback_requests", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci" do |t|
    t.string   "title"
    t.text     "description",  limit: 65535
    t.integer  "goal_id"
    t.integer  "requester_id",               null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["goal_id"], name: "index_feedback_requests_on_goal_id", using: :btree
    t.index ["requester_id"], name: "index_feedback_requests_on_requester_id", using: :btree
  end

  create_table "feedback_requests_users", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci" do |t|
    t.integer "feedback_request_id"
    t.integer "user_id"
    t.index ["feedback_request_id"], name: "index_feedback_requests_users_on_feedback_request_id", using: :btree
    t.index ["user_id"], name: "index_feedback_requests_users_on_user_id", using: :btree
  end

  create_table "feedbacks", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci" do |t|
    t.text     "description",         limit: 65535
    t.integer  "rating"
    t.integer  "goal_id"
    t.integer  "feedback_request_id"
    t.integer  "author_id"
    t.integer  "subject_id"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.index ["author_id"], name: "index_feedbacks_on_author_id", using: :btree
    t.index ["feedback_request_id"], name: "index_feedbacks_on_feedback_request_id", using: :btree
    t.index ["goal_id"], name: "index_feedbacks_on_goal_id", using: :btree
    t.index ["subject_id"], name: "index_feedbacks_on_subject_id", using: :btree
  end

  create_table "goals", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci" do |t|
    t.string   "title"
    t.text     "description", limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci" do |t|
    t.string   "email",              default: "", null: false
    t.string   "name",               default: "", null: false
    t.integer  "sign_in_count",      default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
  end

end
