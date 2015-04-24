Feature: LAs See Signed Up Labs and Checkins
    In order to understand their current status
    As a Lab Assistant
    I want to be able to see which lab I'm in and my checkins

Background: admin, TAs, and LAs added to database
    
    Given the following Course exists:
    | name  | id |
    | CS61A | 1  |
    
    Given the following Lab Assistant exists:
    | first_name | last_name | email            | password | validated | SID      | course_id |
    | Alice1     | Assistant | labass1@test.com | password | true      | 12345672 | 1         |
    | Bob2       | Assistant | labass2@test.com | password | false     | 12345673 | 1         |
    | Claire3    | Assistant | labass3@test.com | password | false     | 12345674 | 1         |
    | Dylan4     | Assistant | labass4@test.com | password | false     | 12345678 | 1         |

    Given the following admin exists:
    | first_name   | last_name | email             | password  |
    | admin        | 1         | bigboss1@test.com | password  |

    Given the following Teaching Assistant exists:
    | first_name   | last_name | email            | password  | validated | course_id |
    | teach        | er        | bigboss@test.com | password  | true      | 1         |

    Given the following lab times exists:
    | open      | close    |  day        | course_id |
    | 8:00:00   | 9:00:00  |  Monday     | 1         |
    | 9:00:00   | 10:00:00 |  Tuesday    | 1         |
    | 10:00:00  | 11:00:00 |  Wednesday  | 1         |
    | 14:00:00  | 16:00:00 |  Thursday   | 1         |

    Scenario: LAs logging in and see their lab times
        Given I am assigned to lab time 1
        And I am on the la login page
        And I fill in "lab_assistant_email" with "labass1@test.com"
        And I fill in "lab_assistant_password" with "password"
        And I press "Log in"
        Given I am on the la dashboard page
        Then I should be assigned to a lab

    Scenario: LAs logging in and see their history of check ins
        Given I am assigned to lab time 1
        And I have signed in to lab
        And I am on the la login page
        And I fill in "lab_assistant_email" with "labass1@test.com"
        And I fill in "lab_assistant_password" with "password"
        And I press "Log in"
        Given I am on the la dashboard page
        Then I should see my check in to lab
