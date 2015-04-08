Feature: Home Tab
  As a HepB volunteer
  So that I can see upcoming meetings and clinics
  And sign up or waitlist for clinics
  I want to be able to view a calendar with these events

Background: members and events have been added to database

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
  | date_written            | body             | pinned | announcement_type | title    |
  | 2012-02-26 09:34:00.000 | Come to meeting! | true   | Reminder          | Reminder |
  | 1999-02-26 09:34:00.000 | Don't forget!    | false  | Reminder          | Reminder |
  | 2011-02-26 09:34:00.000 | Oh hai           | true   | Reminder          | Reminder |

  And I am logged in as "John"
  When I go to the portal dashboard for "John"

  Scenario: Viewing information for event Clinic
    Given that the event Clinic exists
    And I hover over the event Clinic
    I should see a pop-up with the information about the event Clinic

  Scenario: Adding John to Clinic volunteer list
    Given that the event Clinic exists
    And event Clinic has available slots for volunteers
    I should see the button "Sign Up"
    When I press "Sign Up"
    I should see John Blume on the signed up volunter list for Clinic.

  Scenario: Adding John to Clinic waitlist
    Given that the event Clinic exists
    And event Clinic has no available slots for volunteers
    And event Clinic has available slots for waitlist
    I should see the button "Add to Waitlist"
    When I press "Add to Waitlist"
    I should see John Blume on the waitlist volunteer list for Clinic.

  Scenario: Removing John from Clinic volunteer list
    Given that John Blume is signed up for the event Clinic
    And today's date is not within 2 days of the event Clinic
    I should see the button "Drop event"
    When I press "Drop event"
    I should not see "John Blume" on the signed up volunteer list for Clinic.

  Scenario: Removing John from the Clinic waitlist
    Given that John Blume is signed up for the event Clinic
    And today's date is not within 2 days of the event Clinic
    I should see the button "Drop event"
    When I press "Drop event"
    I should not see "John Blume" on the waitlist volunteer list for Clinic.

  Scenario: Removing John from Clinic volunteer list within 2 days of Clinic
    Given John Blume is signed up for the event Clinic
    And today's date is within 2 days of the event Clinic
    I should see the button "Drop event" greyed out
    When I press "Drop Event"
    I should see the message "Contact Clinic LC by email to drop this event."