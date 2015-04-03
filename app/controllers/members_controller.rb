class MembersController < ApplicationController
  before_filter :set_current_mem, :except => [:login_index, :login, :sign_up, :sign_up_index]

  def set_current_mem
    @current_mem ||= Member.find_by_id(session[:member_id])
    if !@current_mem
      flash[:notice] = "You must be signed in first."
      redirect_to members_login_index_path unless @current_mem
    end
  end

  def dashboard_home
    @events = @current_mem.events.order(:date)
    @announcements = Announcement.where(pinned: true).order(:date_written)
  end

  def announcements
    @ordered_announcements = Announcement.order(:date_written)
  end

  def stats
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