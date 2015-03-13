class MembersController < ApplicationController

  def dashboard_home
  end

  def login_index
  end

  def login
  end


  def sign_up_index
    @first_name = nil
    @last_name = nil
    @phone = nil
    @year = nil
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
          params[:members][:hours] = 0
          Member.create!(params[:members])
          redirect_to members_login_index_path and return
        end
      else
        flash[:notice] = 'One or more of the fields are empty'
        fields = [:first_name, :last_name, :year, :phone, :email, :password, :confirm_password]
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
      fields = [:first_name, :last_name, :year, :phone, :email]
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

end