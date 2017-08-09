user1 = User.create(
  name: Faker::Name.name,
  email: Faker::Internet.email,
  marketing: false,
  articles: false,
  digest: false
)

Token.generate(user1)

user2 = User.create(
  name: Faker::Name.name,
  email: Faker::Internet.email,
  marketing: true,
  articles: true,
  digest: true
)

Token.generate(user2)

user3 = User.create(
  name: Faker::Name.name,
  email: Faker::Internet.email,
  marketing: false,
  articles: true,
  digest: false
)

Token.generate(user3)
