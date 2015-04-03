Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  match = /.#{e1}.*.#{e2}/m =~ page.body
  assert(match)
  #  ensure that that e1 occurs before e2.
  #  page.body is the entire content of the page as a string.
  #flunk "Unimplemented"
end