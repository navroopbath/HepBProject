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
  | Clinic     | Berkeley | 2015-04-26 09:30:00.000 | 2        | 10             | plz attend  | 2015-04-26 09:30:00.000 | 2015-04-26 10:30:00.000 |
  | Hospital   | Oakland  | 2015-04-20 09:30:00.000 | 3        | 10             | help out!   | 2015-04-20 09:30:00.000 | 2015-04-20 10:30:00.000 |
  | Social     | Oakland  | 2015-04-15 09:30:00.000 | 3        | 15             | it's fun!   | 2015-04-15 09:30:00.000 | 2015-04-15 09:30:00.000 |

  And I am logged in as "John"
  When I go to the events page

@javascript
Scenario: Going to events page should render the calendar
  Then it should render the calendar
  Then show me the page