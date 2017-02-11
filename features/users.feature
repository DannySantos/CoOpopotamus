Feature: users

  Scenario: A user registers
    Given they are on the registration page
    When they fill in the "user_email" field with "test@test.com"
      And they fill in the "user_password" field with "password"
      And they fill in the "user_password_confirmation" field with "password"
      And they click on "Sign up"
    Then a user should be created
    
  Scenario: A user signs in
    Given a user has previously registered
      And they are on the log in page
    When they fill in the "user_email" field with "test@test.com"
      And they fill in the "user_password" field with "password"
      And they click on "Log in"
    Then they are logged in
    
  Scenario: A user signs out
    Given a user has previously registered
      And they have signed in previously
      And they are on the home page
    When they click on "Sign out"
    Then they should see a farewell message
