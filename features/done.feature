Feature: Done a recipe
As a registred user,
I want to done a recipe


@load-seed-data @US49

Scenario: User does a recipe
Given I am authenticated
When I visit the recipes index
Then I want to view all the recipe
And I want to view the recipe decription
Then  I want to do the recipe


