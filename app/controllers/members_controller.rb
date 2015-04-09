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

  def delete_announ
      @to_delete = Announcement.find(params[:id])
     @to_delete.destroy
     redirect_to :action => 'announcements'
  end

  def pin_announ
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

  def admin_stats
    @allMembers = []
    Member.find_each do |member|
      mem = {}
      mem[:name] = member.full_name
      mem[:total_hours] = member.total_hours
      mem[:current_events] = member.num_current_events
      mem[:req_met] = member.num_current_events >= 2
      @allMembers << mem
    end
  end

  def login_index
  end

  def login
    if empty_fields?
      #one or more fields empty
      flash[:notice] = 'Unsuccessful login: One or more of the fields are empty'
      redirect_to members_login_index_path
    else
      if params[:members][:email]
        member_to_find = Member.find_by_email(params[:members][:email])
        if member_to_find and params[:members][:password] == member_to_find[:password]
          #successful login
          session[:member_id] = member_to_find.id
          session[:member] = member_to_find
          redirect_to members_dashboard_home_path(Member.where(id: member_to_find[:id])[0])
        else
          #incorrect password
          flash[:notice] = 'Unsuccessful login: Incorrect username or password'
          redirect_to members_login_index_path
        end
      else
        #no username
        flash[:notice] = 'Unsuccessful login: Incorrect username or password'
        redirect_to members_login_index_path
      end
    end
  end


  def sign_up_index
    @first_name = nil
    @last_name = nil
    @phone = nil
    @grad_date = nil
    @email = nil
  end

  def sign_up
    if params[:members][:email] and Member.find_by_email(params[:members][:email]) != nil
      flash[:notice] = "Account already exists"
      redirect_to members_sign_up_index_path and return
    end
    if params[:members][:password] == params[:members][:confirm_password] 
      if not empty_fields?
        if invalid?
          flash[:notice] = 'One or more of the entries are invalid'
          #TODO: save valid field entries in sessions
          redirect_to members_sign_up_index_path and return
        else
          flash[:notice] = 'You have been sent a confirmation email'
          params[:members].delete(:confirm_password)
          params[:members][:is_admin] = false
          member = Member.create!(params[:members])
          MemberMailer.registration_confirmation(member).deliver
          redirect_to members_login_index_path and return
        end
      else
        flash[:notice] = 'One or more of the fields are empty'
        fields = [:first_name, :last_name, :grad_date, :phone, :email, :password, :confirm_password]
        fields.each do |field|
          instance_variable_set("@#{field}", nil)
          if params[:members][field] != nil and params[:members][field] != ''
            instance_variable_set("@#{field}", params[:members][field])
          end
        end
        #flash.keep
        redirect_to members_sign_up_index_path and return
      end
    else
      flash[:notice] = 'Passwords do not match'
      fields = [:first_name, :last_name, :grad_date, :phone, :email]
      fields.each do |field|
        instance_variable_set("@#{field}", params[:members][field])
      end
      #flash.keep
      redirect_to members_sign_up_index_path and return
    end
  end

  def invalid?
    params[:members].each do |field|
      if field[0] == 'phone'
        if field[1].to_i == 0 or field[1].length != 10
          #TODO: set class of css selector for this element to invalid or yellow
          return true
        end
      elsif field[0] == 'email'
        if ( field[1] =~ /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i ) == nil
          return true
        end
      end
    end
    return false
  end

  def empty_fields?
    params[:members].each do |field| 
      if field[1] == nil or field[1] == '' 
        return true
      end
    end
    return false
  end

  def logout
    session[:member_id] = nil
    redirect_to members_login_index_path, :notice => "Logged out"
  end

end