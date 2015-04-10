Feature: Stats Tab
  As a volunteer
  So that I can see the total # of hours I've volunteered
  And see all the clinics I've attended
  The total hours and past clnics should be displayed

Background: members have been added to database

 Given John is in the database with the following information:
  | first_name   | last_name  | grad_date      | phone       | email                 | password    | is_admin | warnings |
  | John         | Blume      | May 15, 2015   | 5555555555  | johnBlume@gmail.com   | 12345678    | no       |    0     |

  And John speaks the following languages:
  | lang    | fluency        |
  | English | Native Speaker |

  And the following events exist:
  | event_name | location | date                    | duration | num_volunteers | description |
  | Clinic     | Berkeley | 2012-02-26 09:34:00.000 | 2        | 10             | plz attend  |
  | Hospital   | Oakland  | 2012-03-14 09:34:00.000 | 3        | 10             | help out!   |
  | Social     | Oakland  | 2012-03-14 09:34:00.000 | 3        | 15             | it's fun!   |

  And John has attended the following events:
  | event_name | hours | waitlisted | date_added              |
  | Clinic     | 2     | false      | 2012-02-25 09:34:00.000 |
  | Hospital   | 3     | false      | 2012-02-25 09:34:00.000 | 

  And the following announcements exist:
  | date_written            | body             | pinned | announcement_type |
  | 2012-02-26 09:34:00.000 | Come to meeting! | true   | Reminder          |
  | 1999-02-26 09:34:00.000 | Don't forget!    | false  | Reminder          |

  Given I am logged in as "John"
  When I go to the stats page for "John"

  Scenario: see my hours
    Then I should see "5" under "Total Hours Completed"
    Then I should see "2" under "Required Events Completed"

  Scenario: see my past events in order
    Then I should see "Clinic" before "Hospital"
    And I should see "Clinic"