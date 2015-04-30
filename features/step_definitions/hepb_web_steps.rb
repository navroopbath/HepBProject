Then /^(?:|I )should( not)? see "([^"]*)"$/ do |negation, text|
  if negation
    if page.respond_to? :should
      page.should have_no_content(text)
    else
      assert page.has_no_content?(text)
    end
  else
    if page.respond_to? :should
      page.should have_content(text)
    else
      assert page.has_content?(text)
    end
  end
end

Then /^the "([^"]*)" field(?: within (.*))? should( not)? contain "([^"]*)"$/ do |field, parent, negation, value|
  if negation == 'not'
    with_scope(parent) do
      field = find_field(field)
      field_value = (field.tag_name == 'textarea') ? field.text : field.value
      if field_value.respond_to? :should_not
        field_value.should_not =~ /#{value}/
      else
        assert_no_match(/#{value}/, field_value)
      end
    end
  else
    with_scope(parent) do
      field = find_field(field)
      field_value = (field.tag_name == 'textarea') ? field.text : field.value
      if field_value.respond_to? :should
        field_value.should =~ /#{value}/
      else
        assert_match(/#{value}/, field_value)
      end
    end
  end
end

When(/^I select "(.*?)" for "(.*?)"$/) do |arg1, arg2|
  select arg1, :from => arg2
end
When(/^I select "(.*?)" for "(.*?)"$/) do |arg1, arg2|
  select arg1, :from => arg2
end