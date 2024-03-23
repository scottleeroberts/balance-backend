require "test_helper"

class GameEventsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @game_event = game_events(:one)
  end

  test "should get index" do
    get game_events_url, as: :json
    assert_response :success
  end

  test "should create game_event" do
    assert_difference("GameEvent.count") do
      post game_events_url, params: { game_event: { game_id: @game_event.game_id, ge_type: @game_event.ge_type, occurred_at: @game_event.occurred_at } }, as: :json
    end

    assert_response :created
  end

  test "should show game_event" do
    get game_event_url(@game_event), as: :json
    assert_response :success
  end

  test "should update game_event" do
    patch game_event_url(@game_event), params: { game_event: { game_id: @game_event.game_id, ge_type: @game_event.ge_type, occurred_at: @game_event.occurred_at } }, as: :json
    assert_response :success
  end

  test "should destroy game_event" do
    assert_difference("GameEvent.count", -1) do
      delete game_event_url(@game_event), as: :json
    end

    assert_response :no_content
  end
end
