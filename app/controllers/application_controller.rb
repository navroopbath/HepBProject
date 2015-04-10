class ApplicationController < ActionController::Base
  protect_from_forgery

  def after_sign_in_path_for(member)
    members_dashboard_home_path(member)
  end
end
