require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user_one = users(:one)
    @user_two = users(:two)
  end

  test 'valid user' do
    assert @user_one.valid?
    assert @user_two.valid?
  end

  test 'invalid without email' do
    @user_one.email = nil
    assert_not @user_one.valid?
  end

  test 'email must be unique' do
    duplicate_user = @user_one.dup
    assert_not duplicate_user.valid?
  end

  test 'jti must be unique' do
    duplicate_user = @user_one.dup
    duplicate_user.email = 'unique@example.com'
    assert_not duplicate_user.valid?
  end

  test 'total_games_played_by_category' do
    category = 'math'
    assert_equal 0, @user_one.total_games_played_by_category(category)
  end

  test 'streak_days defaults to 0' do
    new_user = User.new(email: 'new@example.com', password: 'password', full_name: 'New User', username: 'newuser',
                        jti: 'unique_jwt_identifier_3')
    assert_equal 0, new_user.streak_days
  end
end
