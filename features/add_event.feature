Feature: Events as Admin Feature 
As a HepB admin 
So that I can managae my events 
I want to be able to add, edit and delete events 

Background: Members and announcements have been added to the database

  Given John is in the database with the following information:
  | first_name   | last_name  | grad_date | phone       | email                 | password    | is_admin | warnings |
  | Harry        | Potter      | May 15, 2015  | 5555555555  | johnBlume@gmail.com  | 12345678    | true      |    0     |

  And the following events exist:
  | event_name         | location      | date                   | duration | num_volunteers | description | start_time             | end_time |
  | Korean Health Fair | sproul        |2015-04-20 09:34:00.000 | 2        |  10            |  Come!      |2015-04-20 09:00:00.000 | 2015-04-20 011:00:00.000 |
  | General Meeting | wheeler        |2015-04-22 09:34:00.000 | 2        |  10            |  Come!      |2015-04-22 09:00:00.000 | 2015-04-22 011:00:00.000 |

  And I am logged in as "Harry"
  When I follow "Events" 

   Scenario: Admin creates a new event
    Then I should see "+Add Event"
    When I click "#newE"
    Then I should see "New Event"
    When I fill in "event_event_name" with "My brand new Event"
    And I fill in "event_description" with "This is cool!"
    When I select "2015" for "event_date_1i"
    When I select "April" for "event_date_2i"
    When I select "16" for "event_date_3i"
    And I press "Create"
    


