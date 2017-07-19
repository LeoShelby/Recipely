Feature: User recive badge notification
As a registred user,
I want to recive a notification 
when i gain a birdman badge


@load-seed-data @US49

Scenario: User views his badge birdman notification
Given I am userB
When  I visit the users index
Then  I want to follow a user
Then  I recive a birdman badge notification
