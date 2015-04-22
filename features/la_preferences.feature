Feature: Verify Lab Assistant Preferences
    As a Lab Assistant
    I want to only be matched with lab times that fit my schedule
    So that there is no conflict later on when confirming lab times

Background: admin and LAs added to database
    
    Given the following Lab Assistant exists:
    | first_name | last_name | email            | password | validated | SID      |
    | Alice1     | Assistant | labass1@test.com | password | true      | 12345670 |

    Given the following lab times exists:
    | open      | close    |  day        |
    | 8:00:00   | 9:00:00  |  Monday     |
    | 9:00:00   | 10:00:00 |  Tuesday    |
    | 10:00:00  | 11:00:00 |  Wednesday  |
    | 14:00:00  | 16:00:00 |  Thursday   |

    Scenario: Lab Assistant checks which times he is available for
        Given I am on the la login page
        And I fill in "lab_assistant_email" with "labass1@test.com"
        And I fill in "lab_assistant_password" with "password"
        And I press "Log in"
        Given I am on the la dashboard page
        And I check all lab time checkboxes
        When I press "Submit Lab Preferences"
        Then I should see all checkboxes as checked