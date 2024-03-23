require 'test_helper'

class Api::UsersControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @user = users(:one)
    sign_in @user
  end

  test 'should get user info' do
    get api_user_url
    assert_response :success

    user_response = JSON.parse(response.body)
    assert_equal @user.id, user_response['user']['id']
    assert_equal @user.username, user_response['user']['username']
    assert_equal @user.email, user_response['user']['email']
    assert_equal @user.full_name, user_response['user']['full_name']
    assert_equal JSON.parse(UserStats.new(@user).to_json), user_response['user']['stats']
  end
end
