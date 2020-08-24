class Review < ApplicationRecord
  belongs_to :account_tenant, class_name: "User"
  belongs_to :account_owner, class_name: "User"
end
