Feature: User recive like notification
As a registred user,
I want to recive a notification 
when someone like a recipe


@load-seed-data @US49

Scenario: User views his like notification
Given I am userB
When I visit the users index
Then  I want to view UserA profile
Then  I want to like UserA recipe
Given I am userA
Then  UserA recives a Like notification 
