Feature: Delete a user
As an admin user,
I want to delete a recipe 


@load-seed-data @US49

Scenario: Admin delete a user
Given I am admin
Then  I visit the users index
Then  I want to delete a user
