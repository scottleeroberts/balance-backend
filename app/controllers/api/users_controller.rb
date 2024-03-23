class Api::UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    render json: {
      user: {
        id: current_user.id,
        username: current_user.username,
        email: current_user.email,
        full_name: current_user.full_name,
        stats: JSON.parse(UserStats.new(current_user).to_json)
      }
    }
  end
end
