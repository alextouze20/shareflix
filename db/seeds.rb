require "open-uri"
require "faker"

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


puts "Creating 7 users"
alex = User.new( { first_name: "Alex", last_name: "Touze", password: "azertyuiop", email: "alex@shareflix.com", country: 'France', bio: "My name is Alex and I'm a big fan of cinema. My favorite TV show is The Wire by David Simon."  } )
alexpfp = URI.open("https://ca.slack-edge.com/T02NE0241-U016C4UCDMY-d679a8ccd566-512")
alex.photo.attach(io: File.open(alexpfp), filename: 'admin-pfp.jpg', content_type: 'image/jpg')
alex.save!

fred = User.new( { first_name: "Fred", last_name: "Smith", password: "azertyuiop", email: "fred@shareflix.com", country: 'France', bio: "My name is Frederic and I'm a big fan of old 70's movie like Marathon Man etc." } )
fredpfp = URI.open("https://images.pexels.com/photos/2379005/pexels-photo-2379005.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=550&w=550")
fred.photo.attach(io: File.open(fredpfp), filename: 'admin-pfp.jpg', content_type: 'image/jpg')
fred.save!

amina = User.new( { first_name: "Amina", last_name: "Smith", password: "azertyuiop", email: "amina@shareflix.com", country: 'France', bio: "My name is Amina and I love watching sports like soccer or tennis. I'm a very competitive person." } )
aminapfp = URI.open("https://images.pexels.com/photos/2100063/pexels-photo-2100063.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260")
amina.photo.attach(io: File.open(aminapfp), filename: 'admin-pfp.jpg', content_type: 'image/jpg')
amina.save!

sofia = User.new( { first_name: "Sofia", last_name: "Smith", password: "azertyuiop", email: "sofia@shareflix.com", country: 'France', bio: "Hi! I'm Sofia and I love pop-music like everybody esle. I'm not a very unique person." } )
sofiapfp = URI.open("https://images.pexels.com/photos/733872/pexels-photo-733872.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260")
sofia.photo.attach(io: File.open(sofiapfp), filename: 'admin-pfp.jpg', content_type: 'image/jpg')
sofia.save!

patricia = User.new( { first_name: "Patricia", last_name: "Belle Bono", password: "azertyuiop", email: "patricia@shareflix.com", country: 'France', bio: "My name is Patricia and I love movie about love and romance. My favorite actor is Brad Pitt <3." } )
patriciapfp = URI.open("https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1598344755/h4fffdritigsa9w2rkti.jpg")
patricia.photo.attach(io: File.open(patriciapfp), filename: 'admin-pfp.jpg', content_type: 'image/jpg')
patricia.save!

octave = User.new( { first_name: "Octave", last_name: "Collombel", password: "azertyuiop", email: "octave@shareflix.com", country: 'France', bio: "My name is Octave and I watch love complicated movies like Christopher Nolan's movies." } )
octavepfp = URI.open("https://avatars0.githubusercontent.com/u/65617616?v=4")
octave.photo.attach(io: File.open(octavepfp), filename: 'admin-pfp.jpg', content_type: 'image/jpg')
octave.save!

corentin = User.new( { first_name: "Corentin", last_name: "Bourda", password: "azertyuiop", email: "corentin@shareflix.com", country: 'France', bio: "My name is Corentin and I love documentaries about animals like bears or fish. I spend all my sunday watching that." } )
corentinpfp = URI.open("https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1594190864/ynf39hutlfzvjadsvqay.jpg")
corentin.photo.attach(io: File.open(corentinpfp), filename: 'admin-pfp.jpg', content_type: 'image/jpg')
corentin.save!

michel = User.new( { first_name: "Michel", last_name: "Smith", password: "azertyuiop", email: "michel@shareflix.com", country: 'France', bio: "" } )
michel.save!

var_rating = [4, 5]
var_content = ["All good!", "Nothing to declare! All good!", "Everything went well! Thanks :)"]

puts "Creating user reviews"

var_iteration = [1, 2, 3]
var_rating = [4, 5]
var_content = ["All good!", "Nothing to declare! All good!", "Everything went well! Thanks :)"]

