Then /^it should render the calendar$/ do
  page.should have_content Time.now.strftime("%B %Y")
end