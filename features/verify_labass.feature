Feature: Verify Lab Assistant Sign up
    As an access restriction
    As a TA or Admin
    I want to confim Lab Assistant Sign ups

    Given the following Lab Assistant exists:
    | first_name | last_name | email            | password | validated |
    | Alice1     | Assistant | labass1@test.com | password | false     |
    | Bob2       | Assistant | labass2@test.com | password | false     |
    | Claire3    | Assistant | labass3@test.com | password | false     |
    | Dylan4     | Assistant | labass4@test.com | password | false     |

    Given the following admin exists:
    | first_name   | last_name | email            | password  |
    | admin        | 1         | bigboss@test.com | password  |

    Scenario: Verification One Lab Assistant
        # Given I am on the admin login page
        # And I fill in "admin_email" with "bigboss@test.com"
        # And I fill in "admin_password" with "password"
        # And I press "Log in"
        # Given I am on the admin dashboard page
        # And I debug
        # And I check "1"
        # When I press "Validate"
        # Then I should see a confirmation containing "Alice1"

    # Scenario: Verification of Multple Lab Assistatns
    #     Given I am on the verification page
    #     And I am a TA or I am a Admin
    #     And I mark checkbox(s) [1,2]
    #     When I press "Confirm Lab Assistants"
    #     Then I should see a confirmation containing "Bob2"
    #     And I should see a confirmation containing "Claire3"

    # Scenario: Select All Lab Assistants
    #     Given I am on the verification page
    #     And I am a TA or I am a Admin
    #     When I press "Select All"
    #     Then all checkboxes should be checked

    # Scenario: Verify All Lab Assistants
    #     Given I am on the verification page
    #     And I am a TA or I am a Admin
    #     When I press "Select All"
    #     And I press "Confirm Lab Assistants"
    #     Then I should see a confirmation containing "Alice1"
    #     And I should see a confirmation containing "Bob2"
    #     And I should see a confirmation containing "Claire3"
    #     And I should see a confirmation containing "Dylan4"
