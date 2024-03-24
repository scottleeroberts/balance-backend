class Api::GamesController < ApplicationController
  before_action :authenticate_user!

  # GET /games
  def index
    @games = Game.all

    render json: {
      "games": @games.as_json(only: %i[id url name category])
    }
  end

  # # GET /games/1
  # def show
  #   @game = Game.find(params[:id])
  #   render json: @game
  # end

  # # POST /games
  # def create
  #   @game = Game.new(game_params)

  #   if @game.save
  #     render json: @game, status: :created, location: @game
  #   else
  #     render json: @game.errors, status: :unprocessable_entity
  #   end
  # end

  # # PATCH/PUT /games/1
  # def update
  #   @game = Game.find(params[:id])
  #   if @game.update(game_params)
  #     render json: @game
  #   else
  #     render json: @game.errors, status: :unprocessable_entity
  #   end
  # end

  # # DELETE /games/1
  # def destroy
  #   @game = Game.find(params[:id])
  #   @game.destroy!
  # end

  # private

  # # Only allow a list of trusted parameters through.
  # def game_params
  #   params.require(:game).permit(:name, :url, :category)
  # end
end
