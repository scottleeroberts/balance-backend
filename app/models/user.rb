class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher

  devise :database_authenticatable, :registerable, :recoverable, :validatable, :jwt_authenticatable,
         jwt_revocation_strategy: self

  has_many :game_events
  has_many :games, through: :game_events
  validates :email, presence: true, uniqueness: true

  def total_games_played_by_category(category)
    games.public_send("#{category}_games").count
  end
end
