ActionMailer::Base.smtp_settings = {
  :address              => "smtp.mailgun.org",
  :port                 => "587",
  :domain               => "mailgun.org",
  :user_name            => ENV["mailgun_username"],
  :password             => ENV["mailgun_password"],
  :authentication       => "plain",
  :enable_starttls_auto => true
}