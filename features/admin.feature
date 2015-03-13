Feature: Admin Login

    In order save my details
    As a user
    I want to be able to log into the site

    Given the following admin exists:
    | first_name   | last_name | email            | password  |
    | admin        | 1         | bigboss@test.com | password  |

    Scenario: Log into site
        Given I am on the admin login page
        And I fill in "admin_email" with "bigboss@test.com"
        And I fill in "admin_password" with "password"
        When I press "Log in"
        Then I am on the admin dashboard page

    Scenario: Log into site with incorrect login
        Given I am on the admin login page
        And I fill in "admin_email" with "test@example.com"
        And I fill in "admin_password" with "incorrect_password"
        When I press "Log in"
        Then I should see 'Invalid login' on the page

    Scenario: Forgot my password
        Given I am on the admin login page
        When I follow "Forgot your password?"
        Then I should be on the forgot password page

    Scenario: Reset password
        Given I am on the forgot password page
        And I fill in "admin_email" with "bigboss@test.com"
        When I press "Send me reset password instructions"
        Then I should receive an email

    Scenario: Reset password bad email
        Given I am on the forgot password page
        And I fill in "admin_email" with "bademail@example.com"
        When I press "Send me reset password instructions"
        Then I should get an Email Not Found error