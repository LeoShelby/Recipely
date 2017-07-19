Feature: Info ingredient
As a registred user,
when I view a recipe
I want to view ingredient detail 


@load-seed-data @US49

Scenario: User view ingredient's info
Given I am authenticated
When I visit the recipes index
Then I want to view all the recipe 
And I want to view the recipe decription 
And I want to view the ingredients info 

