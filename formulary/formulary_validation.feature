Feature: Formulary and Drug Coverage Rules

  Scenario: Tier 1 drug has lowest copay
    Given the drug is in Tier 1
    When the claim is processed
    Then the copay should be "$10"

  Scenario: Tier 2 drug has moderate copay
    Given the drug is in Tier 2
    When the claim is processed
    Then the copay should be "$25"

  Scenario: Tier 3 drug has highest copay
    Given the drug is in Tier 3
    When the claim is processed
    Then the copay should be "$50"

  Scenario: Step therapy requirement not met
    Given the drug requires step therapy
    And the member has no prior drug history
    When the claim is processed
    Then the claim should be rejected with code "75"

  Scenario: Step therapy requirement already met
    Given the member has completed the required prior therapy
    When the claim is submitted
    Then the claim should be approved

  Scenario: Generic available but brand requested
    Given a generic equivalent is available
    When the brand drug is submitted
    Then a higher copay should be applied

  Scenario: Drug is excluded from coverage
    Given the drug is excluded under the plan
    When the claim is processed
    Then the claim should be rejected with code "70"

  Scenario: Preventive drug covered at zero cost
    Given the drug is classified as preventive
    When the claim is processed
    Then the copay should be "$0"