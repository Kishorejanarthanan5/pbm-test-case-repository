Feature: Claims Processing and Adjudication

  Scenario: Claim is paid for covered drug
    Given the member is eligible
    And the drug is covered under Tier 1
    When the pharmacy submits the claim
    Then the claim should be approved
    And the member should pay a copay of "$10"

  Scenario: Drug is not covered under formulary
    Given the drug is not part of the formulary
    When the claim is processed
    Then the claim should be rejected with code "70"

  Scenario: Duplicate claim submission
    Given a claim for the same member, drug, quantity, and fill date was already paid
    When the exact same claim is submitted again
    Then the claim should be rejected as duplicate with code "79"

  Scenario: Refill attempted too soon
    Given the member has already filled the same drug recently
    And the next refill is not yet due based on days supply
    When a new claim is submitted
    Then the claim should be rejected as refill too soon with code "79"

  Scenario: Quantity exceeds plan limit
    Given the plan allows a maximum quantity of 30
    When a claim is submitted with quantity of 90
    Then the claim should be rejected with code "76"

  Scenario: Days supply exceeds limit
    Given the plan allows a maximum days supply of 30
    When a claim is submitted for 60 days
    Then the claim should be rejected with code "76"

  Scenario: Invalid drug code is submitted
    Given the drug code is invalid
    When the claim is processed
    Then the claim should be rejected with code "25"

  Scenario: Pharmacy is not in network
    Given the pharmacy is not part of the network
    When the claim is submitted
    Then the claim should be rejected with code "05"

  Scenario: High cost drug approved with override
    Given the drug cost exceeds standard limits
    And a valid override is applied
    When the claim is processed
    Then the claim should be approved

  Scenario: Specialty drug processed correctly
    Given the drug is a specialty medication
    When it is processed through the appropriate specialty pharmacy
    Then the claim should be approved

  Scenario: Pricing calculated using AWP
    Given AWP pricing applies to the drug
    When the claim is processed
    Then the ingredient cost should be calculated based on AWP

  Scenario: MAC pricing overrides AWP
    Given a MAC price is available for the drug
    When the claim is processed
    Then the MAC price should be applied instead of AWP