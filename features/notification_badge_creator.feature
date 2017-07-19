Feature: User recive badge creator  notification
As a registred user,
I want to recive a notification 
when i gain a creator badge


@load-seed-data @US49

Scenario: User views his badge notification
Given I am userB
When  I create a recipe
Then  I want to put ingredients
Then I want to put allergens
Then  I recive a creator badge notification 
