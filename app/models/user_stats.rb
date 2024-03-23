class UserStats
  def initialize(user)
    @user = user
  end

  def to_json(*_args)
    {
      total_games_played: @user.games.count,
      total_math_games_played: @user.total_games_played_by_category('math'),
      total_reading_games_played: @user.total_games_played_by_category('reading'),
      total_speaking_games_played: @user.total_games_played_by_category('speaking'),
      total_writing_games_played: @user.total_games_played_by_category('writing')
    }.to_json
  end
end
