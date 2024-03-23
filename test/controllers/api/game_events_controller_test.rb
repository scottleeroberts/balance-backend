require 'test_helper'

class Api::GameEventsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @user = users(:one)
    sign_in @user

    @game = Game.create(name: Faker::Game.title, url: Faker::Internet.url, category: 'math')
  end

  test 'should create game_event' do
    assert_difference('GameEvent.count') do
      post api_game_events_url,
           params: { game_event: { type: 'completed', occurred_at: Time.current, game_id: @game.id } }
    end

    assert_response :success

    game_event_response = JSON.parse(response.body)['game_event']
    assert_equal 'completed', game_event_response['type']
    assert_equal @game.id, game_event_response['game_id']
    assert_equal @user.id, game_event_response['user_id']
  end

  test 'should not create game_event with invalid data' do
    assert_no_difference('GameEvent.count') do
      post api_game_events_url, params: { game_event: { type: '', occurred_at: nil, game_id: nil } }
    end

    assert_response :unprocessable_entity
  end
end
