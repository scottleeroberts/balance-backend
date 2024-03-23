class ApplicationController < ActionController::API
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[username full_name email password])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[username full_name email password])
  end
end
