Feature: Search recipe by extimated time
As a unregistred user,
I want to search a recipe by extimated time


@load-seed-data @US49

Scenario: User  search a recipe by extimated time
Given I am not registred
When I visit the recipes index
Then I want to search a recipe by extimated time

