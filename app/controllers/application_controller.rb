class ApplicationController < ActionController::Base
  protect_from_forgery
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :first_name, :last_name, :grad_date, :phone
    devise_parameter_sanitizer.for(:account_update) << :first_name, :last_name, :grad_date, :phone
  end
end
