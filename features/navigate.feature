Feature: Navigating through the tabs.
  As a volunteer
  So that I can access information about hours, events, announcements, and settings
  I want to be able to navigate to the different tabs

Background: members have been added to database

 Given John is in the database with the following information:
  | first_name   | last_name  | grad_date | phone       | email                 | password    | is_admin | warnings |
  | John         | Blume      | 5/16/15   | 5555555555  | johnBlume@gmail.com   | 12345678    | no       |    0     |
  | Vin          | Disel      | 5/16/15   | 1111111111  | fastandfur@mail.com   | abcdefgh    | no       |    0     |
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
  | date_written            | body             | pinned | announcement_type | title    |
  | 2012-02-26 09:34:00.000 | Come to meeting! | true   | Reminder          | Reminder |
  | 1999-02-26 09:34:00.000 | Don't forget!    | false  | Reminder          | Reminder |
  | 2011-02-26 09:34:00.000 | Oh hai           | true   | Reminder          | Reminder |

  And I am logged in as "John"
  When I go to the portal dashboard for "John"

Scenario: Navigating to Dashboard tab
  When I follow "Dashboard"
  Then I should be on the portal dashboard for "John"

Scenario: Navigating to Announements tab
  When I follow "Announcements"
  Then I should be on the announcements tab for "John"

Scenario: Navigating to the Events tab
  When I follow "Events"
  #next iteration

Scenario: Navigating to the Stats tab
  When I follow "Stats" 

Scenario: Navigating to the Contacts tab
  When I follow "Contacts"
  Then I should be on the contacts tab for "John"
  Then I should "Judy"

Scenario: Accessing user settings
  When I follow "Account"
  Then I should see "John Blume"
