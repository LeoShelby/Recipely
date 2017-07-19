Feature: User has notification bar
As a registred user,
I want to view my notification


@load-seed-data @US49

Scenario: User views his notification
Given I am authenticated
When  I visit the users index
Then  I want to follow UserB
When UserB authenticate
Then UserB recives a Follow notification 
