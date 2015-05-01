require 'mailgun'

class Memevent < ActiveRecord::Base
  attr_accessible :hours, :waitlisted, :date_added, :approved, :event_id, :member_id
  belongs_to :member
  belongs_to :event

  def Memevent.send_email_reminders
    api_key = ENV["mailgun_api_key"]
    domain = ENV["mailgun_domain"]
    mg_client = Mailgun::Client.new(api_key)
    mb_obj = Mailgun::BatchMessage.new(mg_client, domain)
    # Define the from address.
    mb_obj.set_from_address("noreply@hepbproject.com", {"first"=>"Hep B Project", "last" => "Admins"})
    # Define the subject.
    mb_obj.set_subject("Reminder: You have an upcoming HBP event in 2 days");
    # Define the body of the message.
    mb_obj.set_text_body("
       Hello %recipient.first%, 
      
       This is a reminder that you are signed up to attend the %recipient.event-name% event on %recipient.event-date% (2 days from now) from %recipient.event-start% to %recipient.event-end%.
       If any scheduling conflicts have come up, please notify one of the HBP coordinators (contact info is available on the Hep B Portal).
                         
       Looking forward to seeing you there!
       
       - The Hep B Project Admins")
    no_recipient = true
    Memevent.find_each do |memevent|
      if memevent.event.date.to_date == Date.today + 2.days
        no_recipient = false
        mb_obj.add_recipient(:to, "#{memevent.member.email}", {"first" => "#{memevent.member.first_name}", 
                                                           "last" => "#{memevent.member.last_name}", 
                                                           "event-name" => "#{memevent.event.event_name}",
                                                           "event-date" => "#{memevent.event.date.strftime('%m/%d/%Y')}",
                                                           "event-start" => "#{memevent.event.start_time.strftime('%I:%M%p')}",
                                                           "event-end" => "#{memevent.event.end_time.strftime('%I:%M%p')}"})
      end
    end
    # Send your message through the client
    if not no_recipient
      message_ids = mb_obj.finalize
    end
  end
end