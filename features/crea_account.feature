Feature: Account creation
As an unregistered user,
I want to create an account, 
only with valid params

Scenario: User creates a personal account 
Given I am not registred
When  I visit the homepage
Then  I want to register with valid params
And   I want to fill in my allergen list
Then  I want to view my profile
