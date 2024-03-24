require 'test_helper'

class Api::GamesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @user = users(:one)
    sign_in @user
  end

  test 'should get index' do
    get api_games_url
    assert_response :success

    games_response = JSON.parse(response.body)['games']
    assert_equal games(:two).as_json(only: %i[id url name category]), games_response.first
    assert_equal games(:one).as_json(only: %i[id url name category]), games_response.second
  end
end
