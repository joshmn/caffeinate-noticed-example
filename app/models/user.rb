class User < ApplicationRecord
  has_many :notifications, as: :recipient, dependent: :destroy

  after_commit :new_user_messages, on: :create

  acts_as_caffeinate_subscriber

  def new_user_messages
    WelcomeDripper.subscribe self
    WelcomeNotification.with(user: self).deliver(self)
  end
end
