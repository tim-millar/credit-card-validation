Feature: Credit Card Validation
  As a user
  I want to validate credit card numbers

  Scenario: User validates a Visa card type and valid number
    Given I run `credit_card_validation '4408 0412 3456 7893'`
    Then the output should contain "Visa"
    And the output should contain "Valid"

  Scenario: User validates an unknown type and invalid number
    Given I run `credit_card_validation '3117-1234-5678-9112'`
    Then the output should contain "Unknown"
    And the output should contain "Invalid"
