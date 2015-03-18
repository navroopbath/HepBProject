Feature: Hours Tab
  The total hours volunteered should be displayed on the page
  All past events attended should be visible


Background: members have been added to database

 Given I am in the database:
  | first_name   | last_name  | year    | phone       | email                 | password    | is_admin | hours | language_1 | fluency_1      | language_2 | fluency_2 | language_3 | fluency_3 | warnings |
  | Judy         | Blume      | Senior  | 5555555555  | judyBlume@gmail.com   | 12345678    | no       | 5     | English    | native speaker |            |           |            |           |    0     |

  And I have the following events in the database:
  | member_id | event_name | location | date                    | duration |
  | 1         | Clinic     | Berkeley | 2012-02-26 09:34:00.000 | 2        |
  | 1         | Hospital   | Oakland  | 2012-03-14 09:34:00.000 | 3        |

  And I am on the Hours tab

  Scenario: see my hours
    Given I am logged in
    Then I should see "5" under "Total Hours"
    Then I should see "2" under "Events Completed So Far"


  Scenario: see my past events in order
    Given I am logged in 
    Then I should see "Hospital" before "Clinic"
    And I should see "Clinic"

