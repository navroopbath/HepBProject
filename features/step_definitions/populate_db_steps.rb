Given /(.+) is in the database with the following information/ do |mem_name, members_table|
  members_table.hashes.each do |member|
    Member.create!(member)
  end
end

Given /the following events exist/ do |events_table|
  events_table.hashes.each do |event|
    Event.create!(event)
  end
end

Given /(.+) has attended the following events/ do |mem_name, memevents_table|
  mem = Member.where(first_name: mem_name)
  memevents_table.hashes.each do |memevent|
    event = Event.where(event_name: memevent.delete("event_name"))
    memevent = mem.build(memevent)
    event.memevents << memevent
  end
end

Given /the following announcements exist/ do |announcements_table|
  announcements_table.hashes.each do |announcement|
    Announcement.create!(announcement)
  end
end