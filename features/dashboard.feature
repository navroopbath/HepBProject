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

  And John has attended the following events:
  | event_name | hours_attended | waitlisted | date_added              |
  | Clinic     | 2              | false      | 2012-02-25 09:34:00.000 |
  | Hospital   | 3              | false      | 2012-02-25 09:34:00.000 | 

  And the following announcements exist:
  | date_written            | body             | pinned | type     |
  | 2012-02-26 09:34:00.000 | Come to meeting! | true   | Reminder |


Scenario: Successfully displays my statistics information
  Given I am logged in
  When I go to the portal dashboard
  #I should see "Welcome, Judy Blume!"
  And I should see "5" under "Total Hours"
  And I should see "2" under "Events Completed So Far"

Scenario: Successfully displays current announcements
  Given I am logged in
  When I go to the portal dashboard
  #I should see "Welcome, Judy Blume!"
  And I should see "Come to meeting!" under "Annoucements"

Scenario: Can't visit Home page if not logged in
  #not logged in
  When I visit '/members/home'
  #I should be on the login page
  And I should see "Please log in to continue"
