# require 'spec_helper'

# describe RegistrationsController do

#   describe 'POST sign up' do

#     before :each do
#       @fields = {:first_name => 'John', :last_name => 'Doe', :grad_date => '05/18/15', :phone => '5555555555', :email => 'johndoe@gmail.com', :password => 'password123', :confirm_password => 'password123'}
#       post :create, {:member => @fields}
#     end

#     it "should create a new member in the database" do
#       expect(Member.where(id: 1)[0].email).to eq 'johndoe@gmail.com'
#     end

#     it "should set a flash message that a confirmation email has been sent" do
#       expect(flash[:notice]).to match(/^Welcome! You have signed up successfully.$/)
#     end

#     it "should redirect to /members/sign_in" do
#       expect(subject).to redirect_to(new_member_session_path) 
#     end

#   end

  
# end