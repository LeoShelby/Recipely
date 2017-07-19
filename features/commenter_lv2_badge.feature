Feature: User recive gain a commenter lv2 badge
As a registred user,
I want to gain a commenter lv2 badge 
when i  commente 2 recipes


@load-seed-data @US49

Scenario: User views his badge commenter lv2
Given I am authenticated
When I visit the recipes index
Then I want to view all the recipe
And I want to view the recipe decription
Then I want to comment the recipe
Then I want to comment the recipe
When I visit my profile
Then I want to view my commenter lv2 badge
