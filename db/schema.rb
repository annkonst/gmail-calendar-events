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

ActiveRecord::Schema.define(version: 20171117213356) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.string   "author_type"
    t.integer  "author_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "admin_users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "ar_internal_metadata", primary_key: "key", force: :cascade do |t|
    t.string   "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ckeditor_assets", force: :cascade do |t|
    t.string   "data_file_name",               null: false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.string   "data_fingerprint"
    t.string   "type",              limit: 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "ckeditor_assets", ["type"], name: "index_ckeditor_assets_on_type", using: :btree

  create_table "images", force: :cascade do |t|
    t.integer  "portfolio_id"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "images", ["portfolio_id"], name: "index_images_on_portfolio_id", using: :btree

  create_table "portfolio_translations", force: :cascade do |t|
    t.integer  "portfolio_id", null: false
    t.string   "locale",       null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "country"
    t.string   "description"
  end

  add_index "portfolio_translations", ["locale"], name: "index_portfolio_translations_on_locale", using: :btree
  add_index "portfolio_translations", ["portfolio_id"], name: "index_portfolio_translations_on_portfolio_id", using: :btree

  create_table "portfolios", force: :cascade do |t|
    t.string   "url"
    t.string   "site_name"
    t.boolean  "visible",                    default: true
    t.string   "landing_image_file_name"
    t.string   "landing_image_content_type"
    t.integer  "landing_image_file_size"
    t.datetime "landing_image_updated_at"
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.string   "adress"
    t.string   "country"
    t.string   "description"
  end

  create_table "project_location_translations", force: :cascade do |t|
    t.integer  "project_location_id", null: false
    t.string   "locale",              null: false
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "region"
  end

  add_index "project_location_translations", ["locale"], name: "index_project_location_translations_on_locale", using: :btree
  add_index "project_location_translations", ["project_location_id"], name: "index_project_location_translations_on_project_location_id", using: :btree

  create_table "project_locations", force: :cascade do |t|
    t.string   "name"
    t.datetime "date"
    t.integer  "radius",            default: 8
    t.string   "city"
    t.float    "longitude"
    t.float    "latitude"
    t.string   "fillKey",           default: "WORKER"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
    t.text     "subproject"
  end

  create_table "setting_translations", force: :cascade do |t|
    t.integer  "setting_id", null: false
    t.string   "locale",     null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text     "caption"
  end

  add_index "setting_translations", ["locale"], name: "index_setting_translations_on_locale", using: :btree
  add_index "setting_translations", ["setting_id"], name: "index_setting_translations_on_setting_id", using: :btree

  create_table "settings", force: :cascade do |t|
    t.string   "name"
    t.text     "caption"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "skill_translations", force: :cascade do |t|
    t.integer  "skill_id",     null: false
    t.string   "locale",       null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "name"
    t.string   "description"
    t.string   "technologies"
  end

  add_index "skill_translations", ["locale"], name: "index_skill_translations_on_locale", using: :btree
  add_index "skill_translations", ["skill_id"], name: "index_skill_translations_on_skill_id", using: :btree

  create_table "skills", force: :cascade do |t|
    t.string   "name"
    t.integer  "position"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "description"
    t.string   "technologies"
  end

  create_table "slide_translations", force: :cascade do |t|
    t.integer  "slide_id",            null: false
    t.string   "locale",              null: false
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.text     "caption"
    t.text     "name_and_profession"
  end

  add_index "slide_translations", ["locale"], name: "index_slide_translations_on_locale", using: :btree
  add_index "slide_translations", ["slide_id"], name: "index_slide_translations_on_slide_id", using: :btree

  create_table "slides", force: :cascade do |t|
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.boolean  "visible",            default: true
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "vacancies", force: :cascade do |t|
    t.boolean  "visible",    default: true
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "vacancy_translations", force: :cascade do |t|
    t.integer  "vacancy_id",  null: false
    t.string   "locale",      null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "title"
    t.text     "description"
  end

  add_index "vacancy_translations", ["locale"], name: "index_vacancy_translations_on_locale", using: :btree
  add_index "vacancy_translations", ["vacancy_id"], name: "index_vacancy_translations_on_vacancy_id", using: :btree

  create_table "workers", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "github_url"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

end
