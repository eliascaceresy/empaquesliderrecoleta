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

ActiveRecord::Schema.define(version: 20160203003147) do

  create_table "groups", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
    t.string   "state",      limit: 255, default: "inactivo"
  end

  create_table "tomaturnos", force: :cascade do |t|
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
    t.string   "state",        limit: 255, default: "inactiva"
    t.integer  "canmaxsemana", limit: 4,   default: 0
  end

  create_table "turns", force: :cascade do |t|
    t.string   "dia",         limit: 255
    t.string   "horainicio",  limit: 255
    t.string   "horatermino", limit: 255
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.integer  "user_id",     limit: 4
    t.string   "state",       limit: 255, default: "free"
    t.integer  "numdia",      limit: 4
  end

  add_index "turns", ["user_id"], name: "index_turns_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "",       null: false
    t.string   "encrypted_password",     limit: 255, default: "",       null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,        null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.string   "name",                   limit: 255
    t.string   "rut",                    limit: 255
    t.string   "address",                limit: 255
    t.string   "phone_number",           limit: 255
    t.datetime "created_at",                                            null: false
    t.datetime "updated_at",                                            null: false
    t.string   "state",                  limit: 255, default: "activo"
    t.integer  "group_id",               limit: 4
    t.string   "universidad",            limit: 255
    t.string   "carrera",                limit: 255
    t.integer  "diacumpleaños",          limit: 4
    t.integer  "mescumpleaños",          limit: 4
    t.integer  "permission_level",       limit: 4,   default: 1
    t.string   "cover_file_name",        limit: 255
    t.string   "cover_content_type",     limit: 255
    t.integer  "cover_file_size",        limit: 4
    t.datetime "cover_updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["group_id"], name: "index_users_on_group_id", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "turns", "users"
  add_foreign_key "users", "groups"
end
