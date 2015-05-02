require 'mailgun'

class EventsController < ApplicationController
  respond_to :html, :json
  before_filter :set_current_mem, :authenticate_member!

  def set_current_mem
    @current_member ||= current_member
  end

  before_filter :set_current_mem

  def set_current_mem
    @current_mem ||= current_member
  end

  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
    @event_coordinators = []
    @event_volunteers = []
    @event_waitlist = []
    @current_member_signed_up = Memevent.where(member_id: current_member.id, event_id: @event.id).length == 1
    @event.memevents.each do |memevent|
      @event_coordinators << memevent.member if memevent.member.is_admin?
      @event_volunteers << memevent.member if !memevent.member.is_admin and !memevent.waitlisted
      @event_waitlist << memevent.member if !memevent.member.is_admin and memevent.waitlisted
    end
  end

  def create
    @new_event = Event.new
    if !params[:event].nil?
      @new_event = Event.create(params[:event])
      @new_event.save!
    end
    redirect_to events_index_path
  end

  def update
    @event = Event.where(id: params[:id])[0]
    flash[:error] = "You have successfully updated #{@event.event_name}."
    @event.update_attributes(params[:event])
    redirect_to events_index_path
  end

  def remove_other_member
    @event = Event.where(id: params[:id])[0]
    @member = Member.where(id: params[:member_id])[0]
    @memevent = Memevent.where(member_id: params[:member_id], event_id: params[:id])[0]
    @memevent.destroy
    bump_from_waitlist(@event, @member)
    flash[:error] = "You have successfully removed #{@member.first_name} #{@member.last_name} from #{@event.event_name}."
    redirect_to events_index_path
  end

  def remove_member
    @event = Event.where(id: params[:id])[0]
    @member = Member.where(id: current_member.id)[0]
    @memevent = Memevent.where(member_id: current_member.id, event_id: params[:id])[0]
    if Time.now + 2.days <= @event.start_time || @memevent.waitlisted
      @memevent.destroy  
      bump_from_waitlist(@event, @member)
      flash[:error] = "You have been successfully removed from #{@event.event_name}."
    else
      flash[:error] = "You cannot automatically remove yourself inside a 48 hour window before the #{@event.event_name}. Please contact the LC lead for further instrucitons if you need to drop."
    end
    redirect_to events_index_path
  end

  def signup
    @event = Event.where(id: params[:id])[0]
    num_volunteers = @event.memevents.select {  |memevent| memevent.member.is_admin == false }.length
    unless !permit_signup?(@event)
      if num_volunteers >= @event.num_volunteers
        waitlisted = true
      else
        waitlisted = false
      end
      Memevent.create(:event_id => @event.id, :member_id => current_member.id, :waitlisted => waitlisted, :date_added => Time.now.utc, :approved => 'true', :hours => @event.duration)
      waitlisted == true ? flash[:error] = "You have been waitlisted for #{@event.event_name}. You'll receive an email notification if you are moved into the volunteer list." : flash[:error] = "You have successfully signed up for #{@event.event_name}."
    end
    redirect_to events_index_path
  end

  def send_waitlist_notification(event, member)
    #using figaro
    api_key = ENV["mailgun_api_key"]
    domain = ENV["mailgun_domain"]
    mg_client = Mailgun::Client.new(api_key)
    mb_obj = Mailgun::BatchMessage.new(mg_client, domain)
    # Define the from address.
    mb_obj.set_from_address("noreply@hepbproject.com", {"first"=>"Hep B Project", "last" => "Admins"})
    # Define the subject.
    mb_obj.set_subject("You have been bumped up from the waitlist.");
    # Define the body of the message.
    mb_obj.set_text_body("
       Hello #{member.first_name}, 
      
       We just wanted to notify you that you've been bumped up from the waitlist for #{event.event_name} to the volunteer list. 
       As a reminder, the event is going to be held on #{event.date.strftime('%m/%d/%Y')} at #{event.start_time.strftime('%I:%M%p')}.
       
       - The Hep B Project Admins")
    mb_obj.add_recipient(:to, "#{member.email}", {"first" => "#{member.first_name}", 
                                                  "last" => "#{member.last_name}"})
    mb_obj.finalize
  end

  private
  def permit_signup?(event)
    if Memevent.where(member_id: current_member.id, event_id: event.id).length > 0
      flash[:error] = "You have already signed up for #{event.event_name}."
      false
    elsif Time.now > event.start_time
      flash[:error] = "The start time for #{event.event_name} has already passed."
      false
    else
      true
    end
  end

  def bump_from_waitlist(event, member)
    unless member.is_admin?
      @waitlisted_members = Memevent.where(:event_id => event.id, :waitlisted => true).order('date_added')
      if @waitlisted_members.length>0
        @member_to_bump = @waitlisted_members[0]
        @member_to_bump.waitlisted = false
        # send email
        send_waitlist_notification(event, member)
        @member_to_bump.save!
      end
    end
  end
end