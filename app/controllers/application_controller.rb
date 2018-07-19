class ApplicationController < ActionController::Base
  # 客制化view时，devise传入参数保护。
  before_action :configure_permitted_parameters, if: :devise_controller?
  # skip_before_action :verify_authenticity_token
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username])
  end
end
