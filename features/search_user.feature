Feature: Search user
As a registred user,
I want to search a user by name


@load-seed-data @US49

Scenario: User search another user 
Given I am authenticated
When I visit the users index
Then I want to search a user 

