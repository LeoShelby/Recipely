Feature: Comment recipe
As a registred user,
I want to comment a recipe


@load-seed-data @US49

Scenario: User comment a recipe
Given I am authenticated
When I visit the recipes index
Then I want to view all the recipe
And I want to view the recipe decription
Then I want to comment the recipe 

