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
  num_volunteers = @event.memevents.select {  |memevent| memevent.member.is_admin == false  }.length
  waitlisted = num_volunteers >= @event.num_volunteers ? true : false
  Memevent.create({  :event_id => @event.id, :member_id => @member.id, :hours => @event.duration, :waitlisted => waitlisted, :date_added => Time.now, :approved => 'true'  })
end

Then /^I should see the member "(.*)" under "(.*)"$/ do |member, category|
  member_position = page.body.index(member)
  category_position = page.body.index(category)
  assert(member_position = category_position +1, "#{member} is not on the #{category}.")
end

When /^I update the modal field "(.*)" with "(.*)"$/ do |field, value|
  field = 'event_' + field.downcase.split(' ').join('_')
  find("\##{field}").set(value)
end

And /^in the modal I follow "(.*)"$/ do |link|
  link = find('#' + link.downcase.split(' ').join('_'))
  link.click
end

And /^in the modal I click remove "(.*)"$/ do |volunteer|
  all('li.list-group-item.list-group-item-info').select {|elt| elt.text == volunteer}[0].find('a').click
end
# And /^it is not within 2 days of the event "(.*)"$/ do |event|
#   @event = Event.where(event_name: event_name)[0]
#   # assert(Time.now < @event.start_time - 2.days, "You are within 2 days of the event #{}")
# end
