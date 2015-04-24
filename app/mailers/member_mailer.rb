class MemberMailer < ActionMailer::Base
  default from: "sandbox60b4290575ab49f386dd50fc026416a2.mailgun.org"

  def registration_confirmation(member)
    @member = member
    mail(:to => "#{member.email}", :subject => "Welcome to Hep B Portal")
  end
end
