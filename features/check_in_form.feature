Feature: Check In Form Functionality Test
    In Order to Check In Lab Assistants
    As a TA or Admin
    I want a functional lab assistant check in form

Background: admin and LAs added to database
    
    Given the following Lab Assistant exists:
    | first_name | last_name | email            | password | validated |
    | Alice1     | Assistant | labass1@test.com | password | false     |
    | Bob2       | Assistant | labass2@test.com | password | false     |
    | Claire3    | Assistant | labass3@test.com | password | false     |
    | Dylan4     | Assistant | labass4@test.com | password | false     |

    Given the following Teaching Assistant exists:
    | first_name   | last_name | email            | password  | validated |
    | teach        | er        | bigboss@test.com | password  | true      |

    Scenario: See Check In Link On Dashboard
        Given I am on the teaching assistant login page
        And I fill in "teaching_assistant_email" with "bigboss@test.com"
        And I fill in "teaching_assistant_password" with "password"
        And I press "Log in"
        Given I am on the teaching assistant dashboard page
        Then I should see "Check In Here"
        Then I should see "Lab Times"

    Scenario: Lab Assistant Check-In
        Given I am on the teaching assistant login page
        And I fill in "teaching_assistant_email" with "bigboss@test.com"
        And I fill in "teaching_assistant_password" with "password"
        And I press "Log in"
        Given I am on the teaching assistant dashboard page
        And I follow "Check In Here"
        Then I should see "Lab Assistant Check-In"
        And I fill in "check_in_form_name" with "Youri"
        And I fill in "check_in_form_SID" with "123456"
        And I choose "check_in_form_event_office_hours"
        And I press "Check-In"
        Then I should see "Showing Check In Form"
        Then I should see "Youri"
        Then I should see "123456"
        Then I should see "teach"
        Then I should see "Check in another lab assistant"
        Then I should see "Edit this form"
        Then I should see "Back to dashboard"
        And I follow "Back to dashboard"
        Then I should see "Teaching Assistant Dashboard"

    Scenario: Failed Check-In
        Given I am on the teaching assistant login page
        And I fill in "teaching_assistant_email" with "bigboss@test.com"
        And I fill in "teaching_assistant_password" with "password"
        And I press "Log in"
        Given I am on the teaching assistant dashboard page
        And I follow "Check In Here"
        Then I should see "Lab Assistant Check-In"
        And I fill in "check_in_form_SID" with "123456"
        And I press "Check-In"
        Then I should see "Lab Assistant Check-In"
