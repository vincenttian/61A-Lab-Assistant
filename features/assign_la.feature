Feature: Assign Lab Assistants
    In order to assign Lab Assistants to section
    As an Admin
    I want to push a button that assigns all Lab Assistants

Background: admin and LAs added to database
    
    Given the following Lab Assistant exists:
    | first_name | last_name | email            | password | validated |  SID      | Assignment |
    | Alice1     | Assistant | labass1@test.com | password | true      | 12345670  | Nil        |
    | Bob2       | Assistant | labass2@test.com | password | false     | 12345671  | Nil        |
    | Claire3    | Assistant | labass3@test.com | password | false     | 12345672  | Nil        |
    | Dylan4     | Assistant | labass4@test.com | password | false     | 12345673  | Nil        |

    Given the following admin exists:
    | first_name   | last_name | email             | password  |
    | admin        | 1         | bigboss1@test.com | password  |

    Given the following Teaching Assistant exists:
    | first_name   | last_name | email            | password  | validated |
    | teach        | er        | bigboss@test.com | password  | true      |

    Given the following lab times exists:
    | open      | close    |  day        |
    | 8:00:00   | 9:00:00  |  Monday     |
    | 9:00:00   | 10:00:00 |  Tuesday    |
    | 10:00:00  | 11:00:00 |  Wednesday  |
    | 14:00:00  | 16:00:00 |  Thursday   |

    Scenario: All LAs are unassigned
        Given I am on the teaching assistant assignment page
        And I select all Lab Assistants
        And I press "Assign Lab Assistants"
        Then I should not see any unassigned lab assistants
        And I should not see any unassigned lab times

    Scenario: Some LAs are unassigned
        Given I am on the teaching assistant assignment page
        And I select unassigned Lab Assistants
        And I press "Assign Lab Assistants"
        Then I should not see any unassigned lab assistants
        And I should not see any unassigned lab times