Feature: Coordination of Benefits Processing

  Scenario: Secondary payer processes remaining balance
    Given the primary insurance has paid "$50"
    When the secondary claim is processed
    Then the remaining balance should be calculated correctly

  Scenario: Missing other insurance information
    When a claim is submitted without primary payer details
    Then the claim should be rejected with code "22"

  Scenario: Secondary payment exceeds remaining balance
    Given the remaining balance is "$20"
    When the secondary payer submits a higher amount
    Then the payment should be limited to the remaining balance

  Scenario: Duplicate COB claim submission
    Given the same COB claim was already processed
    When it is submitted again
    Then the claim should be rejected

  Scenario: Incorrect payer sequence
    Given the payer sequence is incorrect
    When the claim is processed
    Then the claim should be rejected

  Scenario: Member has dual active coverage
    Given the member has two active insurance coverages
    When the claim is processed
    Then coordination of benefits should be applied correctly