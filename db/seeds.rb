10.times do
  User.create(
    full_name: Faker::Name.name,
    email: Faker::Internet.email,
    username: Faker::Internet.username,
    password: Faker::Internet.password,
    jti: SecureRandom.uuid
  )

  Game.create(
    name: Faker::Game.title,
    url: Faker::Internet.url,
    category: %w[math reading speaking writing].sample
  )

  GameEvent.create(
    game_id: Game.all.sample.id,
    occurred_at: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now),
    ge_type: %w[completed].sample
  )
end
