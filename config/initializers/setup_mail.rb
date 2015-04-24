ActionMailer::Base.smtp_settings = {
  :address              => "smtp.mailgun.org",
  :port                 => "587",
  :domain               => "mailgun.org",
  :user_name            => "postmaster@sandbox60b4290575ab49f386dd50fc026416a2.mailgun.org",
  :password             => "8c8238822e15be46e138d3974cde9129",
  :authentication       => "plain",
  :enable_starttls_auto => true
}