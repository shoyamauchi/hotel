class ApplicationController < ActionController::Base
  # ログイン後のリダイレクト先
  def after_sign_in_path_for(resource)
    user_path(resource)
  end

  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
