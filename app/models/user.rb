class User < ApplicationRecord
  has_many :notifications, as: :recipient, dependent: :destroy
end
