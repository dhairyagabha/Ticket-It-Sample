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

ActiveRecord::Schema.define(version: 20180401164207) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "ticket_it_addresses", force: :cascade do |t|
    t.string "name"
    t.string "street1"
    t.string "street2"
    t.string "city"
    t.string "state"
    t.string "country"
    t.string "zipcode"
    t.bigint "addressable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["addressable_id"], name: "index_ticket_it_addresses_on_addressable_id"
  end

  create_table "ticket_it_comments", force: :cascade do |t|
    t.string "commenter_type"
    t.bigint "commenter_id"
    t.string "commentable_type"
    t.bigint "commentable_id"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["commentable_type", "commentable_id"], name: "index_ticket_it_comments_on_commentable_type_and_commentable_id"
    t.index ["commenter_type", "commenter_id"], name: "index_ticket_it_comments_on_commenter_type_and_commenter_id"
  end

  create_table "ticket_it_reporters", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "phone"
    t.string "organization"
    t.text "notes"
    t.string "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_ticket_it_reporters_on_email"
    t.index ["name"], name: "index_ticket_it_reporters_on_name"
    t.index ["organization"], name: "index_ticket_it_reporters_on_organization"
    t.index ["phone"], name: "index_ticket_it_reporters_on_phone"
  end

  create_table "ticket_it_tickets", force: :cascade do |t|
    t.string "number"
    t.string "status"
    t.string "name"
    t.text "description"
    t.integer "resource_id"
    t.string "ticket_type"
    t.string "priority"
    t.string "prefered_contact"
    t.datetime "closed_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "ticket_it_reporter_id"
    t.index ["name"], name: "index_ticket_it_tickets_on_name"
    t.index ["number"], name: "index_ticket_it_tickets_on_number"
    t.index ["priority"], name: "index_ticket_it_tickets_on_priority"
    t.index ["resource_id"], name: "index_ticket_it_tickets_on_resource_id"
    t.index ["status"], name: "index_ticket_it_tickets_on_status"
    t.index ["ticket_it_reporter_id"], name: "index_ticket_it_tickets_on_ticket_it_reporter_id"
    t.index ["ticket_type"], name: "index_ticket_it_tickets_on_type"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "ticket_it_tickets", "ticket_it_reporters"
end
