#Step for adding memberts to the database
# Given /the following members exist/ do |members_table|
#   members_table.hashes.each do |member|
#     # each returned element will be a hash whose key is the table header.
#     # you should arrange to add that movie to the database here.
#     Member.create! member 
#   end
# end

When(/^I type "(.*?)" into username$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

When(/^I type "(.*?)" into password$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

And /I am logged in as "(.+)"/ do |mem_name|
  mem = @member
  steps %Q{
    When I go to the portal login page
    And I fill in "Email" with "#{mem[:email]}"
    And I fill in "Password" with "#{mem[:password]}"
    And I press "Log in"
    Then I should be on the portal dashboard for "#{mem_name}"
  }
end