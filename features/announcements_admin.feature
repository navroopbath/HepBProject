Feature: Announcements as Admin Feature 
As a HepB admin 
So that I can managae my annoucements 
I want to be able to add, pin and delete them 

Background: Members and announcements have been added to the database

  Given John is in the database with the following information:
  | first_name   | last_name  | grad_date | phone       | email                 | password    | is_admin | warnings |
  | Harry        | Potter      | May 15, 2015  | 5555555555  | johnBlume@gmail.com  | 12345678    | true      |    0     |

  And the following announcements exist:
  | date_written            | body             | pinned | announcement_type |
  | 1998-02-26 09:34:00.000 | Come to meeting! | true   | Reminder          |
  | 1999-02-26 09:34:00.000 | Don't forget!    | true  | Reminder          |
  | 2014-02-26 09:34:00.000 | Actually, don't come. | true | Reminder      |
  | 2015-04-20 09:34:00.000 | Toy Story was ok. | false  | Assertion         |


  And I am logged in as "Harry"
  When I go to the announcements tab for "Harry"

  Scenario: Admin creates a new announcment
    Then I should see "+Add Announcement"
    And I should see "Come to meeting!"
    When I click "#newA"
    When I fill in "announ_title" with "My brand new annoucement"
    And I fill in "announ_body" with "This is cool!"
    And I press "Create"
    Then I should see "This is cool!"

 Scenario: Admin pins exsisting announcement 
 	When I follow "Pin" 
 	And I follow "Dashboard"
 	Then I should see "Toy Story was ok."

 Scenario: Admin edits exsisting announcement 
  When I follow "Edit" for "Toy Story"
  And I fill in "announcement_body" with "Toy Story was awesome!!!"


Scenario: Admin unpins exsisting announcment 
  When I follow "Unpin" for "Toy Story was ok." 
  And I follow "Dashboard"
  Then I should not see "Toy Story was ok."


Scenario: Deleting annoucnments 
  When I follow "Delete" for "Toy Story was ok." 
  Then I should not see "Toy Story was ok." 