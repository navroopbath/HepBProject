# Given /the following members exist/ do |members_table|
#   members_table.hashes.each do |member|
#     # each returned element will be a hash whose key is the table header.
#     # you should arrange to add that member to the database here.
#     Member.create!(member)
#   end
# end

When /^I fill in all fields with: (.*)$/ do |values|
  fields = ['First name', 'Last name', 'Grad date', 'Phone', 'Email', 'Password', 'Password confirmation']
  values = values.gsub(' ','').split(',')
  fields.zip(values).each do |field, value|
    steps %Q{
      When I fill in "#{field}" with "#{value}"
    }
  end
end

Then /^I should see the following information: (.*)$/ do |values|
  #used for password mismatch scenario
  fields = ['First name', 'Last name', 'Grad date', 'Phone', 'Email']
  values = values.gsub(' ','').split(',')
  fields.zip(values).each do |field, value|
    steps %Q{
      Then the "#{field}" field should contain "#{value}"
    }
  end
end
