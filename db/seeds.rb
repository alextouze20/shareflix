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
alex = User.new( { first_name: "Alex", last_name: "Touze", password: "azertyuiop", email: "alex@shareflix.com", country: 'France', bio: "My name is Alex and I'm a big fan of cinema. My favorite TV show is The Wire by David Simon."  } )
alexpfp = URI.open("https://ca.slack-edge.com/T02NE0241-U016C4UCDMY-d679a8ccd566-512")
alex.photo.attach(io: File.open(alexpfp), filename: 'admin-pfp.jpg', content_type: 'image/jpg')
alex.save!

fred = User.new( { first_name: "Fred", last_name: "Gégé", password: "azertyuiop", email: "fred@shareflix.com", country: 'France', bio: "My name is Frederic and I'm a big fan of old 70's movie like Marathon Man etc." } )
fredpfp = URI.open("https://images.pexels.com/photos/2379005/pexels-photo-2379005.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=550&w=550")
fred.photo.attach(io: File.open(fredpfp), filename: 'admin-pfp.jpg', content_type: 'image/jpg')
fred.save!

puts "Creating 2 platform netflix + hbo"
netflix = Platform.new( { category: "vod_streaming", name: "Netflix", max_seats_available: 6, description: "Watch Netflix movies & TV shows online or stream right to your smart TV, game console, PC, Mac, mobile, tablet and more."  } )
file = URI.open('https://upload.wikimedia.org/wikipedia/commons/0/0f/Logo_Netflix.png')
netflix.logo.attach(io: File.open(file), filename: 'netflix-logo.jpg', content_type: 'image/jpg')
netflix.save!

hbo = Platform.new( { category: "vod_streaming", name: "HBO", max_seats_available: 6, description: "Discover full episodes of original series, movies, schedule information, exclusive video content, episode guides and more. With HBO GO®, enjoy instant and unlimited access to every episode of every season of the best HBO shows, movies, comedy, sports, and documentaries."  } )
file = URI.open('https://upload.wikimedia.org/wikipedia/commons/thumb/d/de/HBO_logo.svg/844px-HBO_logo.svg.png')
hbo.logo.attach(io: File.open(file), filename: 'hbo-logo.png', content_type: 'image/png')
hbo.save!

puts "Creating 2 subscription types netflix "
normal = SubscriptionType.new( { name: "Standard", description: "Standard account", price: 9.99, payment_frequency: 'monthly'} )
premium = SubscriptionType.new( { name: "Premium", description: "Premium account", price: 15.99, payment_frequency: 'monthly'} )

puts "Merging tables netflix"
normal.platform = netflix
premium.platform = netflix
normal.save!
premium.save!

puts "Creating 2 subscription types hbo "
normalhbo = SubscriptionType.new( { name: "Standard", description: "Standard account", price: 15.99, payment_frequency: 'monthly'} )
premiumhbo = SubscriptionType.new( { name: "Premium", description: "Premium account", price: 11.99, payment_frequency: 'monthly'} )

puts "Merging tables netflix hbo "
normalhbo.platform = hbo
premiumhbo.platform = hbo
normalhbo.save!
premiumhbo.save!

puts "Creating 1 platform_account - fred"
fred_account_hbo = PlatformAccount.new( { seats_available: 4, seats_total: 5, account_type: normal.id } )

fred_account_hbo.platform = hbo
fred_account_hbo.user = fred
fred_account_hbo.save!

# puts "Attempting to create an account seat for fred on alex's netflix account"
# account_seat = AccountSeat.new( { status: 'pending' } )
# account_seat.platform_account = alex_account_netflix
# account_seat.user = fred
# account_seat.save!

puts "Agaaaaiiinnnnnn"

