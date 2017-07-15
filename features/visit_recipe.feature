Feature: Visit recipes
As an unregistered user,
I want to view all the recipes , 
so that I can cook them

@load-seed-data @US49

Scenario: User visit a recipe 
Given I am not registred
When  I visit the recipes index
Then  I want to view all the recipe
And   I want to view the recipe decription  
