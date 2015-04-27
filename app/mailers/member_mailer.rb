class MemberMailer < ActionMailer::Base
  default from: "noreply@hepbproject.com"

  def registration_confirmation(member)
    @member = member
    mail(:to => "#{member.email}", :subject => "Welcome to Hep B Portal")
  end

end