puts "Creating 1 platform"
spotify = Platform.new( { category: "music_streaming", name: "Spotify", max_seats_available: 6, description: "Spotify is a digital music service that gives you access to millions of songs and podcasts. Listen to the songs and podcasts you love and find music from all over the world." } )
file = URI.open('https://upload.wikimedia.org/wikipedia/commons/thumb/2/26/Spotify_logo_with_text.svg/500px-Spotify_logo_with_text.svg.png')
spotify.logo.attach(io: File.open(file), filename: 'spotify-logo.jpg', content_type: 'image/jpg')
spotify.save!

puts "Creating 2 subscription_types"
normal1 = SubscriptionType.new( { name: "Standard", description: "Standard account", price: 9.99, payment_frequency: 'monthly'} )
premium1 = SubscriptionType.new( { name: "Premium", description: "Premium account", price: 11.99, payment_frequency: 'monthly'} )


puts "Merging tables"
normal1.platform = spotify
premium1.platform = spotify
normal1.save!
premium1.save!

puts "Creating 1 platform_account"
fred_account_spotify = PlatformAccount.new( { seats_available: 3, seats_total: 4, account_type: premium1.id } )

fred_account_spotify.platform = spotify
fred_account_spotify.user = fred
fred_account_spotify.save!

puts "Agaaaaiiinnnnnn"

yt_music = Platform.new( { category: "music_streaming", name: "Youtube Music", max_seats_available: 6, description: "Visit the YouTube Music Channel to find today's top talent, featured artists, and playlists. Subscribe to see the latest in the music world."  } )
file = URI.open("https://www.ladn.eu/wp-content/uploads/2018/06/youtube.jpg")
yt_music.logo.attach(io: file, filename: 'yt-music.jpg', content_type: 'image/jpg')
yt_music.save!

prime_video = Platform.new( { category: "vod_streaming", name: "Prime Video", max_seats_available: 6, description: "Enjoy exclusive Amazon Originals as well as popular movies and TV shows. Watch anytime, anywhere. Start your free trial."  } )
file = URI.open('https://upload.wikimedia.org/wikipedia/commons/thumb/1/11/Amazon_Prime_Video_logo.svg/1200px-Amazon_Prime_Video_logo.svg.png')
prime_video.logo.attach(io: File.open(file), filename: 'prime-video.png', content_type: 'image/png')
prime_video.save!

disney_plus = Platform.new( { category: "vod_streaming", name: "Diney Plus", max_seats_available: 6, description: "Watch your favorite Disney videos from Disney Channel, Disney XD, movies, music videos, Disney on YouTube, and much more!"  } )
file = URI.open('https://upload.wikimedia.org/wikipedia/commons/thumb/3/3e/Disney+_logo.svg/340px-Disney+_logo.svg.png')
disney_plus.logo.attach(io: File.open(file), filename: 'disney-plus.png', content_type: 'image/png')
disney_plus.save!

le_monde = Platform.new( { category: "press", name: "Le Monde", max_seats_available: 6, description: "Le Monde is a French daily afternoon newspaper. It is the main publication of Le Monde Group and reported an average circulation of 323,039 copies per issue in 2009, about 40,000 of which were sold abroad."  } )
file = URI.open('https://upload.wikimedia.org/wikipedia/commons/thumb/4/43/Le_Monde.svg/634px-Le_Monde.svg.png')
le_monde.logo.attach(io: File.open(file), filename: 'le-monde-logo.png', content_type: 'image/png')
le_monde.save!

deezer = Platform.new( { category: "music_streaming", name: "Deezer", max_seats_available: 6, description: "Deezer is a French online music streaming service. It allows users to listen to music content from record labels, including Universal Music Group, Sony Music and Warner Music Group on various devices online or offline."  } )
file = URI.open('https://uploads-eu-west-1.insided.com/deezer-fr/attachment/eb56b366-e8e5-4085-b794-237df52f81b1.png')
deezer.logo.attach(io: file, filename: 'deezer.png', content_type: 'image/png')
deezer.save!

puts "Seed for chat"
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
