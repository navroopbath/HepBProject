Feature: Home Tab
  As a HepB volunteer
  So that I can see my volunteer progress and be up to date with current announcements
  I want to see my volunteer info and current announcements when I click the Home tab

Background: members have been added to database

 Given I am in the database:
  | first_name   | last_name  | year    | phone       | email                 | password    | is_admin | hours | language_1 | fluency_1      | language_2 | fluency_2 | language_3 | fluency_3 | warnings |
  | Judy         | Blume      | Senior  | 5555555555  | judyBlume@gmail.com   | 12345678    | no       | 5     | English    | native speaker |            |           |            |           |    0     |

  And I have the following events in the database:
  | member_id | event_name | location | date                    | duration |
  | 1         | Clinic     | Berkeley | 2012-02-26 09:34:00.000 | 2        |
  | 1         | Hospital   | Oakland  | 2012-03-14 09:34:00.000 | 3        |

  And the following announcements exist:
  | author | date_created            | body             | 
  | Craig  | 2012-02-26 09:34:00.000 | Come to meeting! |


Scenario: Successfully displays my statistics information
  Given I am logged in
  When I go to the portal dashboard
  #I should see "Welcome, Judy Blume!"
  And I should see "5" under "Total Hours"
  And I should see "2" under "Events Completed So Far"

Scenario: Successfully displays current announcements
  Given I am logged in
  When I go to the portal dashboard
  I should see "Welcome, Judy Blume!"
  And I should see "Come to meeting!" under "Annoucements"

Scenario: Can't visit Home page if not logged in
  #not logged in
  When I visit '/members/home'
  I should be on the login page
  And I should see "Please log in to continue"
