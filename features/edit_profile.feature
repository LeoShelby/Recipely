Feature: Edit profile
As an registered user,
I want to edit my profile  


@load-seed-data @US49

Scenario: User edit his profile
Given I am authenticated
When I visit the settings
Then  I want to edit my profile
  
