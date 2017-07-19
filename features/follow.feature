Feature: Follow a user
As an registered user,
I want to follow a user  


@load-seed-data @US49

Scenario: User follow another user
Given I am authenticated
When  I visit the users index
Then  I want to un-follow a user
