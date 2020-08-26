class AddMaximumSeatAvailableToPlatform < ActiveRecord::Migration[6.0]
  def change
    add_column :platforms, :max_seats_available, :integer
  end
end
