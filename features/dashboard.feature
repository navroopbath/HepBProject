Feature: Home Tab
  As a HepB volunteer
  So that I can see my volunteer progress and be up to date with current announcements
  I want to see my volunteer info and current announcements when I click the Home tab

Background: members have been added to database

 Given John is in the database with the following information:
  | first_name   | last_name  | grad_date | phone       | email                 | password    | is_admin | warnings |
  | John         | Blume      | 5/16/15   | 5555555555  | johnBlume@gmail.com   | 12345678    | no       |    0     |

  And John speaks the following languages:
  | lang    | fluency        |
  | English | Native Speaker |

  And the following events exist:
  | event_name | location | date                    | duration | num_volunteers | description |
  | Clinic     | Berkeley | 2012-02-26 09:34:00.000 | 2        | 10             | plz attend  |
  | Hospital   | Oakland  | 2012-03-14 09:34:00.000 | 3        | 10             | help out!   |
  | Social     | Oakland  | 2012-03-14 09:34:00.000 | 3        | 15             | it's fun!   |

  And John has attended the following events:
  | event_name | hours_attended | waitlisted | date_added              |
  | Clinic     | 2              | false      | 2012-02-25 09:34:00.000 |
  | Hospital   | 3              | false      | 2012-02-25 09:34:00.000 | 

  And the following announcements exist:
  | date_written            | body             | pinned | type     |
  | 2012-02-26 09:34:00.000 | Come to meeting! | true   | Reminder |
  | 1999-02-26 09:34:00.000 | Don't forget!    | false  | Reminder |

  And I am logged in as "John"
  When I go to the portal dashboard for "John"


Scenario: Successfully displays my upcoming events
  Then I should see the following events in this order:
  | event_name | date                    | 
  | Clinic     | 2012-02-26 09:34:00.000 | 
  | Hospital   | 2012-03-14 09:34:00.000 | 
  And I should not see "Social"

Scenario: Successfully displays current announcements
  Then I should see the following announcements in this order:
  | date_written            | body             | 
  | 2012-02-26 09:34:00.000 | Come to meeting! | 
  And I should not see "Don't forget!"
