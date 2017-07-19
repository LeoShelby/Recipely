Feature: User recive badge notification
As a registred user,
I want to recive a notification 
when i gain a chef badge


@load-seed-data @US49

Scenario: User views his badge chef notification
Given I am userB
When I visit the recipes index
Then I want to view all the recipe
And I want to view the recipe decription
Then  I want to do the recipe
Then  I recive a chef badge notification
