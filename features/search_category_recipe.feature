Feature: Search recipe by category
As a unregistred user,
I want to search a recipe by category


@load-seed-data @US49

Scenario: User  search a recipe by category
Given I am not registred
When I visit the recipes index
Then I want to search a recipe by category

