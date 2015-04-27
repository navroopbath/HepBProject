Then /^it should render the calendar$/ do
  page.should have_content Time.now.strftime("%B %Y")
end

When /^I click on the event "(.*)"$/ do |event_name|
  click_link("#{event_name}")
end

Then /^I should see a modal with information about "(.*)"$/ do |event_name|
  @event = Event.where(event_name: event_name)[0]
  page.should have_content @event.event_name
  page.should have_content @event.location
  page.should have_content @event.description
end

Given /^that "(.*)" is signed up for the event "(.*)"$/ do |member, event_name|
  member_first_name = member.split(" ")[0]
  @member = Member.where(first_name: member_first_name)[0]
  @event = Event.where(event_name: event_name)[0]
  waitlisted = @event.memevents.length >= @event.num_volunteers ? 'true' : 'false'
  Memevent.create({  :event_id => @event.id, :member_id => @member.id, :hours => @event.duration, :waitlisted => waitlisted, :date_added => Time.now, :approved => 'true'  })
end