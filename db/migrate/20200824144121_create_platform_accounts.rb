class CreatePlatformAccounts < ActiveRecord::Migration[6.0]
  def change
    create_table :platform_accounts do |t|
      t.integer :seats_available
      t.integer :seats_total
      t.boolean :family
      t.user :references
      t.platform :references

      t.timestamps
    end
  end
end
