Feature: Verify LA and TA Information
    In order to manage LAs and TAs
    As an Admin
    I want to be able to see profile information

Background: admin and LAs added to database
    
    Given the following Lab Assistant exists:
    | first_name | last_name | email            | password | validated | SID      |
    | Alice1     | Assistant | labass1@test.com | password | false     | 12345670 |
    | Bob2       | Assistant | labass2@test.com | password | false     | 12345671 |
    | Claire3    | Assistant | labass3@test.com | password | false     | 12345672 |
    | Dylan4     | Assistant | labass4@test.com | password | false     | 12345673 |

    Given the following admin exists:
    | first_name   | last_name | email            | password  |
    | admin        | 1         | bigboss@test.com | password  |

    Given the following Teaching Assistant exists:
    | first_name   | last_name | email            | password  | validated |
    | teach        | er        | bigboss@test.com | password  | true      |

    Scenario: Check TA information
        Given I am on the admin login page
        And I fill in "admin_email" with "bigboss@test.com"
        And I fill in "admin_password" with "password"
        When I press "Log in"
        Then I am on the admin dashboard page
        Then I should see "teach er"
        When I follow "teach er"
        Then I should see "first name: teach"

    Scenario: Check LA information
        Given I am on the admin login page
        And I fill in "admin_email" with "bigboss@test.com"
        And I fill in "admin_password" with "password"
        When I press "Log in"
        Then I am on the admin dashboard page
        Then I should see "Alice1"
        When I follow "Alice1 Assistant"
        Then I should see "first name: Alice1"
