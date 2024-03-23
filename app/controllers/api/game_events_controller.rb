class Api::GameEventsController < ApplicationController
  before_action :authenticate_user!

  def create
    @game_event = GameEvent.new(game_event_params.except(:type).merge(user: current_user))

    if @game_event.save
      render json: {
        "game_event":
          @game_event.as_json(
            methods: [:type],
            only: %i[id occurred_at type game_id user_id]
          )
      }
    else
      render json: @game_event.errors, status: :unprocessable_entity
    end
  end

  private

  def game_event_params
    params.require(:game_event).permit(:type, :occurred_at, :game_id)
  end
end
