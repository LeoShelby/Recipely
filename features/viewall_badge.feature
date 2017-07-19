Feature: User views his badge 
As a registred user,
I want to view my badges



@load-seed-data @US49

Scenario: User views his badges

Given I am userB
When I visit the users index
Then  I want to view UserA profile
Then  I want to like UserA recipe
When I visit my profile
Then I want to view my badges

