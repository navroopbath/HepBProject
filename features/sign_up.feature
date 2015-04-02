Feature: signing up as volunteer
	as an unregistered volunteer
	so that I can create a volunteer profile
	I want to sign up with by entering my personal information

Background: Members in the database
  Given the following members exist: 
  | first_name   | last_name  | grad_date | phone       | email                 | password  | is_admin | 
  | Craig        | Hiller     | 5/16/15   | 5555555555  | chiller@berkeley.edu  | test      | yes      | 

  And I am on the portal sign-up page

Scenario: successful sign-up
  Then show me the page
  When I fill in all fields with: Armando, Fox, 5/16/15, 5555555555, afox@berkeley.edu, test, test
  And I press "Submit"
  Then I should be on the portal login page
  Then I should see "You have been sent a confirmation email"

Scenario: password mismatch
  When I fill in all fields with: Armando, Fox, 5/16/15, 5555555555, afox@berkeley.edu, test, nope
  And I press "Submit"
  Then I should be on the portal sign-up page
  And I should see "Passwords do not match"
  #And I should see the following information: Armando, Fox, 5/16/15, 5555555555, afox@berkeley.edu

Scenario: one or more of the fields are empty
  When I fill in "First Name" with "Armando"
  And I press "Submit"
  Then I should be on the portal sign-up page
  And I should see "One or more of the fields are empty"

Scenario: one of the field types is invalid
  When I fill in all fields with: Armando, Fox, 5/16/15, (555)555-5555, afox@berkeley.edu, test, test
  And I press "Submit"
  Then I should be on the portal sign-up page
  And I should see "One or more of the entries are invalid"

Scenario: account already exists
  When I fill in all fields with: Craig, Chiller, 5/16/15, 5555555555, chiller@berkeley.edu, test, test
  And I press "Submit"
  Then I should be on the portal sign-up page
  And I should see "Account already exists"