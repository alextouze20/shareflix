class PlatformAccount < ApplicationRecord
  belongs_to :user
  belongs_to :platform
  has_many :account_seats
  has_one :chatroom
end
