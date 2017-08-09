5.times do |i|
  user = User.create(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    marketing: [true, false].sample,
    articles: [true, false].sample,
    digest: [true, false].sample
  )
  Token.generate(user)
end
