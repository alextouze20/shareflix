class AddDescriptionPlatform < ActiveRecord::Migration[6.0]
  def change
    add_column :platforms, :description, :text
  end
end