reviews_fred = Review.new( {account_owner_id: sofia.id, account_tenant_id: fred.id, content: var_content.sample, rating: var_rating.sample } )
reviews_fred.save!
reviews_fred = Review.new( {account_owner_id: amina.id, account_tenant_id: fred.id, content: var_content.sample, rating: var_rating.sample } )
reviews_fred.save!
reviews_fred = Review.new( {account_owner_id: octave.id, account_tenant_id: fred.id, content: var_content.sample, rating: var_rating.sample } )
reviews_fred.save!

reviews_octave = Review.new( {account_owner_id: fred.id, account_tenant_id: octave.id, content: var_content.sample, rating: var_rating.sample } )
reviews_octave.save!
reviews_octave = Review.new( {account_owner_id: amina.id, account_tenant_id: octave.id, content: var_content.sample, rating: var_rating.sample } )
reviews_octave.save!
reviews_octave = Review.new( {account_owner_id: sofia.id, account_tenant_id: octave.id, content: var_content.sample, rating: var_rating.sample } )
reviews_octave.save!
reviews_octave = Review.new( {account_owner_id: alex.id, account_tenant_id: octave.id, content: var_content.sample, rating: var_rating.sample } )
reviews_octave.save!

puts "Creating Netflix (1/8)"
netflix = Platform.new( { category: "vod_streaming", name: "Netflix", max_seats_available: 6, description: "Watch Netflix movies & TV shows online or stream right to your smart TV, game console, PC, Mac, mobile, tablet and more."  } )
file = URI.open('https://upload.wikimedia.org/wikipedia/commons/0/0f/Logo_Netflix.png')
netflix.logo.attach(io: File.open(file), filename: 'netflix-logo.jpg', content_type: 'image/jpg')
netflix.save!

netflix_normal = SubscriptionType.new( { name: "Standard", description: "Standard account", price: 9.99, payment_frequency: 'monthly', seats_total: 5} )
netflix_premium = SubscriptionType.new( { name: "Premium", description: "Premium account", price: 15.99, payment_frequency: 'monthly', seats_total: 9} )

netflix_normal.platform = netflix
netflix_premium.platform = netflix
netflix_normal.save!
netflix_premium.save!

puts "Creating HBO (2/8)"

hbo = Platform.new( { category: "vod_streaming", name: "HBO", max_seats_available: 6, description: "Discover full episodes of original series, movies, schedule information, exclusive video content, episode guides and more. With HBO GO®, enjoy instant and unlimited access to every episode of every season of the best HBO shows, movies, comedy, sports, and documentaries."  } )
file = URI.open('https://upload.wikimedia.org/wikipedia/commons/thumb/d/de/HBO_logo.svg/844px-HBO_logo.svg.png')
hbo.logo.attach(io: File.open(file), filename: 'hbo-logo.png', content_type: 'image/png')
hbo.save!

hbo_normal = SubscriptionType.new( { name: "Standard", description: "Standard account", price: 9.99, payment_frequency: 'monthly', seats_total: 5} )
hbo_premium = SubscriptionType.new( { name: "Premium", description: "Premium account", price: 15.99, payment_frequency: 'monthly', seats_total: 9} )

hbo_normal.platform = hbo
hbo_premium.platform = hbo
hbo_normal.save!
hbo_premium.save!

puts "Creating Spotify (3/8)"

spotify = Platform.new( { category: "music_streaming", name: "Spotify", max_seats_available: 6, description: "Spotify is a digital music service that gives you access to millions of songs and podcasts. Listen to the songs and podcasts you love and find music from all over the world." } )
file = URI.open('https://upload.wikimedia.org/wikipedia/commons/thumb/2/26/Spotify_logo_with_text.svg/500px-Spotify_logo_with_text.svg.png')
spotify.logo.attach(io: File.open(file), filename: 'spotify-logo.jpg', content_type: 'image/jpg')
spotify.save!

spotify_normal = SubscriptionType.new( { name: "Standard", description: "Standard account", price: 9.99, payment_frequency: 'monthly', seats_total: 4} )
spotify_premium = SubscriptionType.new( { name: "Premium", description: "Premium account", price: 15.99, payment_frequency: 'monthly', seats_total: 6} )
spotify_normal.platform = spotify
spotify_premium.platform = spotify
spotify_normal.save!
spotify_premium.save!

puts "Creating Youtube Music (4/8)"

