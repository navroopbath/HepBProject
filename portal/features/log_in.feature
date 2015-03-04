Feature: log in as volunteer
	as a registered volunteer
	so that I can access my profile
	I want to log in with my email and password

Background: members in database

 Given the following members exist:
  | name  | last name       | email                   | password     | year         | major  |
  | Judy  |  Blume          | judyBlume@gmail.com     | 123456       |   jr.        |   CS   |
 

Scenario: Succsessful login 
	Given I am on the portal login page
	And I type "judyBlume@gmail.com" into username
	And I type "123456" into password
	And I press login 
	Then I should be on the users dashboard 

Scenario: Unsuccessful login (No username) 
	Given that I am on the portal login page
	And I type an "blah"into username
	And I type "blerg" into password
	And I press login
	Then I should be on the portal login page
	And I should see a notice 

Scenario: Unsuccessful login (Incorrect password) 
	Given that I am on the portal login page
	And I type "judyBlume@gmail.com" into username
	And I type "blerggg" into password
	And I press login
	Then I should be on the portal login page
	And I should see a notice 

Scenario: Unsuccessful login (blank feilds)
	Given that I am on the portal login page
	And I type "judyBlume@gmail.com"  into username
	And I press login
	Then I should be on the portal login page
	And I should see a notice 

