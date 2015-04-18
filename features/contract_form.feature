Feature: Lab Assistant Contract Form
 
    In order to verify my account so that I can be official registered to Lab Assist
    As a Lab Assistant
    I want to be able to access the Contract form to automatically verify my account

Background: admin and LAs added to database

    Given the following Lab Assistant exists:
    | first_name | last_name | email            | password | validated |
    | Alice1     | Assistant | labass1@test.com | password | false     |

    Given the following admin exists:
    | first_name   | last_name | email            | password  |
    | admin        | 1         | bigboss@test.com | password  |

    Scenario: Validating an invalid lab assistant
        Given I am on the contract form page
        And I fill in "contract_email_address" with "labass1@test.com"
        And I fill in "contract_first_name" with "Alice1"
        And I fill in "contract_last_name" with "Assistant"
        And I fill in "contract_times_assisted" with "1"
        And I fill in "contract_abide_by_rules" with "Alice1 Assistant"
        And I press "Submit"
        Then I should see a contract form confirmation
        Given I am on the admin login page
        And I fill in "admin_email" with "bigboss@test.com"
        And I fill in "admin_password" with "password"
        And I press "Log in"
        Given I am on the admin dashboard page
        Then I should see "Alice1"
        Then I should see "Valid"
