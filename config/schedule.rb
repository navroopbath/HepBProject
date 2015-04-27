#check and send automatic emails to any members who have an event coming up in exactly 2 days
every :day, :at => '8:54 pm' do
  runner "Memevent.send_email_reminders"
end
