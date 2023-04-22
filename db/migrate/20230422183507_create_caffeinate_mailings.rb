# frozen_string_literal: true

class CreateCaffeinateMailings < ActiveRecord::Migration[7.0]
  def change
    create_table :caffeinate_mailings do |t|
      t.references :caffeinate_campaign_subscription, null: false, foreign_key: true, index: { name: 'index_caffeinate_mailings_on_campaign_subscription' }
      t.datetime :send_at, null: false
      t.datetime :sent_at
      t.datetime :skipped_at
      t.string :mailer_class, null: false
      t.string :mailer_action, null: false

      t.timestamps
    end

    add_index :caffeinate_mailings, %i[caffeinate_campaign_subscription_id send_at sent_at skipped_at], name: :index_caffeinate_mailings
  end
end
