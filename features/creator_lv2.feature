Feature: User recive badge notification
As a registred user,
I want to recive a creator lv2 badge
when i create 2 recipes


@load-seed-data @US49

Scenario: User gains his  creator lv 2 badge
Given I am authenticated
When  I create a recipe
Then  I want to put ingredients
Then I want to put allergens
When  I create a second recipe
Then  I want to put ingredients
Then I want to put allergens
When I visit my profile
Then I want to view my creator lv2 badge
