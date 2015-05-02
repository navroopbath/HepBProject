class MembersController < ApplicationController
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

  def dashboard_home
    @events = @current_member.events.order(:date)
    @announcements = Announcement.where(pinned: true).order(:date_written)
    @ordered_members = Member.order(:last_name)
  end

  def announcements
    @ordered_announcements = Announcement.order(:date_written)
    @announ = Announcement.new
     if !params[:announ].nil?
      @announ.title = params[:announ][:title]
      @announ.body = params[:announ][:body]
      @announ.date_written = Time.now
      @announ.save 
     end
  end

  def get_announcement
    @to_edit = Announcement.find(params[:id])
  end

  def edit_announcement
    @to_edit = Announcement.find(params[:id])
    @to_edit.title = params[:announcement][:title]
    @to_edit.body = params[:announcement][:body]
    @to_edit.save!
    redirect_to members_announcements_path
  end

  def delete_announcement
      @to_delete = Announcement.find(params[:id])
     @to_delete.destroy
     redirect_to :action => 'announcements'
  end

  def pin_announcement
    @to_pin = Announcement.find(params[:id])
    @to_pin.pinned = !@to_pin.pinned
    @to_pin.save
    redirect_to :action => 'announcements'
  end 


  def stats
    @memevents = @current_mem.memevents
    @total_hours_completed = @memevents.inject(0){|sum, x| sum + x.hours}
    if @memevents.length > 2
      @num_required_events = 2
    else
      @num_required_events = @memevents.length
    end
  end

  def admin_settings
    @semester_start = Settings.semester_start_date.to_date
    @semester_end = Settings.semester_end_date.to_date
    @deadline_one = Settings.deadline_one.to_date
    @deadline_two = Settings.deadline_two.to_date
  end

  def update_admin_settings
    settings_hash = params["admin"]
    Settings.semester_start_date = settings_hash["semester_start"].to_date
    Settings.semester_end_date = settings_hash["semester_end"].to_date
    Settings.deadline_one = settings_hash["deadline_one"].to_date
    Settings.deadline_two = settings_hash["deadline_two"].to_date
    redirect_to :action => 'admin_settings'
  end


end