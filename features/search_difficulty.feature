Feature: Search recipe by difficulty
As a unregistred user,
I want to search a recipe by difficulty


@load-seed-data @US49

Scenario: User  search a recipe by difficulty
Given I am not registred
When I visit the recipes index
Then I want to search a recipe by difficulty

