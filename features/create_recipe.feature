Feature: Create a recipe
As an registered user,
I want to create a recipe 


@load-seed-data @US49

Scenario: User create a recipe
Given I am authenticated
When  I create a recipe
Then  I want to put ingredients
Then I want to put allergens
