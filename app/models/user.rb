class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :review_owners, class_name: 'Review', foreign_key: "account_owner_id"
  has_many :review_tenants, class_name: 'Review', foreign_key: "account_tenant_id"
end
