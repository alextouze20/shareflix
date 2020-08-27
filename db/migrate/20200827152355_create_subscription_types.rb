class CreateSubscriptionTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :subscription_types do |t|
      t.string :name
      t.string :description
      t.float :price
      t.string :payment_frequency
      t.references :platform, null: false, foreign_key: true
      # t.references :platform_account, null: false, foreign_key: true

      t.timestamps
    end
  end
end
