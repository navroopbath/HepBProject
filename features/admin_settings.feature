Feature: Admin Settings Tab
  As a HepB Admin
  So that I can update the semester deadlines
  I want to see an edit form for semester deadlines

Background: global settings in database

 Given the following settings:
 | deadline_one            | deadline_two            | semester_start_date          | semester_end_date            |
 | 2015-03-15 17:30:00.000 | 2015-04-25 17:30:00.000 | 2015-01-20 17:30:00.000      | 2015-05-15 17:30:00.000      |

 Given John is in the database with the following information:
  | first_name   | last_name  | grad_date    | phone       | email                 | password    | is_admin | warnings |
  | John         | Blume      | May 15, 2015 | 4444444444  | johnBlume@gmail.com   | 12345678    | true     |    0     |
  
  And I am logged in as "John"
  When I go to the admin settings page for "John"

Scenario: Successfully displays previous settings values
  Then I should see "Semester Start Date" 
  And I should see "Semester End Date"

@javascript
Scenario: Successfully updates settings values
  When I fill in "Semester Start Date" with "2015-01-21"
  And I press "Update"
  Then I should see "Semester Start Date"

  





