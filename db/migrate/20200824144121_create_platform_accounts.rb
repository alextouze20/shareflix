class CreatePlatformAccounts < ActiveRecord::Migration[6.0]
  def change
    create_table :platform_accounts do |t|
      t.integer :seats_available
      t.integer :seats_total
      t.boolean :family_account?
      t.references :user, null: false
      t.references :platform, null: false

      t.timestamps
    end
  end
end
