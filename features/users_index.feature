Feature: Visit all users
As an registered user,
I want to view all the users , 
so that I can interact  with them

@load-seed-data @US49

Scenario: User view other user's profile
Given I am authenticated
When I visit the users index
Then I want to view a user profile  
