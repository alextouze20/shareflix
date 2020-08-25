class Platform < ApplicationRecord
  has_many :platform_accounts

  validates :category, :name, presence: true
  has_one_attached :photo
end
