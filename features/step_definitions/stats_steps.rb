Then /I should see "(.*)" under "(.*)"/ do |e1, e2|
  #  ensure that that e1 occurs before e2.
  #  page.body is the entire content of the page as a string.
  first = page.body.index(e1) or return false
  second = page.body.index(e2) or return false
  assert(first = second -1, "The movies were not alphabetic")
end