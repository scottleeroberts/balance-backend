require 'test_helper'

class UserStatsTest < ActiveSupport::TestCase
  def setup
    @user = users(:one)
    @user_stats = UserStats.new(@user)
  end

  test 'to_json returns correct stats' do
    # Assuming you have set up some game and game_event fixtures associated with the user.
    expected_json = {
      total_games_played: @user.games.count,
      total_math_games_played: @user.total_games_played_by_category('math'),
      total_reading_games_played: @user.total_games_played_by_category('reading'),
      total_speaking_games_played: @user.total_games_played_by_category('speaking'),
      total_writing_games_played: @user.total_games_played_by_category('writing'),
      current_streak_in_days: @user.streak_days
    }.to_json

    assert_equal expected_json, @user_stats.to_json
  end
end
