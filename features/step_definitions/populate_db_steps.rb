Given /(.+) is in the database with the following information/ do |mem_name, members_table|
  members_table.hashes.each do |member|
    @member = member
    m = Member.create!(member)
    m.skip_confirmation!
    m.save
  end
end

Given /the following members exist/ do |members_table|
  members_table.hashes.each do |member|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
    m = Member.create! member 
    m.skip_confirmation!
    m.save
  end
end

And /(.+) speaks the following languages/ do |mem_name, languages_table|
  mem = Member.where(first_name: mem_name)[0]
  languages_table.hashes.each do |language|
    mem.languages.build(language)
  end
end

Given /the following events exist/ do |events_table|
  events_table.hashes.each do |event|
    Event.create!(event)
  end
end

Given /(.+) has attended the following events/ do |mem_name, memevents_table|
  mem = Member.where(first_name: mem_name)[0]
  memevents_table.hashes.each do |memevent|
    event = Event.where(event_name: memevent.delete("event_name"))[0]
    me = mem.memevents.build(memevent)
    event.memevents << me
  end
end

Given /the following announcements exist/ do |announcements_table|
  announcements_table.hashes.each do |announcement|
    Announcement.create!(announcement)
  end
end