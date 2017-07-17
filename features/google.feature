Feature: Sign up and Log in with Google+
As an unregistered user,
I want to sign up/log in with Google+ , 
so that I can save time



Scenario: User sign up an log in with Google+
When I visit the homepage
Given I am not registred
When  I sign up with Google+
Then  I want to view my account
