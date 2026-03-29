Feature: Prior Authorization Handling

  Scenario: Valid prior authorization allows claim
    Given a valid prior authorization exists for the drug
    When the claim is submitted
    Then the claim should be approved

  Scenario: Prior authorization is required but missing
    Given the drug requires prior authorization
    And no authorization exists
    When the claim is processed
    Then the claim should be rejected with code "75"

  Scenario: Prior authorization is expired
    Given the prior authorization has expired
    When the claim is submitted
    Then the claim should be rejected

  Scenario: Prior authorization overrides quantity limit
    Given prior authorization allows higher quantity
    When the submitted quantity exceeds standard limit
    Then the claim should be approved

  Scenario: Prior authorization allows extended days supply
    Given prior authorization allows extended days supply
    When the claim is submitted
    Then the claim should be approved

  Scenario: Invalid prior authorization reference
    Given the authorization ID is incorrect
    When the claim is processed
    Then the claim should be rejected

  Scenario: Authorization exists for a different drug
    Given the authorization is approved for another drug
    When the claim is submitted
    Then the claim should be rejected

  Scenario: Emergency override is applied
    Given an emergency override is present
    When the claim is processed
    Then the claim should be approved