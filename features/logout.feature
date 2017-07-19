Feature: Log out
As an authenticated user,
I want to log out 


@load-seed-data @US49

Scenario: User logout his profile
Given I am authenticated
When I visit the settings
Then I want to logout
