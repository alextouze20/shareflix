alex = User.new(
  email: "alex@gmail.com",
  first_name: "alex",
  last_name: "touze",
  password: "azertyuiop",
  country: "France",
)


netflix = Platforms.new(
  name: "Netflix",
  category: "Video",
)

alex_account = PlatformsAccounts.new(
  seats_total: 5,
  seats_available: 2,
)

platform_accounts.account_seat.user = alex
netflix.platform_accounts = alex_account
