10.times do
  Game.create(
    name: Faker::Game.title,
    url: Faker::Internet.url,
    category: %w[math reading speaking writing].sample
  )
end

