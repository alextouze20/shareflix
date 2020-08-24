class PlatformAccount < ApplicationRecord
  belongs_to :user
  belongs_to :platform
  has_many :account_seats
  has_one :chatroom

  validates :seats_available, :seats_total, :family_account?, presence: true
end
