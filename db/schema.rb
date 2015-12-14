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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20151213121221) do

  create_table "admins", force: :cascade do |t|
    t.string   "name",                   limit: 255
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true, using: :btree
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true, using: :btree

  create_table "answers", force: :cascade do |t|
    t.integer  "question_id", limit: 4
    t.integer  "survey_id",   limit: 4
    t.integer  "point",       limit: 4
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "answers", ["point"], name: "index_answers_on_point", using: :btree
  add_index "answers", ["question_id"], name: "index_answers_on_question_id", using: :btree
  add_index "answers", ["survey_id"], name: "index_answers_on_survey_id", using: :btree

  create_table "cities", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "committees", force: :cascade do |t|
    t.string   "name",           limit: 255
    t.integer  "committee_type", limit: 4,     default: 1
    t.text     "description",    limit: 65535
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
  end

  create_table "congressmen", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "en_name",    limit: 255
    t.integer  "sex",        limit: 4
    t.text     "degree",     limit: 65535
    t.text     "experience", limit: 65535
    t.string   "fax",        limit: 255
    t.string   "tel",        limit: 255
    t.string   "avatar_url", limit: 255
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "congressmen_evaluations", force: :cascade do |t|
    t.integer  "evaluation_id",  limit: 4
    t.integer  "congressman_id", limit: 4
    t.integer  "election_type",  limit: 4, default: 0
    t.integer  "party_id",       limit: 4
    t.integer  "committee_id",   limit: 4
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  add_index "congressmen_evaluations", ["committee_id"], name: "index_congressmen_evaluations_on_committee_id", using: :btree
  add_index "congressmen_evaluations", ["congressman_id"], name: "index_congressmen_evaluations_on_congressman_id", using: :btree
  add_index "congressmen_evaluations", ["evaluation_id"], name: "index_congressmen_evaluations_on_evaluation_id", using: :btree
  add_index "congressmen_evaluations", ["party_id"], name: "index_congressmen_evaluations_on_party_id", using: :btree

  create_table "congressmen_interpellations", force: :cascade do |t|
    t.integer  "congressman_id",    limit: 4
    t.integer  "interpellation_id", limit: 4
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "congressmen_interpellations", ["congressman_id"], name: "index_congressmen_interpellations_on_congressman_id", using: :btree
  add_index "congressmen_interpellations", ["interpellation_id"], name: "index_congressmen_interpellations_on_interpellation_id", using: :btree

  create_table "course_interpellations", force: :cascade do |t|
    t.integer  "course_id",         limit: 4
    t.integer  "interpellation_id", limit: 4
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "course_interpellations", ["course_id"], name: "index_course_interpellations_on_course_id", using: :btree
  add_index "course_interpellations", ["interpellation_id"], name: "index_course_interpellations_on_interpellation_id", using: :btree

  create_table "courses", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "token",      limit: 255
    t.integer  "teacher_id", limit: 4
  end

  add_index "courses", ["teacher_id"], name: "index_courses_on_teacher_id", using: :btree
  add_index "courses", ["token"], name: "index_courses_on_token", using: :btree

  create_table "districts", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.integer  "city_id",    limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "districts", ["city_id"], name: "index_districts_on_city_id", using: :btree

  create_table "evaluations", force: :cascade do |t|
    t.integer  "term_id",        limit: 4
    t.integer  "session_number", limit: 4
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.boolean  "active",         limit: 1, default: false
  end

  add_index "evaluations", ["term_id"], name: "index_evaluations_on_term_id", using: :btree

  create_table "events", force: :cascade do |t|
    t.string   "name",              limit: 255
    t.integer  "evaluation_id",     limit: 4
    t.integer  "interpellation_id", limit: 4
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
    t.boolean  "active",            limit: 1,   default: false
    t.string   "token",             limit: 255
  end

  add_index "events", ["evaluation_id"], name: "index_events_on_evaluation_id", using: :btree
  add_index "events", ["interpellation_id"], name: "index_events_on_interpellation_id", using: :btree
  add_index "events", ["token"], name: "index_events_on_token", using: :btree

  create_table "inquiries", force: :cascade do |t|
    t.integer  "number",            limit: 4
    t.text     "content",           limit: 65535
    t.text     "video",             limit: 65535
    t.integer  "congressman_id",    limit: 4
    t.integer  "interpellation_id", limit: 4
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  create_table "interpellations", force: :cascade do |t|
    t.string   "name",                limit: 255
    t.datetime "interpellation_date"
    t.text     "content",             limit: 65535
    t.integer  "committee_id",        limit: 4
    t.integer  "evaluation_id",       limit: 4
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

  add_index "interpellations", ["committee_id"], name: "index_interpellations_on_committee_id", using: :btree
  add_index "interpellations", ["evaluation_id"], name: "index_interpellations_on_evaluation_id", using: :btree

  create_table "parties", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "question_types", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "questions", force: :cascade do |t|
    t.string   "name",             limit: 255
    t.integer  "question_type_id", limit: 4
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.integer  "evaluation_id",    limit: 4
  end

  add_index "questions", ["evaluation_id"], name: "index_questions_on_evaluation_id", using: :btree
  add_index "questions", ["question_type_id"], name: "index_questions_on_question_type_id", using: :btree

  create_table "surveys", force: :cascade do |t|
    t.integer  "user_id",       limit: 4
    t.integer  "evaluation_id", limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "inquiry_id",    limit: 4
  end

  add_index "surveys", ["evaluation_id"], name: "index_surveys_on_evaluation_id", using: :btree
  add_index "surveys", ["inquiry_id"], name: "index_surveys_on_inquiry_id", using: :btree
  add_index "surveys", ["user_id"], name: "index_surveys_on_user_id", using: :btree

  create_table "terms", force: :cascade do |t|
    t.string   "term_number", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "terms", ["term_number"], name: "index_terms_on_term_number", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "name",                   limit: 255
    t.string   "identity",               limit: 255
    t.date     "birthdate"
    t.integer  "district_id",            limit: 4
    t.integer  "role",                   limit: 4
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.integer  "course_id",              limit: 4
  end

  add_index "users", ["course_id"], name: "index_users_on_course_id", using: :btree
  add_index "users", ["district_id"], name: "index_users_on_district_id", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["role"], name: "index_users_on_role", using: :btree

  create_table "users_events", force: :cascade do |t|
    t.integer "user_id",  limit: 4
    t.integer "event_id", limit: 4
  end

  add_index "users_events", ["event_id"], name: "index_users_events_on_event_id", using: :btree
  add_index "users_events", ["user_id"], name: "index_users_events_on_user_id", using: :btree

  add_foreign_key "answers", "questions"
  add_foreign_key "answers", "surveys"
  add_foreign_key "congressmen_evaluations", "committees"
  add_foreign_key "congressmen_evaluations", "congressmen"
  add_foreign_key "congressmen_evaluations", "evaluations"
  add_foreign_key "congressmen_evaluations", "parties"
  add_foreign_key "evaluations", "terms"
  add_foreign_key "interpellations", "committees"
  add_foreign_key "interpellations", "evaluations"
  add_foreign_key "questions", "question_types"
  add_foreign_key "surveys", "evaluations"
  add_foreign_key "surveys", "users"
end
