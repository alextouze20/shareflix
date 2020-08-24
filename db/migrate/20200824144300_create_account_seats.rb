class CreateAccountSeats < ActiveRecord::Migration[6.0]
  def change
    create_table :account_seats do |t|
      t.references :user, null: false
      t.references :platform_account, null: false

      t.timestamps
    end
  end
end
