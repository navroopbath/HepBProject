members = [{:first_name =>'Navroop', :last_name =>'Singh', :grad_date =>'2002-05-30T09:00:00', :phone => '4084766051',:email =>'roopsingh93@berkeley.edu', :password =>'test', :is_admin =>'true', :warnings =>'0'},
        {:first_name =>'Mehdi', :last_name =>'Nazemi', :grad_date =>'2002-05-30T09:00:00', :phone =>'4084556242',:email =>'medn94@berkeley.edu', :password =>'test', :is_admin =>'true', :hours =>'5'},
        {:first_name =>'Patricia', :last_name =>'Demorest', :grad_date =>'2002-05-30T09:00:00', :phone =>'7608555141',:email =>'p.demorest@berkeley.edu', :password =>'test', :is_admin =>'true', :warnings =>'0'},
        {:first_name =>'Shannon', :last_name =>'Axelrod', :grad_date =>'2002-05-30T09:00:00', :phone =>'4258909005',:email =>'shannonaxelrod@gmail.com', :password =>'test', :is_admin =>'true', :warnings =>'0'},
        {:first_name =>'John', :last_name =>'Russel', :grad_date =>'2002-05-30T09:00:00', :phone =>'2062184949',:email =>'john6@berkeley.edu', :password =>'test', :is_admin =>'true', :warnings =>'0'},
        {:first_name =>'Michael', :last_name =>'Rowe', :grad_date =>'2002-05-30T09:00:00', :phone =>'5555555555',:email =>'michaelrowe@berkeley.edu', :password =>'test', :is_admin =>'true', :warnings =>'0'},
        {:first_name =>'Armando', :last_name =>'Fox', :grad_date =>'2002-05-30T09:00:00', :phone =>'1011100101',:email =>'afox@hotmail.com', :password =>'saas', :is_admin =>'false', :warnings =>'0'},
        {:first_name =>'Craig', :last_name =>'Hiller', :grad_date =>'2002-05-30T09:00:00', :phone =>'5555555555',:email =>'chiller@berkeley.edu', :password =>'saas', :is_admin =>'false', :warnings =>'0'}
]

events = [{:event_name => 'Korean Health Fair', :date => '2003-05-30T10:00:00', :location => 'Sproul Hall', :description => 'Open Admission', :duration => '2:00', :num_volunteers => '4'},
        {:name => 'Chinese Health Fair', :date => '2003-05-30T10:00:00', :location => 'Sproul Hall', :description => 'Open Admission', :duration => '2:00', :num_volunteers => '4'},
        {:name => 'Japanese Health Fair', :date => '2003-05-30T10:00:00', :location => 'Sproul Hall', :description => 'Open Admission', :duration => '2:00', :num_volunteers => '3'}
]

announcements = [{:date_written => '2002-05-30T09:00:00', :body => 'Ice Cream Social on Tuesday', :pinned => 'true', :type => 'Upcoming Events'},
              {:date_written => '2002-05-30T09:00:00', :body => 'Workshop on Wednesday', :pinned => 'true', :type => 'Upcoming Events'}
            ]

members.each do |member|
  Member.create!(member)
end

events.each do |event|
    Event.create!(event)
end

announcements.each do |announcement|
    Announcement.create!(announcement)
end