Then /I should see the following (.+) in this order/ do |table_type, table|
  case table_type
  when 'events'
    table.hashes.each do |event|
    end
  when 'announcements'
    table.hashes.each do |announcement|
    end
  end
end