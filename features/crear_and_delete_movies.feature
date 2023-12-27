Feature: Movie management
  Scenario: Creating a new movie
    Given I am on the Add new movie page
    When I fill in "Title" with "Inception"
    And I select "PG-13" from "Rating"
    And I select "2023" from "movie_release_date_1i"
    And I select "April" from "movie_release_date_2i"
    And I select "16" from "movie_release_date_3i"
    And I press "Save Changes"
    Then I should see "Inception was successfully created."
    And I should be on the All Movies page
    And I should see "Inception"

  Scenario: Deleting a movie
    Given the following movies exist:
        | title     | rating | release_date | director |
        | Inception | PG-13  | 2010-07-16   | Nolan    |
    And I am on the details page for "Inception"
    When I follow "Delete"
    Then show me the page
    Then I should see "Movie 'Inception' deleted."
    And I should be on the All Movies page
    And I should not see "Inception"

