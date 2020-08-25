class Chatroom < ApplicationRecord
  belongs_to :platform_account
  has_many :chatroom_users
  has_many :messages
end
