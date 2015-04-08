Feature: Stats for Admin Tab
  As an admin
  So that I can access each volunteers' progress
  I want to see a list of each volunteers' events and hours completed

Background: members have been added to database

 Given the following members are in the database:
  | first_name   | last_name  | grad_date | phone       | email                 | password    | is_admin | warnings |
  | John         | Blume      | 5/16/15   | 5555555555  | johnBlume@gmail.com   | 12345678    | false    |    0     |
  | Ben          | Jerry      | 8/19/15   | 6666666666  | benjerry@gmail.com    | testtest    |
  false    |    1     |
  | Tim          | Smith      | 4/19/15   | 4444444444  | timsmith@gmail.com    | testtest    |
  false    |    2     |
  | Admin        | Master     | 2/25/15   | 3333333333  | adminmaster@gmail.com | testtest    |
  true     |    0     |

  And the following events exist:
  | event_name | location | date                    | duration | num_volunteers | description |
  | Clinic     | Berkeley | 2012-02-26 09:34:00.000 | 2        | 10             | plz attend  |
  | Hospital   | Oakland  | 2012-03-14 09:34:00.000 | 3        | 10             | help out!   |
  | Social     | Oakland  | 2012-03-14 09:34:00.000 | 3        | 15             | it's fun!   |

  And John has attended the following events:
  | event_name | hours_attended | waitlisted | date_added              |
  | Clinic     | 2              | false      | 2012-02-25 09:34:00.000 |
  | Hospital   | 3              | false      | 2012-02-25 09:34:00.000 | 

  And Ben has attended the following events:
  | event_name | hours_attended | waitlisted | date_added              |
  | Clinic     | 2              | false      | 2012-02-25 09:34:00.000 |

  Given I am logged in as "Admin"
  When I go to the stats page for "Admin"

  Scenario: see list of stats for all members
    Then I should see the following members: John, Ben, Tim

  Scenario: search for a specific member
    And I fill in "Search" with "Tim"
    Then I should see "Tim"
    And I should not see the following members: John, Ben

  Scenario: view a member's list of events
    When I hover over "John"
    Then I should see the following events: Clinic, Hospital

  Scenario: view warnings for each member
    Then I should see "Yes" within "Did Member Meet Requirement?" for "John"
    And I should see "No" within "Did Member Meet Requirement?" for "Ben"
