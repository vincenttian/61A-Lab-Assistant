Feature: Lab Assistant sign up
        In order to create an account
        As a Lab Assistant
        I want to be able to make an account
 
        Scenario: Sign up page
                Given I am at the sign up page
                And I have entered 'Alice' into the firstname field
                And I have entered 'Smith' into the lastname field
                And I have entered '12345678' into the ID field
                And have entered 'test@example.com' into the email field
                And I have entered 'testpassword' into the password field
                When I press register
                Then I should see a confirmation
 
        Scenario: Invalid sign up (blank field)
                Given I am at the sign up page
                And I have entered 'Alice' into the firstname field
                And I have entered '' into the lastname field
                And I have entered '12345678' into the ID field
                And have entered 'test@example.com' into the email field
                And I have entered 'testpassword' into the password field
                When I press register
                Then I should see a blank field error message
 
        Scenario: Invalid sign up (invalid email)
                Given I am at the sign up page
                And I have entered 'Alice' into the firstname field
                And I have entered 'Smith' into the lastname field
                And I have entered '12345678' into the ID field
                And have entered 'foobarexample.com' into the email field
                And I have entered 'testpassword' into the password field
                When I press register
                Then I should see a invalid email error message
 
        Scenario: Invalid sign up (invalid ID)
                Given I am at the sign up page
                And I have entered 'Alice' into the firstname field
                And I have entered 'Smith' into the lastname field
                And I have entered '12345' into the ID field
                And have entered 'foobarexample.com' into the email field
                And I have entered 'testpassword' into the password field
                When I press register
                Then I should see a invalid ID error message
 
        Scenario: Invalid sign up (Multiple error messages)
                Given I am at the sign up page
                And I have entered '' into the firstname field
                And I have entered 'Smith' into the lastname field
                And I have entered '12345' into the ID field
                And have entered 'foobarexample.com' into the email field
                And I have entered 'testpassword' into the password field
                When I press register
                Then I should see a blank field error message
                And I should see a invalid ID error message
                And I should see a invalid email error message