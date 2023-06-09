class ApplicationController < ActionController::Base
  helper_method :current_user

  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password, :photo, :bio) }

    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:name, :email, :photo, :bio, :password, :current_password)
    end
  end
end
