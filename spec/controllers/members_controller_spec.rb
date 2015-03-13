require 'spec_helper'

describe MembersController do

  describe 'POST sign up' do

    subject {post :sign_up}

    before :each do
      @member = Member.create!({:first_name => 'Craig', :last_name => 'Hiller', :year => 'Senior', :phone => 5555555555, :email => 'chiller@berkeley.edu', :password => 'superchillerbro'})
      Member.should_receive(:create!).and_return(@member)
      subject
    end

    it "should create a new member in the database" do
      expect(assigns(:member)).to eq @member
    end

    it "should set a flash message that a confirmation email has been sent" do
      expect(flash[:notice]).to match(/^You have been sent a confirmation email$/)
    end

    it "should redirect to /members/login" do
      expect(subject).to redirect_to(members_login_index_path) 
    end

  end

  # describe 'POST login' do

  #   subject {post :login}

  #   before :each do
  #     @member = Member.create!({:first_name => 'Craig', :last_name => 'Hiller', :year => 'Senior', :phone => 5555555555, :email => 'chiller@berkeley.edu', :password => 'superchillerbro'})
  #     Member.should_receive(:create!).and_return(@member)
  #     subject
  #   end

  #   it "should destroy movie from the database" do
  #     expect(assigns(:movie)).to eq @movie
  #   end

  #   it "should set a flash message that the movie was deleted successfully" do
  #     expect(flash[:notice]).to match(/^Movie 'Star Wars 2' deleted./)
  #   end

  #   it "should redirect to /movies" do
  #     expect(subject).to redirect_to(movies_path)
  #   end


  # end
  
end