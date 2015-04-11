require "spec_helper"

describe MemberMailer do
  before :each do
    ActionMailer::Base.delivery_method = :test
    ActionMailer::Base.perform_deliveries = true
    ActionMailer::Base.deliveries = []
    @fields = {:first_name => 'John', :last_name => 'Doe', :grad_date => 'May 18, 2015', :phone => '5555555555', :email => 'johndoe@gmail.com', :password => 'password123'}
    @member = Member.create!(@fields)
    MemberMailer.registration_confirmation(@member).deliver
  end

  it 'should send a confirmation email after successful registration' do
    ActionMailer::Base.deliveries.count.should == 2
  end

  it 'should send to the correct member email' do
    ActionMailer::Base.deliveries.first.to.first.should == @fields[:email]
  end
end
