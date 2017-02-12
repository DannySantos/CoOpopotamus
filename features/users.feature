Feature: Users

  Scenario: A user registers
    Given they are on the registration page
    When they fill in the user registration form
    Then a user should be created
  
  Scenario: A user signs in
    Given a user has previously registered
      And they are on the sign in page
    When they fill in the sign in form
    Then they are signed in
  
  Scenario: A user signs out
    Given a user has previously registered
      And they have signed in previously
      And they are on the home page
    When they click on "Sign out"
    Then they are signed out