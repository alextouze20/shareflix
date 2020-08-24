class CreateAccountSeats < ActiveRecord::Migration[6.0]
  def change
    create_table :account_seats do |t|
      t.user :references
      t.platform_account :references

      t.timestamps
    end
  end
end
