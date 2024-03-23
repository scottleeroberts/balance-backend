class Api::GamesController < ApplicationController
  before_action :authenticate_user!

  def index
    @games = Game.all

    render json: {
      "games": @games.as_json(only: %i[id url name category])
    }
  end
end
