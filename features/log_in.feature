Feature: log in as volunteer
	as a registered volunteer
	so that I can access my profile
	I want to log in with my email and password

Background: members have been added to database

 Given the following members exist:
  | first_name   | last_name  | year    | phone       | email                 | password  | is_admin | hours |
  | Judy         | Blume      | Senior  | 5555555555  | judyBlume@gmail.com   | 123456    | no       | 5     |
 
 And I am on the portal login page

Scenario: Successful login 
	When I fill in "Email" with "judyBlume@gmail.com"
	And I fill in "Password" with "123456"
	And I press "Submit"
	Then I should be on the portal dashboard 

Scenario: Unsuccessful login (No username) 
	When I fill in "Email" with "blah"
	And I fill in "Password" with "blerg"
	And I press "Submit"
	Then I should be on the portal login page
	And I should see "Unsuccessful login: Incorrect username or password"

Scenario: Unsuccessful login (Incorrect password) 
	When I fill in "Email" with "judyBlume@gmail.com"
	And I fill in "Password" with "blerggg"
	And I press "Submit"
	Then I should be on the portal login page
	And I should see "Unsuccessful login: Incorrect username or password" 

Scenario: Unsuccessful login (blank feilds)
	When I fill in "Email" with "judyBlume@gmail.com"
	And I press "Submit"
	Then I should be on the portal login page
	And I should see "Unsuccessful login: One or more of the fields are empty"
