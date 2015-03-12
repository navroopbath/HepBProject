members = [{:first_name =>'Navroop', :last_name =>'Singh', :year =>'Senior', :phone => '4084766051',:email =>'roopsingh93@berkeley.edu', :password =>'test', :is_admin =>'true', :hours =>'5'},
        {:first_name =>'Mehdi', :last_name =>'Nazemi', :year =>'Senior', :phone =>'4084556242',:email =>'medn94@berkeley.edu', :password =>'test', :is_admin =>'true', :hours =>'5'},
        {:first_name =>'Patricia', :last_name =>'Demorest', :year =>'Senior', :phone =>'7608555141',:email =>'p.demorest@berkeley.edu', :password =>'test', :is_admin =>'true', :hours =>'5'},
        {:first_name =>'Shannon', :last_name =>'Axelrod', :year =>'Senior', :phone =>'4258909005',:email =>'shannonaxelrod@gmail.com', :password =>'test', :is_admin =>'true', :hours =>'5'},
        {:first_name =>'John', :last_name =>'Russel', :year =>'Senior', :phone =>'2062184949',:email =>'john6@berkeley.edu', :password =>'test', :is_admin =>'true', :hours =>'5'},
        {:first_name =>'Michael', :last_name =>'Rowe', :year =>'Senior', :phone =>'5555555555',:email =>'michaelrowe@berkeley.edu', :password =>'test', :is_admin =>'true', :hours =>'5'},
        {:first_name =>'Armando', :last_name =>'Fox', :year =>'Super-Senior', :phone =>'1011100101',:email =>'afox@hotmail.com', :password =>'saas', :is_admin =>'false', :hours =>'100'},
        {:first_name =>'Craig', :last_name =>'Hiller', :year =>'Senior', :phone =>'5555555555',:email =>'chiller@berkeley.edu', :password =>'saas', :is_admin =>'false', :hours =>'50'}
]

events = [{:name => 'Korean Health Fair', :date => '3/27/2015', :location => 'Sproul Hall', :description => 'Open Admission', :start_time => '14:00', :duration => '2:00', :num_volunteers => '4', :num_waitlist => '3'},
        {:name => 'Chinese Health Fair', :date => '4/20/2015', :location => 'Sproul Hall', :description => 'Open Admission', :start_time => '14:00', :duration => '2:00', :num_volunteers => '4', :num_waitlist => '2'},
        {:name => 'Japanese Health Fair', :date => '5/17/2015', :location => 'Sproul Hall', :description => 'Open Aadmission', :start_time => '14:00', :duration => '2:00', :num_volunteers => '3', :num_waitlist => '0'}
]

members.each do |member|
  Member.create!(member)
end

events.each do |event|
    Event.create!(event)
end
