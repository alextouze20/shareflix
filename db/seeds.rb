
puts "Cleaning database..."
User.destroy_all
Platform.destroy_all
PlatformAccount.destroy_all


puts "Creating 1 user"
alex = User.new( { first_name: "Alex", last_name: "Touze", password: "azertyuiop", email: "alex@shareflix.com", country: 'France' } )
alex.save!
puts "Creating 1 platform"
netflix = Platform.new( { category: "vod_streaming", name: "Netflix" } )
netflix.save!

puts "Creating 1 platform_account"
alex_account = PlatformAccount.new( { seats_available: 2, seats_total: 5, family_account?: true } )

puts "Merging tables"
alex_account.platform = netflix
alex_account.user = alex
alex_account.save!

puts "Agaaaaiiinnnnnn"

puts "Creating 1 user"
fred = User.new( { first_name: "Fred", last_name: "Gégé", password: "azertyuiop", email: "fred@shareflix.com", country: 'France' } )
fred.save!
puts "Creating 1 platform"
spotify = Platform.new( { category: "music_streaming", name: "Spotify" } )
spotify.save!

puts "Creating 1 platform_account"
fred_account = PlatformAccount.new( { seats_available: 3, seats_total: 4, family_account?: true } )

puts "Merging tables"
fred_account.platform = spotify
fred_account.user = fred
fred_account.save!

puts "Finished."
