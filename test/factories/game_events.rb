FactoryBot.define do
  factory :game_event do
    ge_type { 1 }
    occurred_at { "2024-03-23 15:49:31" }
    game { nil }
  end
end
