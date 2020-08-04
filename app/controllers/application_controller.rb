class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  # def after_sign_in_path_for(resource)
  #   new_group_path
  # end 
  # #ログアウト後のリダイレクト先
  # def after_sign_out_path_for(resource)
  #   new_user_registration_path
  # end 
end
