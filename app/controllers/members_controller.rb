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
    redirect_to members_login_index_path
  end

end