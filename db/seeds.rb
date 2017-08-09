users = [
  [Faker::Name.name, Faker::Internet.email, false, false, false],
  [Faker::Name.name, Faker::Internet.email, true, true, true],
  [Faker::Name.name, Faker::Internet.email, false, true, false],
  [Faker::Name.name, Faker::Internet.email, true, false, true]
]

users.each do |name, email, marketing, articles, digest|
  user = User.create(
    name: name,
    email: email,
    marketing: marketing,
    articles: articles,
    digest: digest
  )
  Token.generate(user)
end
