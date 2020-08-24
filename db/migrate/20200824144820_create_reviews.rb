class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.references :account_owner, null: false
      t.references :account_tenant, null: false
      t.text :content
      t.integer :rating

      t.timestamps
    end
  end
end
