members = [{:first_name =>'Navroop', :last_name =>'Singh', :grad_date =>'2002-05-30T09:00:00', :phone => '4084766051',:email =>'roopsingh93@berkeley.edu', :password =>'test', :is_admin =>'true', :warnings =>'0'},
        {:first_name =>'Mehdi', :last_name =>'Nazemi', :grad_date =>'2002-05-30T09:00:00', :phone =>'4084556242',:email =>'medn94@berkeley.edu', :password =>'test', :is_admin =>'true', :warnings =>'0'},
        {:first_name =>'Patricia', :last_name =>'Demorest', :grad_date =>'2002-05-30T09:00:00', :phone =>'7608555141',:email =>'p.demorest@berkeley.edu', :password =>'test', :is_admin =>'true', :warnings =>'0'},
        {:first_name =>'Shannon', :last_name =>'Axelrod', :grad_date =>'2002-05-30T09:00:00', :phone =>'4258909005',:email =>'shannonaxelrod@gmail.com', :password =>'test', :is_admin =>'true', :warnings =>'0'},
        {:first_name =>'John', :last_name =>'Russel', :grad_date =>'2002-05-30T09:00:00', :phone =>'2062184949',:email =>'john6@berkeley.edu', :password =>'test', :is_admin =>'true', :warnings =>'0'},
        {:first_name =>'Michael', :last_name =>'Rowe', :grad_date =>'2002-05-30T09:00:00', :phone =>'5555555555',:email =>'michaelrowe@berkeley.edu', :password =>'test', :is_admin =>'true', :warnings =>'0'},
        {:first_name =>'Armando', :last_name =>'Fox', :grad_date =>'2002-05-30T09:00:00', :phone =>'1011100101',:email =>'afox@hotmail.com', :password =>'saas', :is_admin =>'false', :warnings =>'0'},
        {:first_name =>'Craig', :last_name =>'Hiller', :grad_date =>'2002-05-30T09:00:00', :phone =>'5555555555',:email =>'chiller@berkeley.edu', :password =>'saas', :is_admin =>'false', :warnings =>'0'}
]

events = [{:event_name => 'Korean Health Fair', :date => '2015-04-5T10:00:00', :location => 'Sproul Hall', :description => 'Open Admission', :duration => '2:00', :num_volunteers => '10'},
        {:event_name => 'Chinese Health Fair', :date => '2003-05-30T10:00:00', :location => 'Sproul Hall', :description => 'Open Admission', :duration => '2:00', :num_volunteers => '10'},
        {:event_name => 'Japanese Health Fair', :date => '2003-05-30T10:00:00', :location => 'Sproul Hall', :description => 'Open Admission', :duration => '2:00', :num_volunteers => '10'}
]

announcements = [{:date_written => '2015-05-30T09:00:00', :body => 'Ice Cream Social on Tuesday', :pinned => 'true', :announcement_type => 'Upcoming Events'},
              {:date_written => '2015-05-30T09:00:00', :body => 'Workshop on Wednesday', :pinned => 'true', :announcement_type => 'Upcoming Events'}
            ]

languages = {:lang => 'English', :fluency => 'Native Speaker'}

memevent = {:hours_attended => '2', :waitlisted => 'false', :date_added => '2002-05-30T09:00:00'}

members.each do |member|
  m = Member.create!(member)
  m.languages.build(languages)
  m.save!
end

events.each do |event|
  e = Event.create!(event)
end

m = Memevent.create!(memevent)
m.member = Member.where(id: 1)[0]
m.event = Event.where(id: 1)[0]
m.save!

announcements.each do |announcement|
  Announcement.create!(announcement)
end

