Feature: Lab Assistant sign up

    In order to create an account
    As a Lab Assistant and Teaching Assistant
    I want to be able to make an account
 
    Scenario: Sign up page TA
        Given I am on the home page
        And I fill in "teaching_assistant_first_name" with "Alice"
        And I fill in "teaching_assistant_last_name" with "Smith"
        And I fill in "teaching_assistant_email" with "test@test123.com"
        And I press "Create Teaching assistant"
        Then I should see a confirmation
 
    Scenario: Invalid sign up (blank field) TA
        Given I am on the home page
        And I fill in "teaching_assistant_first_name" with ""
        And I fill in "teaching_assistant_last_name" with "Smith"
        And I fill in "teaching_assistant_email" with "test@test123.com"
        And I press "Create Teaching assistant"
        Then I should see a TA invalid first name error message
 
    Scenario: Invalid sign up (invalid email) TA
        Given I am on the home page
        And I fill in "teaching_assistant_first_name" with "Alice"
        And I fill in "teaching_assistant_last_name" with "Smith"
        And I fill in "teaching_assistant_email" with "invalid_email"
        And I press "Create Teaching assistant"
        Then I should see a TA invalid email error message
 

    Scenario: Invalid sign up (Multiple error messages) TA
        Given I am on the home page
        And I fill in "teaching_assistant_first_name" with ""
        And I fill in "teaching_assistant_last_name" with ""
        And I fill in "teaching_assistant_email" with "invalid_email"
        And I press "Create Teaching assistant"
        Then I should see a TA invalid first name error message
        And I should see a TA invalid email error message

    Scenario: Sign up page for lab assistants
        Given I am on the home page
        And I fill in "lab_assistant_first_name" with "Alice"
        And I fill in "lab_assistant_last_name" with "Smith"
        And I fill in "lab_assistant_email" with "test@test123.com"
        And I fill in "lab_assistant_SID" with "12345678"
        And I press "Create Lab assistant"
        Then I should see a confirmation
        When I follow "LA Login"
        Then I should see "Lab Assistant Log In"
        And I fill in "lab_assistant_email" with "test@test123.com"
        And I fill in "lab_assistant_password" with "password"
        Then I should see a LA invalid account error message
        Then I am on the home page

 
    Scenario: Invalid sign up (blank field) LA
        Given I am on the home page
        And I fill in "lab_assistant_first_name" with ""
        And I fill in "lab_assistant_last_name" with "Smith"
        And I fill in "lab_assistant_email" with "test@test123.com"
        And I press "Create Lab assistant"
        Then I should see a LA invalid first name error message
 

    Scenario: Invalid sign up (Multiple error messages) LA
        Given I am on the home page
        And I fill in "lab_assistant_first_name" with ""
        And I fill in "lab_assistant_last_name" with ""
        And I fill in "lab_assistant_email" with "invalid_email"
        And I press "Create Lab assistant"
        Then I should see a LA invalid first name error message
        And I should see a LA invalid email error message