yt_music = Platform.new( { category: "music_streaming", name: "Youtube Music", max_seats_available: 6, description: "Visit the YouTube Music Channel to find today's top talent, featured artists, and playlists. Subscribe to see the latest in the music world."  } )
file = URI.open("https://www.ladn.eu/wp-content/uploads/2018/06/youtube.jpg")
yt_music.logo.attach(io: file, filename: 'yt-music.jpg', content_type: 'image/jpg')
yt_music.save!

yt_music_normal = SubscriptionType.new( { name: "Standard", description: "Standard account", price: 9.99, payment_frequency: 'monthly', seats_total: 6} )
yt_music_premium = SubscriptionType.new( { name: "Premium", description: "Premium account", price: 15.99, payment_frequency: 'monthly', seats_total: 8} )

yt_music_normal.platform = yt_music
yt_music_premium.platform = yt_music
yt_music_normal.save!

puts "Creating Prime Video (5/8)"

prime_video = Platform.new( { category: "vod_streaming", name: "Prime Video", max_seats_available: 6, description: "Enjoy exclusive Amazon Originals as well as popular movies and TV shows. Watch anytime, anywhere. Start your free trial."  } )
file = URI.open('https://upload.wikimedia.org/wikipedia/commons/thumb/1/11/Amazon_Prime_Video_logo.svg/1200px-Amazon_Prime_Video_logo.svg.png')
prime_video.logo.attach(io: File.open(file), filename: 'prime-video.png', content_type: 'image/png')
prime_video.save!

prime_video_normal = SubscriptionType.new( { name: "Standard", description: "Standard account", price: 9.99, payment_frequency: 'monthly', seats_total: 5} )
prime_video_premium = SubscriptionType.new( { name: "Premium", description: "Premium account", price: 15.99, payment_frequency: 'monthly', seats_total: 7} )

prime_video_normal.platform = prime_video
prime_video_premium.platform = prime_video
prime_video_normal.save!

puts "Creating Disney + (6/8)"

disney_plus = Platform.new( { category: "vod_streaming", name: "Diney Plus", max_seats_available: 6, description: "Watch your favorite Disney videos from Disney Channel, Disney XD, movies, music videos, Disney on YouTube, and much more!"  } )
file = URI.open('https://upload.wikimedia.org/wikipedia/commons/thumb/3/3e/Disney+_logo.svg/340px-Disney+_logo.svg.png')
disney_plus.logo.attach(io: File.open(file), filename: 'disney-plus.png', content_type: 'image/png')
disney_plus.save!

disney_plus_normal = SubscriptionType.new( { name: "Standard", description: "Standard account", price: 9.99, payment_frequency: 'monthly', seats_total: 4} )
disney_plus_premium = SubscriptionType.new( { name: "Premium", description: "Premium account", price: 15.99, payment_frequency: 'monthly', seats_total: 8} )

disney_plus_normal.platform = disney_plus
disney_plus_premium.platform = disney_plus
disney_plus_normal.save!

puts "Creating Le Monde (7/8)"

le_monde = Platform.new( { category: "press", name: "Le Monde", max_seats_available: 6, description: "Le Monde is a French daily afternoon newspaper. It is the main publication of Le Monde Group and reported an average circulation of 323,039 copies per issue in 2009, about 40,000 of which were sold abroad."  } )
file = URI.open('https://upload.wikimedia.org/wikipedia/commons/thumb/4/43/Le_Monde.svg/634px-Le_Monde.svg.png')
le_monde.logo.attach(io: File.open(file), filename: 'le-monde-logo.png', content_type: 'image/png')
le_monde.save!

le_monde_normal = SubscriptionType.new( { name: "Standard", description: "Standard account", price: 4.99, payment_frequency: 'monthly', seats_total: 11} )

le_monde_normal.platform = le_monde
le_monde_normal.save!

puts "Creating Deezer (8/8)"

deezer = Platform.new( { category: "music_streaming", name: "Deezer", max_seats_available: 6, description: "Deezer is a French online music streaming service. It allows users to listen to music content from record labels, including Universal Music Group, Sony Music and Warner Music Group on various devices online or offline."  } )
file = URI.open('https://uploads-eu-west-1.insided.com/deezer-fr/attachment/eb56b366-e8e5-4085-b794-237df52f81b1.png')
deezer.logo.attach(io: file, filename: 'deezer.png', content_type: 'image/png')
deezer.save!

deezer_normal = SubscriptionType.new( { name: "Standard", description: "Standard account", price: 9.99, payment_frequency: 'monthly', seats_total: 5} )
deezer_premium = SubscriptionType.new( { name: "Premium", description: "Premium account", price: 15.99, payment_frequency: 'monthly', seats_total: 9} )

