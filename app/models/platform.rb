class Platform < ApplicationRecord
  has_many :platform_accounts
  has_many :subscription_types

  validates :category, :name, presence: true
  has_one_attached :logo
end
