class AddAccountTypeToPlatformAccounts < ActiveRecord::Migration[6.0]
  def change
    add_column :platform_accounts, :account_type, :string
    remove_column :platform_accounts, :family_account?
  end
end
