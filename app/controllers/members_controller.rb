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
  end

  def announcements
    @ordered_announcements = Announcement.order(:date_written)
    # if(params.has_key?(:one) && params.has_key?(:two))
    @announ = Announcement.new
     if !params[:announ].nil?
      @announ.title = params[:announ][:title]
      @announ.body = params[:announ][:body]
      @announ.date_written = Time.now
      @announ.save 
     end
  end

  def delete_announ
      @to_delete = Announcement.find(params[:id])
     @to_delete.destroy
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

end