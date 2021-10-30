class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!, only: [:new, :edit, :destroy]


  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:user_name])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:password_confirmation])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:profile])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:occupation])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:position])
  end
end
