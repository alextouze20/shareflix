require "open-uri"

puts "Cleaning database..."

AccountSeat.destroy_all

SubscriptionType.destroy_all

Platform.destroy_all
ChatroomUser.destroy_all
Message.destroy_all
Chatroom.destroy_all

PlatformAccount.destroy_all

User.destroy_all
Review.destroy_all


puts "Creating 2 user"
alex = User.new( { first_name: "Alex", last_name: "Touze", password: "azertyuiop", email: "alex@shareflix.com", country: 'France', bio: "Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus. Proin eget tortor risus. Nulla quis lorem ut libero malesuada feugiat."  } )
alexpfp = URI.open("https://ca.slack-edge.com/T02NE0241-U016C4UCDMY-d679a8ccd566-512")
alex.photo.attach(io: File.open(alexpfp), filename: 'admin-pfp.jpg', content_type: 'image/jpg')
alex.save!

fred = User.new( { first_name: "Fred", last_name: "Gégé", password: "azertyuiop", email: "fred@shareflix.com", country: 'France', bio: "Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus. Proin eget tortor risus. Nulla quis lorem ut libero malesuada feugiat." } )
fredpfp = URI.open("https://a1cf74336522e87f135f-2f21ace9a6cf0052456644b80fa06d4f.ssl.cf2.rackcdn.com/images/characters_opt/scooby-fred.jpg")
fred.photo.attach(io: File.open(fredpfp), filename: 'admin-pfp.jpg', content_type: 'image/jpg')
fred.save!

puts "Creating 1 platform"
netflix = Platform.new( { category: "vod_streaming", name: "Netflix", max_seats_available: 6, description: "Curabitur non nulla sit amet nisl tempus convallis quis ac lectus. Pellentesque in ipsum id orci porta dapibus. Donec sollicitudin molestie malesuada."  } )
file = URI.open('https://upload.wikimedia.org/wikipedia/commons/0/0f/Logo_Netflix.png')
netflix.logo.attach(io: File.open(file), filename: 'netflix-logo.jpg', content_type: 'image/jpg')
netflix.save!

puts "Creating 2 subscription types"
normal = SubscriptionType.new( { name: "Standard", description: "Un compte Standard", price: 15.99, payment_frequency: 'monthly'} )
premium = SubscriptionType.new( { name: "Premium", description: "Un compte Premium", price: 11.99, payment_frequency: 'monthly'} )

puts "Creating 2 platform_account"
alex_account_netflix = PlatformAccount.new( { seats_available: 2, seats_total: 5, account_type: 'family' } )
fred_account_netflix = PlatformAccount.new( { seats_available: 4, seats_total: 5, account_type: 'premium' } )


puts "Merging tables"
normal.platform = netflix
premium.platform = netflix
normal.save!
premium.save!

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
spotify = Platform.new( { category: "music_streaming", name: "Spotify", max_seats_available: 6, description: "Curabitur non nulla sit amet nisl tempus convallis quis ac lectus. Pellentesque in ipsum id orci porta dapibus. Donec sollicitudin molestie malesuada." } )
file = URI.open('https://upload.wikimedia.org/wikipedia/commons/thumb/2/26/Spotify_logo_with_text.svg/500px-Spotify_logo_with_text.svg.png')
spotify.logo.attach(io: File.open(file), filename: 'spotify-logo.jpg', content_type: 'image/jpg')
spotify.save!

puts "Creating 1 platform_account"
fred_account_spotify = PlatformAccount.new( { seats_available: 3, seats_total: 4, account_type: 'premium' } )

puts "Creating 2 subscription_types"
normal1 = SubscriptionType.new( { name: "Standard", description: "Un compte Standard", price: 15.99, payment_frequency: 'monthly'} )
premium1 = SubscriptionType.new( { name: "Premium", description: "Un compte Premium", price: 11.99, payment_frequency: 'monthly'} )


puts "Merging tables"
normal1.platform = spotify
premium1.platform = spotify
normal1.save!
premium1.save!

fred_account_spotify.platform = spotify
fred_account_spotify.user = fred
fred_account_spotify.save!

puts "Agaaaaiiinnnnnn"

