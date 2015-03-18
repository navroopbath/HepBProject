Feature: Navigating through the tabs.
  As a volunteer
  So that I can access information about hours, events, anouncements, and settings
  I want to be able to navigate to the different tabs

Background: I am saved in the database and logged in.
  Given I am in database
  | first_name   | last_name  | year    | phone       | email                 | password    | is_admin | hours |
  | Judy         | Blume      | Senior  | 5555555555  | judyBlume@gmail.com   | 12345678    | no       | 5     |
  And I am on the portal dashboard for "judyBlume@gmail.com"

Scenario: Navigating to Hours tab
  I should see the "Hours" tab
  When I follow "Hours"
  I should be on the "Hours" page
  And I should see "Volunteer Stats"
  And I should see "Announcements"

Scenario: Navigating to Announements tab
  I should see the "Announcements" tab
  When I follow "Announcements"
  Then I should be on the "Announcements" page
  And I should see the following announements: test,test1
  # implement a migration for announcements

Scenario: Navigating to the Events tab
  I should see the "Events" tab
  When I follow "Events"
  I should be on the "Events" page
  And I should see the following events: test,test1
  # implement the migration for the events table

Scenario: Accessing user settings
  I should see "Judy"
  When I follow "Judy"
  I should see the following links: logout, edit_profile, settings