require "open-uri"

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
file = URI.open('https://upload.wikimedia.org/wikipedia/commons/0/0f/Logo_Netflix.png')
netflix.logo.attach(io: File.open(file), filename: 'netflix-logo.jpg', content_type: 'image/jpg')
netflix.save!

puts "Creating 2 platform_account"
alex_account_netflix = PlatformAccount.new( { seats_available: 2, seats_total: 5, account_type: 'family' } )
fred_account_netflix = PlatformAccount.new( { seats_available: 4, seats_total: 5, account_type: 'premium' } )


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
file = URI.open('https://upload.wikimedia.org/wikipedia/commons/thumb/2/26/Spotify_logo_with_text.svg/500px-Spotify_logo_with_text.svg.png')
spotify.logo.attach(io: File.open(file), filename: 'spotify-logo.jpg', content_type: 'image/jpg')
spotify.save!

puts "Creating 1 platform_account"
fred_account_spotify = PlatformAccount.new( { seats_available: 3, seats_total: 4, account_type: 'premium' } )

puts "Merging tables"
fred_account_spotify.platform = spotify
fred_account_spotify.user = fred
fred_account_spotify.save!

puts "Agaaaaiiinnnnnn"

puts "Creating 6 platforms"
hbo = Platform.new( { category: "vod_streaming", name: "HBO", max_seats_available: 6 } )
file = URI.open('https://upload.wikimedia.org/wikipedia/commons/thumb/d/de/HBO_logo.svg/844px-HBO_logo.svg.png')
hbo.logo.attach(io: File.open(file), filename: 'hbo-logo.png', content_type: 'image/png')
hbo.save!

yt_music = Platform.new( { category: "music_streaming", name: "Youtube Music", max_seats_available: 6 } )
file = URI.open("https://www.ladn.eu/wp-content/uploads/2018/06/youtube.jpg")
yt_music.logo.attach(io: file, filename: 'yt-music.jpg', content_type: 'image/jpg')
yt_music.save!

prime_video = Platform.new( { category: "vod_streaming", name: "Prime Video", max_seats_available: 6 } )
file = URI.open('https://upload.wikimedia.org/wikipedia/commons/thumb/1/11/Amazon_Prime_Video_logo.svg/1200px-Amazon_Prime_Video_logo.svg.png')
prime_video.logo.attach(io: File.open(file), filename: 'prime-video.png', content_type: 'image/png')
prime_video.save!

disney_plus = Platform.new( { category: "vod_streaming", name: "Diney Plus", max_seats_available: 6 } )
file = URI.open('https://upload.wikimedia.org/wikipedia/commons/thumb/3/3e/Disney+_logo.svg/340px-Disney+_logo.svg.png')
disney_plus.logo.attach(io: File.open(file), filename: 'disney-plus.png', content_type: 'image/png')
disney_plus.save!

le_monde = Platform.new( { category: "press", name: "Le Monde", max_seats_available: 6 } )
file = URI.open('https://upload.wikimedia.org/wikipedia/commons/thumb/4/43/Le_Monde.svg/634px-Le_Monde.svg.png')
le_monde.logo.attach(io: File.open(file), filename: 'le-monde-logo.png', content_type: 'image/png')
le_monde.save!

deezer = Platform.new( { category: "music_streaming", name: "Deezer", max_seats_available: 6 } )
file = URI.open('https://uploads-eu-west-1.insided.com/deezer-fr/attachment/eb56b366-e8e5-4085-b794-237df52f81b1.png')
deezer.logo.attach(io: file, filename: 'deezer.png', content_type: 'image/png')
deezer.save!

puts "Finished."
