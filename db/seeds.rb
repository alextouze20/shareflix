
puts "Cleaning database..."
User.destroy_all
Platform.destroy_all
PlatformAccount.destroy_all


puts "Creating 2 user"
alex = User.new( { first_name: "Alex", last_name: "Touze", password: "azertyuiop", email: "alex@shareflix.com", country: 'France' } )
alex.save!

fred = User.new( { first_name: "Fred", last_name: "Gégé", password: "azertyuiop", email: "fred@shareflix.com", country: 'France' } )
fred.save!

puts "Creating 1 platform"
netflix = Platform.new( { category: "vod_streaming", name: "Netflix", max_seats_available: 6 } )
netflix.save!


puts "Creating 2 platform_account"
alex_account_netflix = PlatformAccount.new( { seats_available: 2, seats_total: 5, account_type: 'family' } )
fred_account_netflix = PlatformAccount.new( { seats_available: 4, seats_total: 5, account_type: 'prenium' } )


puts "Merging tables"
alex_account_netflix.platform = netflix
alex_account_netflix.user = alex
alex_account_netflix.save!

fred_account_netflix.platform = netflix
fred_account_netflix.user = fred
fred_account_netflix.save!

# puts "Attempting to create an account seat for fred on alex's netflix account"
# account_seat = AccountSeat.new( { status: 'pending' } )
# account_seat.platform_account = alex_account_netflix
# account_seat.user = fred
# account_seat.save!

puts "Agaaaaiiinnnnnn"

puts "Creating 1 platform"
spotify = Platform.new( { category: "music_streaming", name: "Spotify", max_seats_available: 6 } )
spotify.save!

puts "Creating 1 platform_account"
fred_account_spotify = PlatformAccount.new( { seats_available: 3, seats_total: 4, account_type: 'prenium' } )

puts "Merging tables"
fred_account_spotify.platform = spotify
fred_account_spotify.user = fred
fred_account_spotify.save!

puts "Finished."
