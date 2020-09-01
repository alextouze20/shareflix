class CreateReports < ActiveRecord::Migration[6.0]
  def change
    create_table :reports do |t|
      t.references :reported, null: false
      t.references :reporter, null: false
      t.string :reason
      t.text :content

      t.timestamps
    end
  end
end
