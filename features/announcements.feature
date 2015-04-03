Feature: Announcements Tab
  As a HepB volunteer
  So that I can see all of the past announcements ordered by date
  I want to see all the announcements when I click on the announcements tab


Background: Members and announcements have been added to the database

  Given John is in the database with the following information:
  | first_name   | last_name  | grad_date | phone       | email                 | password    | is_admin | warnings |
  | John         | Blume      | 5/16/15   | 5555555555  | johnBlume@gmail.com   | 12345678    | no       |    0     |

  And the following announcements exist:
  | date_written            | body             | pinned | announcement_type |
  | 1998-02-26 09:34:00.000 | Come to meeting! | true   | Reminder          |
  | 1999-02-26 09:34:00.000 | Don't forget!    | false  | Reminder          |
  | 2014-02-26 09:34:00.000 | Actually, don't come. | false | Reminder      |
  | 2015-01-01 09:34:00.000 | Toy Story was ok. | true  | Assertion         |

  And I am logged in as "John"
  When I go to the announcements tab for "John"

  Scenario: see Announcements
    Then I should see "Come to meeting!"
    And I should see "Don't forget!"
    And I should see "Actually, don't come."
    And I should see "Toy Story was ok."

  Scenario: see Announcements in order
    Then I should see "Come to meeting!" before "Don't forget!"
    And I should see "Actually, don't come." before "Toy Story was ok."