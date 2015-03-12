Feature: log in as volunteer
	as a registered volunteer
	so that I can access my profile
	I want to log in with my email and password

Background: members have been added to database

 Given the following members exist:
  | first_name   | last_name  | year    | phone       | email                 | password  | is_admin | hours |
  | Judy         | Blume      | Senior  | 5555555555  | judyBlume@gmail.com   | 123456    | no       | 5     |
 
 And I am on the portal login page

Scenario: Succsessful login 
	Given that I am on the portal login page
	When I type "judyBlume@gmail.com" into username
	And I type "123456" into password
	And I press "Login"
	Then I should be on the portal dashboard 

Scenario: Unsuccessful login (No username) 
	Given that I am on the portal login page
	And I type "blah" into username
	And I type "blerg" into password
	And I press "Login"
	Then I should be on the portal login page
	And I should see "Unsuccessful login: Incorrect username or password"

Scenario: Unsuccessful login (Incorrect password) 
	Given that I am on the portal login page
	And I type "judyBlume@gmail.com" into username
	And I type "blerggg" into password
	And I press "Login"
	Then I should be on the portal login page
	And I should see "Unsuccessful login: Incorrect username or password" 

Scenario: Unsuccessful login (blank feilds)
	Given that I am on the portal login page
	And I type "judyBlume@gmail.com"  into username
	And I press "Login"
	Then I should be on the portal login page
	And I should see "Unsuccessful login: missing (blank) fields"