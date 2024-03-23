class Api::GameEventsController < ApplicationController
  before_action :authenticate_user!
  # before_action :set_game_event, only: %i[show update destroy]

  # # GET /game_events
  # def index
  #   @game_events = GameEvent.all

  #   render json: @game_events
  # end

  # # GET /game_events/1
  # def show
  #   render json: @game_event
  # end

  # POST /game_events
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

  #   # PATCH/PUT /game_events/1
  #   def update
  #     if @game_event.update(game_event_params)
  #       render json: @game_event
  #     else
  #       render json: @game_event.errors, status: :unprocessable_entity
  #     end
  #   end

  # DELETE /game_events/1
  # def destroy
  #   @game_event.destroy!
  # end

  private

  # Use callbacks to share common setup or constraints between actions.
  # def set_game_event
  #   @game_event = GameEvent.find(params[:id])
  # end

  # Only allow a list of trusted parameters through.
  def game_event_params
    params.require(:game_event).permit(:type, :occurred_at, :game_id)
  end
end
