Feature: Home Tab
  As a HepB volunteer
  So that I can change informating about upcoming events
  I want to be to edit events and remove volunteers

Background: members and events have been added to database

 Given John is in the database with the following information:
  | first_name   | last_name  | grad_date                | phone       | email                 | password    | is_admin | warnings |
  | Bob          | Builder    | 2015-05-18 09:30:00.000  | 8888888888  | bobbuilder@gmail.com  | 12345678    | false    |    0     |
  | Tom          | Train      | 2015-05-18 09:30:00.000  | 4088888888  | tomtrain@gmail.com    | 12345678    | false    |    0     |
  | John         | Blume      | 2015-05-18 09:34:00.000  | 5555555555  | johnBlume@gmail.com   | 12345678    | true     |    0     |

  And the following events exist:
  | event_name | location | date                    | duration | num_volunteers | description | start_time              | end_time                |
  | Clinic     | Berkeley | 2015-05-28 17:30:00.000 | 2        | 10             | plz attend  | 2015-05-28 17:30:00.000 | 2015-05-28 19:30:00.000 |
  | Hospital   | Oakland  | 2015-05-30 09:30:00.000 | 3        | 1              | help out!   | 2015-05-30 09:30:00.000 | 2015-05-30 10:30:00.000 |

  And I travel to the time '2015-05-26 09:00:00.000'
  And I am logged in as "John"
  When I go to the events page
    
  @javascript
  Scenario: Updating the event name
    When I click on the event "Clinic"
    When I update the modal field "Event name" with "Hep B Clinic"
    And in the modal I follow "Update event"
    Then I should see "You have successfully updated Clinic."
    When I click on the event "Hep B Clinic"
    Then I should see "Hep B Clinic"

  @javascript
  Scenario: Removing a member from an event
    Given that "John Blume" is signed up for the event "Clinic"
    And that "Bob Builder" is signed up for the event "Clinic"
    When I click on the event "Clinic"
    And I follow ""
    Then I should see "You have successfully removed Bob Builder from Clinic."

  @javascript
  Scenario: Removing a member should bump up any waitlisted members
    Given that "John Blume" is signed up for the event "Hospital"
    Given that "Tom Train" is signed up for the event "Hospital"
    Given that "Bob Builder" is signed up for the event "Hospital"
    When I click on the event "Hospital"
    And in the modal I click remove "Tom Train"
    Then I should see "You have successfully removed Tom Train from Hospital."
