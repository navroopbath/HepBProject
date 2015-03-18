Feature: Announcements Tab
  I should see all of the past announcements


Background:

  And the following announcements exist:
  | author | date_created            | body             | 
  | Craig  | 2012-02-26 09:34:00.000 | Come to meeting! |
  | Shraig | 2010-02-26 09:34:00.000 | Don't attend meeting |
  | Finn the Human | 2020-02-26 09:34:00.000 | Mathematical!|

  And I am on the Hours tab

  Scenario: see Announcements
    Given I am logged in 
    Then I should see "Don't attend meeting"
    And I should see "Come to meeting!"

  Scenario: see Announcements in order
    Given I am logged in 
    Then I should see "Mathematical!" before "Come to meeting!"
    And I should see "Come to meeting!" before "Don't attend meeting"