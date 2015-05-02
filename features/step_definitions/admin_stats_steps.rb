Then /^I should see "(.+)" under Requirement Met for "(.+)"$/ do |bool, member|
  steps %Q{
    When I fill in "searchinput" with "#{member}"
    Then I should see "#{bool}"
  }

end

Then(/^I should( not)? see the following members:(.*)$/)  do |negation, members|
  members = members.gsub(' ','').split(',')
  if negation
    members.each do |mem|
      steps %Q{
        Then I should not see "#{mem}"
      }
    end
  else
    members.each do |mem|
      steps %Q{
        Then I should see "#{mem}"
      }
    end
  end
end


When(/^I hover over "(.*?)"$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then(/^I should see the following events: Clinic, Hospital$/) do
  pending # express the regexp above with the code you wish you had
end