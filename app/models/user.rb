class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :reviews
  has_many :review_owners, class_name: 'Review', foreign_key: "account_owner_id"
  has_many :review_tenants, class_name: 'Review', foreign_key: "account_tenant_id"
  has_many :account_seats
  has_many :platform_accounts
  has_many :chatroom_users
  has_many :chatrooms, through: :chatroom_users
  has_many :messages
  validates :first_name, :last_name, :country, presence: true
  has_one_attached :photo

  def subscribed?(account)
    account_seats.where(platform_account: account).any?
  end
end
