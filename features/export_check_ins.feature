Feature: Export Check Ins as CSV

    In order to figure out which lab assistants should get units
    As an admin
    I want to be able to export the check ins database as a csv file for analysis

Background: admin added to database

    Given the following admin exists:
    | first_name   | last_name | email            | password  |
    | admin        | 1         | bigboss@test.com | password  |

    Scenario: Export data from admin panel
        Given I am on the admin login page
        And I fill in "admin_email" with "bigboss@test.com"
        And I fill in "admin_password" with "password"
        When I press "Log in"
        Then I am on the admin dashboard page
        When I press "Export Check Ins as CSV"
        Then I should download a file with the name "check_ins" that has the extension "csv"
