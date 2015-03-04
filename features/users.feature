Feature: User Login
	In order save my details
	As a user
	I want to be able to log into the site

	Scenario: Log into site
	    Given I am at the homepage
	    And have entered 'test@example.com' into the email field
	    And I have entered 'testpassword' into the password field
	    When I press login
	    Then I should be at my profile

	Scenario: Log into site with incorrect login
        Given I am at the homepage
        And I have entered 'test@example.com' into the email field
        And I have entered 'incorrectpassword' into the password field
        When I press login
        Then I should see 'Invalid login' on the page

	Scenario: Forgot my password
        Given I am at the homepage
        When I press Forgot your password
        Then I should be at the Forgot password page

	Scenario: Reset password
        Given I am at the Forgot password page
        And I have entered 'test@example.com' into the email field
        When I press send reset instructions
        Then I should receive an email

	Scenario: Reset password bad email
        Given I am at the Forgot password page
        And I have entered 'bademail@example.com' into the email field
        When I press send reset instructions
        Then I should not receive an email