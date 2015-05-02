Feature: Contacts Tab
  As a HepB volunteer
  So that I can find another member's contact information
  I want to see all member's contact information listed on then contacts tab

Background: members have been added to database

 Given John is in the database with the following information:
  | first_name   | last_name  | grad_date    | phone       | email                 | password    | is_admin | warnings |
  | John         | Blume      | May 15, 2015 | 4444444444  | johnBlume@gmail.com   | 12345678    | no       |    0     |
  | Craig        | Hiller     | May 15, 2015  | 5555555555  | thriller@berkeley.edu | testtest    | yes      |    0     |
  | Vin          | Disel      | May 16, 2015  | 1111111111  | fastandfur@mail.com  | abcdefgh    | no       |    0     |


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
  | date_written            | body             | pinned | announcement_type | title    |
  | 2012-02-26 09:34:00.000 | Come to meeting! | true   | Reminder          | Reminder |
  | 1999-02-26 09:34:00.000 | Don't forget!    | false  | Reminder          | Reminder |
  | 2011-02-26 09:34:00.000 | Oh hai           | true   | Reminder          | Reminder |

  And I am logged in as "Vin"
  When I go to the contacts page for "Vin"


Scenario: Successfully displays ordered contacts
  Then I should see "John Blume" before "Vin Disel"
  And I should see "Craig Hiller"
  And I should see "chiller@berkeley.edu"
  And I should see "5555555555"



