Feature: Search recipe
As a unregistred user,
I want to search a recipe by title


@load-seed-data @US49

Scenario: User view ingredient's info
Given I am not registred
When I visit the recipes index
Then I want to search a recipe by title

