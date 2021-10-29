class ApplicationController < ActionController::Base
  # deviseにおけるstrong_parameterの追加 https://qiita.com/you8/items/1781029c5d14aa23bded

  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    frames_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :birthday])
  end

end
