# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_04_22_183507) do
  create_table "caffeinate_campaign_subscriptions", force: :cascade do |t|
    t.integer "caffeinate_campaign_id", null: false
    t.string "subscriber_type", null: false
    t.integer "subscriber_id", null: false
    t.string "user_type"
    t.integer "user_id"
    t.string "token", null: false
    t.datetime "ended_at"
    t.string "ended_reason"
    t.datetime "resubscribed_at"
    t.datetime "unsubscribed_at"
    t.string "unsubscribe_reason"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["caffeinate_campaign_id", "subscriber_id", "subscriber_type", "user_id", "user_type", "ended_at", "resubscribed_at", "unsubscribed_at"], name: "index_caffeinate_campaign_subscriptions"
    t.index ["caffeinate_campaign_id"], name: "caffeineate_campaign_subscriptions_on_campaign"
    t.index ["token"], name: "index_caffeinate_campaign_subscriptions_on_token", unique: true
  end

  create_table "caffeinate_campaigns", force: :cascade do |t|
    t.string "name", null: false
    t.string "slug", null: false
    t.boolean "active", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["slug"], name: "index_caffeinate_campaigns_on_slug", unique: true
  end

  create_table "caffeinate_mailings", force: :cascade do |t|
    t.integer "caffeinate_campaign_subscription_id", null: false
    t.datetime "send_at", null: false
    t.datetime "sent_at"
    t.datetime "skipped_at"
    t.string "mailer_class", null: false
    t.string "mailer_action", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["caffeinate_campaign_subscription_id", "send_at", "sent_at", "skipped_at"], name: "index_caffeinate_mailings"
    t.index ["caffeinate_campaign_subscription_id"], name: "index_caffeinate_mailings_on_campaign_subscription"
  end

  create_table "notifications", force: :cascade do |t|
    t.string "recipient_type", null: false
    t.integer "recipient_id", null: false
    t.string "type", null: false
    t.json "params"
    t.datetime "read_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["read_at"], name: "index_notifications_on_read_at"
    t.index ["recipient_type", "recipient_id"], name: "index_notifications_on_recipient"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "caffeinate_campaign_subscriptions", "caffeinate_campaigns"
  add_foreign_key "caffeinate_mailings", "caffeinate_campaign_subscriptions"
end
