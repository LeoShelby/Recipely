Feature: Sign up and Log in with Facebook
As an unregistered user,
I want to sign up/log in with facebook , 
so that I can save time



Scenario: User sign up an log in with facebook
When I visit the homepage
Given I am not registred
When  I sign up with Facebook
Then  I want to view my account

