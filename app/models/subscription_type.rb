class SubscriptionType < ApplicationRecord
  belongs_to :platform
  # belongs_to :platform_account
  validates :name, :description, :price, :payment_frequency, presence: true
end
