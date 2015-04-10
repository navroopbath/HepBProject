Feature: signing up as volunteer
	as an unregistered volunteer
	so that I can create a volunteer profile
	I want to sign up with by entering my personal information

Background: Members in the database
  Given the following members exist: 
  | first_name   | last_name  | grad_date     | phone       | email                 | password      | is_admin | 
  | Craig        | Hiller     | May 15, 2015  | 5555555555  | chiller@berkeley.edu  | testtest      | yes      | 

  And I am on the portal sign-up page

Scenario: successful sign-up
  When I fill in all fields with: Armando, Fox, 05/16/15, 5555555555, afox@berkeley.edu, testtest, testtest
  And I press "Submit"
  Then I should be on the portal login page
  Then I should see "Welcome! You have signed up successfully."

Scenario: password mismatch
  When I fill in all fields with: Armando, Fox, 05/16/15, 5555555555, afox@berkeley.edu, testtest, nopenope
  And I press "Submit"
  Then I should be on the fail sign up page
  And I should see "Sign up 1 error prohibited this member from being saved: Password doesn't match confirmation"
  #And I should see the following information: Armando, Fox, 05/16/15, 5555555555, afox@berkeley.edu

Scenario: one or more of the fields are empty
  When I fill in "First name" with "Armando"
  And I fill in "Grad date" with "05/16/15"
  And I press "Submit"
  Then I should be on the fail sign up page
  And I should see "Sign up 4 errors prohibited this member from being saved: Last name can't be blankPhone can't be blankEmail can't be blankPassword can't be blank"

Scenario: one of the field types is invalid
  When I fill in all fields with: Armando, Fox, 05/16/15, (555)555-5555, afox@berkeley.edu, testtest, testtest
  And I press "Submit"
  #Then I should be on the fail sign up page
  #And I should see "One or more of the entries are invalid"

Scenario: account already exists
  When I fill in all fields with: Craig, Chiller, 05/16/15, 5555555555, chiller@berkeley.edu, testtest, testtest
  And I press "Submit"
  Then I should be on the fail sign up page
  And I should see "Email has already been taken"