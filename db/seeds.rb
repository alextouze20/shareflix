puts "Cleaning database..."
User.destroy_all

puts "Creating 1 user"
user = User.new( { first_name: "ad", last_name: "min", password: "admin123456", email: "admin@shareflix.com", country: 'France' } )

puts "Creating 1 platform"

netflix = Platforms.new(
  name: "Netflix",
  category: "Video",
)

puts "Creating 1 platform account"

alex_account = PlatformsAccounts.new(
  seats_total: 5,
  seats_available: 2,
)

puts "Link tables"

platform_accounts.account_seat.user = user
netflix.platform_accounts = alex_account


