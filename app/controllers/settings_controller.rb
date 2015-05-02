class SettingsController < ApplicationController
  before_filter :authenticate_member!
  # To verify if a user is signed in, use the following helper:
  # user_signed_in?
  #
  # For the current signed-in user, this helper is available:
  # current_user
  #
  # You can access the session for this scope:
  # user_session
  before_filter :set_current_mem

  def set_current_mem
    @current_mem ||= current_member
  end

  def index
    @semester_start = Settings.semester_start_date.to_date
    @semester_end = Settings.semester_end_date.to_date
    @deadline_one = Settings.deadline_one.to_date
    @deadline_two = Settings.deadline_two.to_date
  end

  def update
    settings_hash = params["admin"]
    Settings.semester_start_date = settings_hash["semester_start"].to_date
    Settings.semester_end_date = settings_hash["semester_end"].to_date
    Settings.deadline_one = settings_hash["deadline_one"].to_date
    Settings.deadline_two = settings_hash["deadline_two"].to_date
    redirect_to :action => 'index'
  end
end