puts "Creating 6 platforms"
hbo = Platform.new( { category: "vod_streaming", name: "HBO", max_seats_available: 6, description: "Curabitur non nulla sit amet nisl tempus convallis quis ac lectus. Pellentesque in ipsum id orci porta dapibus. Donec sollicitudin molestie malesuada."  } )
file = URI.open('https://upload.wikimedia.org/wikipedia/commons/thumb/d/de/HBO_logo.svg/844px-HBO_logo.svg.png')
hbo.logo.attach(io: File.open(file), filename: 'hbo-logo.png', content_type: 'image/png')
hbo.save!

puts "Creating 2 subscription types"
normalhbo = SubscriptionType.new( { name: "Standard", description: "Un compte Standard", price: 15.99, payment_frequency: 'monthly'} )
premiumhbo = SubscriptionType.new( { name: "Premium", description: "Un compte Premium", price: 11.99, payment_frequency: 'monthly'} )
normalhbo.platform = hbo
premiumhbo.platform = hbo
normalhbo.save!
premiumhbo.save!

yt_music = Platform.new( { category: "music_streaming", name: "Youtube Music", max_seats_available: 6, description: "Curabitur non nulla sit amet nisl tempus convallis quis ac lectus. Pellentesque in ipsum id orci porta dapibus. Donec sollicitudin molestie malesuada."  } )
file = URI.open("https://www.ladn.eu/wp-content/uploads/2018/06/youtube.jpg")
yt_music.logo.attach(io: file, filename: 'yt-music.jpg', content_type: 'image/jpg')
yt_music.save!

prime_video = Platform.new( { category: "vod_streaming", name: "Prime Video", max_seats_available: 6, description: "Curabitur non nulla sit amet nisl tempus convallis quis ac lectus. Pellentesque in ipsum id orci porta dapibus. Donec sollicitudin molestie malesuada."  } )
file = URI.open('https://upload.wikimedia.org/wikipedia/commons/thumb/1/11/Amazon_Prime_Video_logo.svg/1200px-Amazon_Prime_Video_logo.svg.png')
prime_video.logo.attach(io: File.open(file), filename: 'prime-video.png', content_type: 'image/png')
prime_video.save!

disney_plus = Platform.new( { category: "vod_streaming", name: "Diney Plus", max_seats_available: 6, description: "Curabitur non nulla sit amet nisl tempus convallis quis ac lectus. Pellentesque in ipsum id orci porta dapibus. Donec sollicitudin molestie malesuada."  } )
file = URI.open('https://upload.wikimedia.org/wikipedia/commons/thumb/3/3e/Disney+_logo.svg/340px-Disney+_logo.svg.png')
disney_plus.logo.attach(io: File.open(file), filename: 'disney-plus.png', content_type: 'image/png')
disney_plus.save!

le_monde = Platform.new( { category: "press", name: "Le Monde", max_seats_available: 6, description: "Curabitur non nulla sit amet nisl tempus convallis quis ac lectus. Pellentesque in ipsum id orci porta dapibus. Donec sollicitudin molestie malesuada."  } )
file = URI.open('https://upload.wikimedia.org/wikipedia/commons/thumb/4/43/Le_Monde.svg/634px-Le_Monde.svg.png')
le_monde.logo.attach(io: File.open(file), filename: 'le-monde-logo.png', content_type: 'image/png')
le_monde.save!

deezer = Platform.new( { category: "music_streaming", name: "Deezer", max_seats_available: 6, description: "Curabitur non nulla sit amet nisl tempus convallis quis ac lectus. Pellentesque in ipsum id orci porta dapibus. Donec sollicitudin molestie malesuada."  } )
file = URI.open('https://uploads-eu-west-1.insided.com/deezer-fr/attachment/eb56b366-e8e5-4085-b794-237df52f81b1.png')
deezer.logo.attach(io: file, filename: 'deezer.png', content_type: 'image/png')
deezer.save!
puts "seed for chat"
require "faker"
netflix_chat = Chatroom.new(platform_account: fred_account_netflix)
spotify_chat = Chatroom.new(platform_account: fred_account_spotify)
ChatroomUser.create(chatroom: netflix_chat, user: fred, admin: true)
ChatroomUser.create(chatroom: spotify_chat, user: fred, admin: true)
10.times do
  Message.create!(user: fred, content: Faker::Quote.famous_last_words, chatroom: netflix_chat)
  Message.create!(user: fred, content: Faker::Quote.famous_last_words, chatroom: spotify_chat)
end
puts "Finished."
