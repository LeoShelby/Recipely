Feature: User recive badge notification
As a registred user,
I want to recive a chef lv2 badge
when i create 2 recipes


@load-seed-data @US49

Scenario: User gains his  chef lv 2 badge
Given I am userB
When I visit the recipes index
Then I want to view all the recipe
And I want to view the recipe decription
Then  I want to do the recipe
Then  I want to view a second recipe
Then  I want to do the recipe
When I visit my profile
Then I want to view my chef lv2 badge
