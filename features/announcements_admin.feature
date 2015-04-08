Feature: Announcements as Admin Feature 
As a HepB admin 
So that I can managae my annoucements 
I want to be able to add, pin and delete them 

Background: Members and announcements have been added to the database

  Given John is in the database with the following information:
  | first_name   | last_name  | grad_date | phone       | email                 | password    | is_admin | warnings |
  | Harry        | Potter      | 5/16/15   | 5555555555  | johnBlume@gmail.com  | 12345678    | yes      |    0     |

  And the following announcements exist:
  | date_written            | body             | pinned | announcement_type |
  | 1998-02-26 09:34:00.000 | Come to meeting! | true   | Reminder          |
  | 1999-02-26 09:34:00.000 | Don't forget!    | false  | Reminder          |
  | 2014-02-26 09:34:00.000 | Actually, don't come. | false | Reminder      |
  | 2015-01-01 09:34:00.000 | Toy Story was ok. | true  | Assertion         |


  And I am logged in as "Harry"
  When I go to the announcements tab for "Harry"

  Scenario: Admin creates a new announcment
    I should see "Add New"
    When I follow "Add New"
    And I fill in body with "My brand new annoucement"
    And I follow "Create"
    Then I shoud be on the announcments page
    And I should see "My brand new announcement"

 Scenario: Admin pins exsisting announcment 
 	When I click pin for "Come to meeting"
 	And I follow "Dashboard"
 	Then I should see "Come to meeting"

Scenario: Deleting annoucnments 
  When I click delete for "Don't forget!"
  Then I should not see "Don't forget!" 