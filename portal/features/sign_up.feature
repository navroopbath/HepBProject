Feature: signing up as volunteer
	as an unregistered volunteer
	so that I can create a volunteer profile
	I want to sign up with by entering my personal information


Background: Redirect from home page to portal page
  Given I am on the portal home page
  And I click the "Go to portal"
  Then I should see the portal access page
  When I click "Sign-up"
  I should be on the sign-up page

Background: Members in the database
  Given the following movies exist: 
  | first_name   | last_name  | year    | phone       | email                 | password  | is_admin | hours |
  | Craig        | Hiller     | Senior  | 5555555555  | chiller@berkeley.edu  | test      | yes      | 5     |

Scenario: successful sign-up
  When I fill in the following fields: Armando, Fox, Senior, 5555555555, afox@berkeley.edu, test, test
  And I press "Sign-Up"
  Then I should be on the portal homepage
  Then I should see "You have been sent a confirmation email"
  And I should see "Welcome Armando Fox!"

Scenario: password mismatch
  When I fill in the following fields: Armando, Fox, Senior, 5555555555, afox@berkeley.edu, test, nope
  And I press "Sign-up"
  Then I should be on the sign-up page
  And I should see "Passwords do not match"
  And I should see the following information: Armando, Fox, Senior, 5555555555, afox@berkeley.edu

Scenario: one or more of the fields are empty
  When I fill in "First Name" with "Armando"
  And I press "Sign-up"
  Then I should be on the sign-up page
  ANd I should see "One or more of the fields are empty"

Scenario: one of the field types is invalid
  When I fill in the following fields: Armando, Fox, Senior, (555)555-5555, afox@berkeley.edu, test, test
  And I press "Sign-up"
  Then I should be on the sign-up page
  And I should see "One or more of the entries are invalid"

Scenario: account already exists
  When I fill in the following fields: Craig, Chiller, Senior, 5555555555, chiller@berkeley.edu, test, test
  And I press "Sign-up"
  Then I should be on the sign-up page
  And I should see "Account already exists"


