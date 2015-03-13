Feature: Lab Assistant sign up

    In order to create an account
    As a Lab Assistant
    I want to be able to make an account
 
    Scenario: Sign up page
        Given I am on the home page
        And I fill in "teaching_assistant_first_name" with "Alice"
        And I fill in "teaching_assistant_last_name" with "Smith"
        And I fill in "teaching_assistant_email" with "test@test123.com"
        And I press "Create Teaching assistant"
        Then I should see a confirmation
 
    Scenario: Invalid sign up (blank field)
        Given I am on the home page
        And I fill in "teaching_assistant_first_name" with ""
        And I fill in "teaching_assistant_last_name" with "Smith"
        And I fill in "teaching_assistant_email" with "test@test123.com"
        And I press "Create Teaching assistant"
        Then I should see a invalid first name error message
 
    Scenario: Invalid sign up (invalid email)
        Given I am on the home page
        And I fill in "teaching_assistant_first_name" with "Alice"
        And I fill in "teaching_assistant_last_name" with "Smith"
        And I fill in "teaching_assistant_email" with "invalid_email"
        And I press "Create Teaching assistant"
        Then I should see a invalid email error message
 

    Scenario: Invalid sign up (Multiple error messages)
        Given I am on the home page
        And I fill in "teaching_assistant_first_name" with ""
        And I fill in "teaching_assistant_last_name" with ""
        And I fill in "teaching_assistant_email" with "invalid_email"
        And I press "Create Teaching assistant"
        Then I should see a invalid first name error message
        And I should see a invalid email error message