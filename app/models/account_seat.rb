class AccountSeat < ApplicationRecord
  belongs_to :user
  belongs_to :platform_account
end
