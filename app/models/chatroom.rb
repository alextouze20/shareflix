class Chatroom < ApplicationRecord
  belongs_to :platform_account
  has_many :chatroom_users, dependent: :destroy
  has_many :users, through: :chatroom_users
  has_many :messages
end
