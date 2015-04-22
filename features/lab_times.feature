Feature: View Lab Times

    As a TA or Administrator
    I want to view the current list of labs

Background: admin added to database
    Given the following Lab Assistant exists:
    | first_name | last_name | email            | password | validated |
    | Alice1     | Assistant | labass1@test.com | password | true      |

    Given the following admin exists:
    | first_name   | last_name | email            | password  |
    | admin        | last      | bigboss@test.com | password  |

    Given a lab time exists

    Scenario: Modify Individual Lab
        Given I am on the first lab time page
        And I select labass1@test.com from the list
        And I press Assign LA
        Then I should see labass1@test.com on the page