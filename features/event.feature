Feature: Home Tab
  As a HepB volunteer
  So that I can see upcoming meetings and clinics
  And sign up or waitlist for clinics
  I want to be able to view a calendar with these events

Background: members and events have been added to database

 Given John is in the database with the following information:
  | first_name   | last_name  | grad_date                | phone       | email                 | password    | is_admin | warnings |
  | John         | Blume      | 2015-05-18 09:34:00.000  | 5555555555  | johnBlume@gmail.com   | 12345678    | no       |    0     |

  And the following events exist:
  | event_name | location | date                    | duration | num_volunteers | description | start_time              | end_time                |
  | Clinic     | Berkeley | 2015-05-28 17:30:00.000 | 2        | 10             | plz attend  | 2015-04-28 17:30:00.000 | 2015-04-28 19:30:00.000 |
  | Hospital   | Oakland  | 2015-05-30 09:30:00.000 | 3        | 0              | help out!   | 2015-04-30 09:30:00.000 | 2015-04-30 10:30:00.000 |
  | Social     | Oakland  | 2015-05-15 09:30:00.000 | 3        | 15             | it's fun!   | 2015-04-15 09:30:00.000 | 2015-04-15 09:30:00.000 |
  | Fair       | Berkeley | 2015-05-27 09:30:00.000 | 3        | 15             | Yay!        | 2015-04-27 09:30:00.000 | 2015-04-27 09:30:00.000 |
  | Benefit    | Berkeley | 2015-05-27 09:30:00.000 | 3        | 0              | Booya!      | 2015-04-27 09:30:00.000 | 2015-04-27 09:30:00.000 |

  And I travel to the time '2015-04-26 09:00:00.000'
  And I am logged in as "John"
  When I go to the events page

  @javascript
  Scenario: Going to events page should render the calendar
    When I travel to the date "April 26, 2015"
    Then it should render the calendar

  @javascript
  Scenario: Viewing information for event Clinic
    When I travel to the date "April 26, 2015"
    When I click on the event "Clinic"
    Then I should see a modal with information about "Clinic"

  @javascript
  Scenario: Adding John to Clinic volunteer list
    When I travel to the date "April 26, 2015"
    When I click on the event "Clinic"
    And I follow "Sign up"
    Then I should see "You have successfully signed up for Clinic."
    And I click on the event "Clinic"
    Then I should see "John Blume"

  @javascript
  Scenario: Signing up for an event again should fail
    When I travel to the date "April 26, 2015"
    When I click on the event "Clinic"
    And I follow "Sign up"
    Then I should see "You have successfully signed up for Clinic."
    And I click on the event "Clinic"
    And I follow "Sign up"
    Then I should see "You have already signed up for Clinic."

  @javascript
  Scenario: Adding John to Hospital waitlist
    When I travel to the date "April 26, 2015"
    When I click on the event "Hospital"
    And I follow "Sign up"
    Then I should see "You have been waitlisted for Hospital. You'll receive an email notification if you are moved into the volunteer list."
    When I click on the event "Hospital"
    Then I should see the member "John Blume" under "Waitlist"

  @javascript
  Scenario: Removing John from Clinic volunteer list
    When I travel to the date "April 26, 2015"
    Given that "John Blume" is signed up for the event "Clinic"
    When I click on the event "Clinic"
    Then I should see "Remove from event"
    When I follow "Remove from event"
    Then I should see "You have been successfully removed from Clinic."
    When I click on the event "Clinic"
    Then I should not see "John Blume"
    And I should not see "Remove from event"

  @javascript
  Scenario: Signing up for an event that has already started/finished
    When I travel to the date "April 26, 2015"
    When I click on the event "Social"
    And I follow "Sign up"
    Then I should see "The start time for Social has already passed."

  @javascript
  Scenario: Removing John from Fair volunteer list within 2 days of Fair
    When I travel to the date "April 26, 2015"
    Given that "John Blume" is signed up for the event "Fair"
    When I click on the event "Fair"
    And I follow "Remove from event"
    Then I should see "You cannot automatically remove yourself inside a 48 hour window before the Fair. Please contact the LC lead for further instrucitons if you need to drop."
    When I click on the event "Fair"
    Then I should see "John Blume"

  @javascript
  Scenario: Removing John from the Clinic waitlist within 2 days of the event
    When I travel to the date "April 26, 2015"
    Given that "John Blume" is signed up for the event "Benefit"
    And I click on the event "Benefit"
    Then I should see "Remove from event"
    When I follow "Remove from event"
    Then I should see "You have been successfully removed from Benefit"
    And I click on the event "Benefit"
    Then I should not see "John Blume"


