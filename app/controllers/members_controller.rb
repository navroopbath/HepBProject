class MembersController < ApplicationController

  def show
  	id = params[:id]
  	@member = Member.find(id)
  end

  def create
  	@member = Member.create!(params[:member])
  	flash[:notice] = "You have signed up with username: #{@member.email}"
  	# redirect_to 'not_sure'
  end

  def edit
  	@member = Member.find(params[:id])
  end

  def new
  	# render new view
  end

  def update
  	@member = Member.find(params[:id])
  	@member.update_attributes!(params[:member])
  	flash[:notice] = "#{@member.first_name} your information was successfully updated"
  	# redirect_to 'not sure'
  end

  def destroy
  	@member = Member.find(params[:id])
  	@member.destroy
  	flash[:notice] = "Member #{@member.first_name} #{@member.last_name} was destroyed"
  	# redirect_to 'not sure'
  end

  def login_index
  end

  def login
  
  end


  def sign_up_index
  end

  def sign_up
    if params[:members][:password] == params[:members][:confirm_password] 
      if not empty_fields?
        flash[:notice] = 'You have been sent a confirmation email'
        redirect_to members_login_index_path and return
      else
        flash[:notice] = 'One or more of the fields are empty'
        #session[:members]
        flash.keep
        redirect_to members_sign_up_index_path and return
      end
    else
      flash[:notice] = 'Passwords do not match'
      # session[:members]
      flash.keep
      redirect_to members_sign_up_index_path and return
    end
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