deezer_normal.platform = deezer
deezer_premium.platform = deezer
deezer_normal.save!

puts "Creating account HBO - fred"
fred_account_hbo = PlatformAccount.new( { seats_available: 4, account_type: hbo_premium.id } )

fred_account_hbo.platform = hbo
fred_account_hbo.user = fred
fred_account_hbo.save!

fred_account_hbo_chat = Chatroom.new(platform_account: fred_account_hbo)
ChatroomUser.create(chatroom: fred_account_hbo_chat, user: fred, admin: true)

puts "Creating account spotify - fred"
fred_account_spotify = PlatformAccount.new( { seats_available: 2, account_type: spotify_normal.id } )

fred_account_spotify.platform = spotify
fred_account_spotify.user = fred
fred_account_spotify.save!

fred_account_spotify_chat = Chatroom.new(platform_account: fred_account_spotify)
ChatroomUser.create(chatroom: fred_account_spotify_chat, user: fred, admin: true)

puts "Creating account disney plus - patricia"
patricia_account_disney_plus = PlatformAccount.new( { seats_available: 2, account_type: disney_plus_normal.id } )

patricia_account_disney_plus.platform = disney_plus
patricia_account_disney_plus.user = patricia
patricia_account_disney_plus.save!

patricia_account_disney_plus_chat = Chatroom.new(platform_account: patricia_account_disney_plus)
ChatroomUser.create(chatroom: patricia_account_disney_plus_chat, user: patricia, admin: true)

puts "Creating account prime video - octave"
octave_account_prime_video = PlatformAccount.new( { seats_available: 1, account_type: prime_video_normal.id } )

octave_account_prime_video.platform = prime_video
octave_account_prime_video.user = octave
octave_account_prime_video.save!

octave_account_prime_video_chat = Chatroom.new(platform_account: octave_account_prime_video)
ChatroomUser.create(chatroom: octave_account_prime_video_chat, user: octave, admin: true)

puts "Creating account le monde - corentin"
corentin_account_le_monde = PlatformAccount.new( { seats_available: 2, account_type: le_monde_normal.id } )

corentin_account_le_monde.platform = le_monde
corentin_account_le_monde.user = corentin
corentin_account_le_monde.save!

corentin_account_le_monde_chat = Chatroom.new(platform_account: corentin_account_le_monde)
ChatroomUser.create(chatroom: corentin_account_le_monde_chat, user: corentin, admin: true)

puts "Creating account HBO - amina"
amina_account_hbo = PlatformAccount.new( { seats_available: 2, account_type: hbo_normal.id } )

amina_account_hbo.platform = hbo
amina_account_hbo.user = amina
amina_account_hbo.save!

amina_account_hbo_chat = Chatroom.new(platform_account: amina_account_hbo)
ChatroomUser.create(chatroom: amina_account_hbo_chat, user: amina, admin: true)

puts "Creating account HBO - octave"
octave_account_hbo = PlatformAccount.new( { seats_available: 1, account_type: hbo_premium.id } )

octave_account_hbo.platform = hbo
octave_account_hbo.user = octave
octave_account_hbo.save!

octave_account_hbo_chat = Chatroom.new(platform_account: octave_account_hbo)
ChatroomUser.create(chatroom: octave_account_hbo_chat, user: octave, admin: true)

puts "Creating account disney plus - corentin"
corentin_account_disney_plus = PlatformAccount.new( { seats_available: 1, account_type: disney_plus_normal.id } )

corentin_account_disney_plus.platform = disney_plus
corentin_account_disney_plus.user = corentin
corentin_account_disney_plus.save!

corentin_account_disney_plus_chat = Chatroom.new(platform_account: corentin_account_disney_plus)
ChatroomUser.create(chatroom: corentin_account_disney_plus_chat, user: corentin, admin: true)

puts "Creating account HBO - michel"
michel_account_hbo = PlatformAccount.new( { seats_available: 2, account_type: hbo_normal.id } )

michel_account_hbo.platform = hbo
michel_account_hbo.user = michel
michel_account_hbo.save!

michel_account_hbo_chat = Chatroom.new(platform_account: michel_account_hbo)
ChatroomUser.create(chatroom: michel_account_hbo_chat, user: michel, admin: true)

puts "Finished."
