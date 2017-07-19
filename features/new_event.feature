Feature: Create event
As a registred user,
I want to create an event


@load-seed-data @US49

Scenario: User create an event
Given I am authenticated
Then I want to create an event
Then I want to view the event
