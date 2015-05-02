Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  match = /.#{e1}.*.#{e2}/m =~ page.body
  assert(match)
  #  ensure that that e1 occurs before e2.
  #  page.body is the entire content of the page as a string.
  #flunk "Unimplemented"
end

When(/^I click "(.*?)"$/) do |arg1|
  page.find(arg1).click
end


When(/^I follow "(.*?)" for "(.*?)"$/) do |arg1, arg2|
  	first(:link, arg1).click

end
