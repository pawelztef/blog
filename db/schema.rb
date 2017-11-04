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

ActiveRecord::Schema.define(version: 20171104090957) do

  create_table "bios", force: :cascade do |t|
    t.text     "body",         limit: 65535
    t.integer  "moderator_id", limit: 4
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "bios", ["moderator_id"], name: "index_bios_on_moderator_id", using: :btree

  create_table "books", force: :cascade do |t|
    t.string   "title",        limit: 255
    t.string   "author_fname", limit: 255
    t.string   "author_lname", limit: 255
    t.string   "publisher",    limit: 255
    t.string   "publish_year", limit: 255
    t.string   "isbn",         limit: 255
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.boolean  "display",                  default: false
    t.string   "cover",        limit: 255
  end

  create_table "ckeditor_assets", force: :cascade do |t|
    t.string   "data_file_name",    limit: 255, null: false
    t.string   "data_content_type", limit: 255
    t.integer  "data_file_size",    limit: 4
    t.string   "type",              limit: 30
    t.integer  "width",             limit: 4
    t.integer  "height",            limit: 4
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "ckeditor_assets", ["type"], name: "index_ckeditor_assets_on_type", using: :btree

  create_table "comments", force: :cascade do |t|
    t.text     "message",    limit: 65535
    t.boolean  "status",                   default: false
    t.integer  "post_id",    limit: 4
    t.integer  "visitor_id", limit: 4
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
  end

  add_index "comments", ["post_id"], name: "index_comments_on_post_id", using: :btree
  add_index "comments", ["visitor_id"], name: "index_comments_on_visitor_id", using: :btree

  create_table "messages", force: :cascade do |t|
    t.text     "content",    limit: 65535
    t.integer  "visitor_id", limit: 4
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.boolean  "status",                   default: false, null: false
  end

  add_index "messages", ["visitor_id"], name: "index_messages_on_visitor_id", using: :btree

  create_table "moderators", force: :cascade do |t|
    t.string   "fullname",        limit: 255
    t.string   "username",        limit: 255
    t.string   "password_digest", limit: 255
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.string   "avatar",          limit: 255
    t.text     "catchphrase",     limit: 65535
    t.boolean  "owner"
  end

  create_table "notifications", force: :cascade do |t|
    t.integer  "notifiable_id",   limit: 4
    t.string   "notifiable_type", limit: 255
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "notifications", ["notifiable_type", "notifiable_id"], name: "index_notifications_on_notifiable_type_and_notifiable_id", using: :btree

  create_table "post_tags", force: :cascade do |t|
    t.integer  "post_id",    limit: 4
    t.integer  "tag_id",     limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "post_tags", ["post_id"], name: "index_post_tags_on_post_id", using: :btree
  add_index "post_tags", ["tag_id"], name: "index_post_tags_on_tag_id", using: :btree

  create_table "posts", force: :cascade do |t|
    t.string   "title",        limit: 255
    t.text     "content",      limit: 65535
    t.boolean  "publish"
    t.integer  "moderator_id", limit: 4
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.datetime "published_at"
  end

  add_index "posts", ["moderator_id"], name: "index_posts_on_moderator_id", using: :btree

  create_table "project_images", force: :cascade do |t|
    t.string   "image",       limit: 255
    t.string   "title",       limit: 255
    t.string   "description", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "project_images_projects", id: false, force: :cascade do |t|
    t.integer "project_id",       limit: 4, null: false
    t.integer "project_image_id", limit: 4, null: false
  end

  add_index "project_images_projects", ["project_id", "project_image_id"], name: "index_project_images_projects_on_project_id_and_project_image_id", using: :btree
  add_index "project_images_projects", ["project_image_id", "project_id"], name: "index_project_images_projects_on_project_image_id_and_project_id", using: :btree

  create_table "projects", force: :cascade do |t|
    t.string   "title",       limit: 255
    t.string   "description", limit: 255
    t.boolean  "display"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.text     "content",    limit: 65535
    t.boolean  "draft"
    t.integer  "book_id",    limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "reviews", ["book_id"], name: "index_reviews_on_book_id", using: :btree

  create_table "settings", force: :cascade do |t|
    t.string   "site_name",          limit: 255
    t.integer  "post_per_page",      limit: 4
    t.boolean  "under_maintenance"
    t.boolean  "prevent_commenting"
    t.boolean  "tag_visibility"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "site_phrase",        limit: 255
    t.boolean  "display_reviews"
  end

  create_table "social_links", force: :cascade do |t|
    t.string   "url",              limit: 255
    t.string   "icon",             limit: 255
    t.integer  "social_module_id", limit: 4
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "social_links", ["social_module_id"], name: "index_social_links_on_social_module_id", using: :btree

  create_table "social_modules", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tags", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "visitors", force: :cascade do |t|
    t.string   "fullname",   limit: 255
    t.string   "email",      limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_foreign_key "bios", "moderators"
  add_foreign_key "comments", "posts"
  add_foreign_key "comments", "visitors"
  add_foreign_key "messages", "visitors"
  add_foreign_key "post_tags", "posts"
  add_foreign_key "post_tags", "tags"
  add_foreign_key "posts", "moderators"
  add_foreign_key "social_links", "social_modules"
end
