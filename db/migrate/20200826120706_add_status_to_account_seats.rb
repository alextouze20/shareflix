class AddStatusToAccountSeats < ActiveRecord::Migration[6.0]
  def change
    add_column :account_seats, :status, :string, default: 'pending'
  end
end
