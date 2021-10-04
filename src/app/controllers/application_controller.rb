class ApplicationController < ActionController::Base
  # deviseにおけるstrong_parameterの追加 https://qiita.com/you8/items/1781029c5d14aa23bded

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :birthday])
  end

end
