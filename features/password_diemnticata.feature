Feature: Forgotten password
As a registered user,
if I forget my password, 
I want to retrieve it with my email

Scenario: User retrieve password forgotten
Given I am registred
When  I forget my password
Then  I want to retrieve it by email 

