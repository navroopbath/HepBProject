ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain               => "gmail.com",
  :user_name            => "hepbproj-noreply@gmail.com",
  :password             => "campanile",
  :authentication       => "plain",
  :enable_starttls_auto => true
}