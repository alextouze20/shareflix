
puts "Cleaning database..."
User.destroy_all
Platform.destroy_all


puts "Creating 1 user"
user = User.new( { first_name: "ad", last_name: "min", password: "admin123456", email: "admin@shareflix.com", country: 'France' } )
user.save!
puts "creating 1 platform"
platform = Platform.new( { category: "vod_streaming", name: "Netflix" } )
platform.save!
