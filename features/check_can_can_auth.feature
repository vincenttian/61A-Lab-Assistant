Feature: Check CanCan Authorization
    In order to keep certain functionality private
    As an Admin
    I want to make sure access is restricted

Background: admin and LAs added to database
    
    Given the following Lab Assistant exists:
    | first_name | last_name | email            | password | validated |  SID      |
    | Alice1     | Assistant | labass1@test.com | password | true      | 12345670  |
    | Bob2       | Assistant | labass2@test.com | password | false     | 12345671  |
    | Claire3    | Assistant | labass3@test.com | password | false     | 12345672  |
    | Dylan4     | Assistant | labass4@test.com | password | false     | 12345673  |

    Given the following admin exists:
    | first_name   | last_name | email             | password  |
    | admin        | 1         | bigboss1@test.com | password  |

    Given the following Teaching Assistant exists:
    | first_name   | last_name | email            | password  | validated |
    | teach        | er        | bigboss@test.com | password  | true      |

    Scenario: Restrict TA Access
        Given I am on the teaching assistant login page
        And I fill in "teaching_assistant_email" with "bigboss@test.com"
        And I fill in "teaching_assistant_password" with "password"
        And I press "Log in"
        When I go to the admin dashboard page
        Then I should see "Teaching Assistant Dashboard"

    Scenario: Restrict LA Access
        Given I am on the la login page
        And I fill in "lab_assistant_email" with "labass1@test.com"
        And I fill in "lab_assistant_password" with "password"
        And I press "Log in"
        When I go to the admin dashboard page
        Then I should see "Lab Assistant Dashboard"
