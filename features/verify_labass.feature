Feature: Verify Lab Assistant Sign up
    As an access restriction
    As a TA or Admin
    I want to confim Lab Assistant Sign ups

Background: admin and LAs added to database
    
    Given the following Course exists:
    | name  | id |
    | CS61A | 1  |
    
    Given the following Lab Assistant exists:
    | first_name | last_name | email            | password | validated | SID      | course_id |
    | Alice1     | Assistant | labass1@test.com | password | false     | 12345670 | 1         |
    | Bob2       | Assistant | labass2@test.com | password | false     | 12345671 | 1         |
    | Claire3    | Assistant | labass3@test.com | password | false     | 12345672 | 1         |
    | Dylan4     | Assistant | labass4@test.com | password | false     | 12345673 | 1         |

    Given the following admin exists:
    | first_name   | last_name | email            | password  |
    | admin        | 1         | bigboss@test.com | password  |

    Given the following Teaching Assistant exists:
    | first_name   | last_name | email            | password  | validated | course_id |
    | teach        | er        | bigboss2@test.com| password  | true      | 1         |

    Scenario: Verification One Lab Assistant Admin
        Given I am on the admin login page
        And I fill in "admin_email" with "bigboss@test.com"
        And I fill in "admin_password" with "password"
        And I press "Log in"
        Given I am on the admin dashboard page
        And I check Alices checkbox
        When I press "la_validate"
        Then I should see a confirmation containing "Alice1"
        Given I am on the admin dashboard page
        And I check Alices checkbox
        When I press "la_invalidate"
        Then I should see a confirmation containing "Alice1"
        Given I am on the admin dashboard page
        And I check Alices checkbox
        When I press "la_delete"
        Then I should not see "Alice1"


    # Scenario: Verification of Multple Lab Assistatns
    #     Given I am on the verification page
    #     And I am a TA or I am a Admin
    #     And I mark checkbox(s) [1,2]
    #     When I press "Confirm Lab Assistants"
    #     Then I should see a confirmation containing "Bob2"
    #     And I should see a confirmation containing "Claire3"

    # Scenario: Verify All Lab Assistants
    #     Given I am on the verification page
    #     And I am a TA or I am a Admin
    #     When I press "Select All"
    #     And I press "Confirm Lab Assistants"
    #     Then I should see a confirmation containing "Alice1"
    #     And I should see a confirmation containing "Bob2"
    #     And I should see a confirmation containing "Claire3"
    #     And I should see a confirmation containing "Dylan4"

    Scenario: Verification One Lab Assistant TA
        Given I am on the teaching assistant login page
        And I fill in "teaching_assistant_email" with "bigboss2@test.com"
        And I fill in "teaching_assistant_password" with "password"
        And I press "Log in"
        Given I am on the teaching assistant dashboard page
        And I check Alices checkbox
        When I press "Validate"
        Then I should see a confirmation containing "Alice1"
        Given I am on the teaching assistant dashboard page
        And I check Alices checkbox
        When I press "Invalidate"
        Then I should see a confirmation containing "Alice1"
        Given I am on the teaching assistant dashboard page
        And I check Alices checkbox
        When I press "Delete"
        Then I should not see "Alice1"

    # Scenario: Verification of Multple Lab Assistatns
    #     Given I am on the verification page
    #     And I am a TA or I am a Admin
    #     And I mark checkbox(s) [1,2]
    #     When I press "Confirm Lab Assistants"
    #     Then I should see a confirmation containing "Bob2"
    #     And I should see a confirmation containing "Claire3"

    # Scenario: Verify All Lab Assistants
    #     Given I am on the verification page
    #     And I am a TA or I am a Admin
    #     When I press "Select All"
    #     And I press "Confirm Lab Assistants"
    #     Then I should see a confirmation containing "Alice1"
    #     And I should see a confirmation containing "Bob2"
    #     And I should see a confirmation containing "Claire3"
    #     And I should see a confirmation containing "Dylan4"
