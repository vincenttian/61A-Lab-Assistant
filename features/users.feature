Feature: users can authenticate
 
  As a user (TA or LA)
  So that I can get access to information I need in the app
  I want to be able to log in

Background: 
  When  I am on the RottenPotatoes home page

Scenario: login
  When I fill in 'login' with 'admin'
  And I fill in 'password' with 'password'
  And I click 'Login'
  Then I should be on the dashboard page
