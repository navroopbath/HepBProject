Then /^it should render the calendar$/ do
  page.should have_content "April 2015"
end

When /^I click on the event "(.*)"$/ do |event_name|
  click_link("Clinic")
end

Then /^I should see a modal with information about "(.*)"$/ do |event_name|
  @event = Event.where(event_name: event_name)[0]
  page.should have_content @event.event_name
  page.should have_content @event.location
  page.should have_content @event.description
end