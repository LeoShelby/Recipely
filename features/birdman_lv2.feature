Feature: User recive badge notification
As a registred user,
I want to recive a follow lv2 badge
when i follow 2 users


@load-seed-data @US49

Scenario: User gains his  birdman lv 2 badge
Given I am userB
When  I visit the users index
Then  I want to follow 2 users
When I visit my profile
Then I want to view my birdman lv2 badge
