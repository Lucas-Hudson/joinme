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

ActiveRecord::Schema.define(version: 2019_09_17_110145) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "friendship_notifications", force: :cascade do |t|
    t.boolean "is_read?", default: false
    t.bigint "actor_id"
    t.bigint "recipient_id"
    t.bigint "action_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["action_id"], name: "index_friendship_notifications_on_action_id"
    t.index ["actor_id"], name: "index_friendship_notifications_on_actor_id"
    t.index ["recipient_id"], name: "index_friendship_notifications_on_recipient_id"
  end

  create_table "friendships", force: :cascade do |t|
    t.integer "user_id"
    t.integer "friend_id"
    t.integer "status", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "invitation_notifications", force: :cascade do |t|
    t.boolean "is_read?", default: false
    t.bigint "actor_id"
    t.bigint "recipient_id"
    t.bigint "action_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["action_id"], name: "index_invitation_notifications_on_action_id"
    t.index ["actor_id"], name: "index_invitation_notifications_on_actor_id"
    t.index ["recipient_id"], name: "index_invitation_notifications_on_recipient_id"
  end

  create_table "invitations", force: :cascade do |t|
    t.bigint "admin_id"
    t.bigint "venue_id"
    t.datetime "start_date"
    t.boolean "is_finished", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["admin_id"], name: "index_invitations_on_admin_id"
    t.index ["venue_id"], name: "index_invitations_on_venue_id"
  end

  create_table "notif_actions", force: :cascade do |t|
    t.string "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_invites", force: :cascade do |t|
    t.bigint "invitation_id"
    t.bigint "guest_id"
    t.integer "status", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["guest_id"], name: "index_user_invites_on_guest_id"
    t.index ["invitation_id"], name: "index_user_invites_on_invitation_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.datetime "date_of_birth"
    t.string "phone_number"
    t.integer "rank"
    t.integer "points"
    t.boolean "is_admin?", default: false
    t.boolean "is_owner?", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "venues", force: :cascade do |t|
    t.bigint "owner_id"
    t.string "name"
    t.text "description"
    t.integer "min_drink_price"
    t.string "address"
    t.string "city"
    t.string "zip_code"
    t.boolean "food"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["owner_id"], name: "index_venues_on_owner_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
end
