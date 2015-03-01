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
    user = (Member.where email: params[:member][:email])[0]
    if user && user.authenticate(params[:member][:password])
      redirect_to member_home
    else
      flash.now[:danger] = "Invalid Email/Password combination."
      render 'new'
    end
  end

  def sign_up_index
  end

end
