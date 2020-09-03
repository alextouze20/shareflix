class AddSeatsTotalToSubscriptionTypes < ActiveRecord::Migration[6.0]
  def change
    add_column :subscription_types, :seats_total, :integer
    remove_column :platform_accounts, :seats_total
  end
end
