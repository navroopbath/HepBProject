# Given /the following members exist/ do |members_table|
#   members_table.hashes.each do |member|
#     # each returned element will be a hash whose key is the table header.
#     # you should arrange to add that member to the database here.
#     Member.create!(member)
#   end
# end

When /^I fill in all fields with: (.*)$/ do |values|
  fields = ['First Name', 'Last Name', 'Year', 'Phone', 'Email', 'Password', 'Confirm Password']
  values = values.gsub(' ','').split(',')
  fields.zip(values).each do |field, value|
    if field == "Year"
      steps %Q{
        When I select "#{value}" from "#{field}"
      }
    else
      steps %Q{
        When I fill in "#{field}" with "#{value}"
      }
    end
  end
end

Then /^I should see the following information: (.*)$/ do |values|
  #used for password mismatch scenario
  fields = ['First Name', 'Last Name', 'Year', 'Phone', 'Email']
  values = values.gsub(' ','').split(',')
  fields.zip(values).each do |field, value|
    if field == 'Year'
      steps %Q{
        Then I should see "#{field}: #{value}"
      }
    else
      steps %Q{
        Then the "#{field}" field should contain "#{value}"
      }
    end
  end
end
