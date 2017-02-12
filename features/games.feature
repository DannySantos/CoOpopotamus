Feature: Games

  Scenario: A user browses paginated unmarked games
    Given there are some games
      And they are on the unmarked games index page
    Then they see a list of unmarked games
      And they see the first page pagination links
      
  Scenario: A user browses page 2 of unmarked games
    Given there are some games
      And they are on the unmarked games index page
    When they click on "Next"
    Then they see page two of unmarked games
      And they see the second page pagination links
      
  Scenario: A user marks a game as played
    Given a user has previously registered
      And they have signed in previously
      And there are some games
      And they are on the unmarked games index page
    When they mark a game as played
    Then the game is marked as played

  @wip
  Scenario: A user doesn't see marked games on the unmarked games list
    Given a user has previously registered
      And they have signed in previously
      And there are some games
      And they are on the unmarked games index page
      And they have previously marked a game
    Then they should only see unmarked games