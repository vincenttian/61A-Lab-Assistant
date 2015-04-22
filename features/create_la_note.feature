Feature: Create Lab Assistant Note
    In Order to leave feedback about lab assistants
    As a TA or Admin
    I want a functional lab assistant check in form

Background: admin and LAs added to database
    
    Given the following Lab Assistant exists:
    | first_name | last_name | email            | password | validated | SID      |
    | Alice1     | Assistant | labass1@test.com | password | false     | 12345670 |
    | Bob2       | Assistant | labass2@test.com | password | false     | 12345671 |
    | Claire3    | Assistant | labass3@test.com | password | false     | 12345672 |
    | Dylan4     | Assistant | labass4@test.com | password | false     | 12345673 |

    Given the following Teaching Assistant exists:
    | first_name   | last_name | email            | password  | validated |
    | teach        | er        | bigboss@test.com | password  | true      |

    Scenario: See Add Note Button on Dashboard
        Given I am on the teaching assistant login page
        And I fill in "teaching_assistant_email" with "bigboss@test.com"
        And I fill in "teaching_assistant_password" with "password"
        And I press "Log in"
        Given I am on the teaching assistant dashboard page
        Then I should see "Alice1"
        Then I should see "Add Note for Alice1"

    Scenario: Add Note for Lab Assistant
        Given I am on the teaching assistant login page
        And I fill in "teaching_assistant_email" with "bigboss@test.com"
        And I fill in "teaching_assistant_password" with "password"
        And I press "Log in"
        Given I am on the teaching assistant dashboard page
        And I follow "Add Note for Alice1"
        And I fill in "add_lab_assistant_note" with "Awesome"
        And I press "Add Note"
        Then I should be on the teaching assistant dashboard page

    Scenario: Cancel Add Note for Lab Assistant
        Given I am on the teaching assistant login page
        And I fill in "teaching_assistant_email" with "bigboss@test.com"
        And I fill in "teaching_assistant_password" with "password"
        And I press "Log in"
        Given I am on the teaching assistant dashboard page
        And I follow "Add Note for Alice1"
        And I press "Cancel"
        Then I should be on the teaching assistant dashboard page

    Scenario: Cant Add Empty Note for Lab Assistant
        Given I am on the teaching assistant login page
        And I fill in "teaching_assistant_email" with "bigboss@test.com"
        And I fill in "teaching_assistant_password" with "password"
        And I press "Log in"
        Given I am on the teaching assistant dashboard page
        And I follow "Add Note for Alice1"
        And I press "Add Note"
        Then I should see "Cannot add empty lab assistant note"
