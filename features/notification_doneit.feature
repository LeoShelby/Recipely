Feature: User recive done notification
As a registred user,
I want to recive a notification 
when someone does a recipe


@load-seed-data @US49

Scenario: User views his like notification
Given I am userB
When I visit the users index
Then  I want to view UserA profile
Then  I want to do UserA recipe
Given I am userA
Then  UserA recives a Done notification 
