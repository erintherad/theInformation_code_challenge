3.times do |u|
  user1 = User.create(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    marketing: false,
    articles: false,
    digest: false
  )
  Token.generate(user1)
end

3.times do |u|
  user2 = User.create(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    marketing: true,
    articles: true,
    digest: true
  )
  Token.generate(user2)
end

3.times do |u|
  user3 = User.create(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    marketing: false,
    articles: true,
    digest: false
  )
  Token.generate(user3)
end
