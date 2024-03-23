require 'test_helper'

class GameEventTest < ActiveSupport::TestCase
  setup do
    @user = users(:one)
    @game = games(:one)

    @user.update(streak_days: 0)
  end

  test 'should increment streak_days when played yesterday and today' do
    GameEvent.create!(ge_type: :completed, occurred_at: Date.yesterday, game: @game, user: @user)
    GameEvent.create!(ge_type: :completed, occurred_at: Date.today, game: @game, user: @user)
    @user.reload
    assert_equal 1, @user.streak_days, 'User streak_days should be incremented'
  end

  test 'should reset streak_days to 1 when not played yesterday' do
    GameEvent.create!(ge_type: :completed, occurred_at: Date.today, game: @game, user: @user)
    @user.reload

    assert_equal 1, @user.streak_days, 'User streak_days should be reset to 1'
  end

  test 'should not increment streak_days when played multiple times today' do
    GameEvent.create!(ge_type: :completed, occurred_at: Date.yesterday, game: @game, user: @user)
    GameEvent.create!(ge_type: :completed, occurred_at: Date.today, game: @game, user: @user)
    GameEvent.create!(ge_type: :completed, occurred_at: Date.today, game: @game, user: @user)

    @user.reload

    assert_equal 1, @user.streak_days, 'User streak_days should not be incremented when played multiple times today'
  end
end
