Feature: Member Eligibility Check

  Scenario: Member is active and coverage is valid
    Given member "MBR001" is currently active
    And the coverage is valid as of today
    When eligibility is verified during claim processing
    Then the member should be considered eligible

  Scenario: Member coverage has ended
    Given member "MBR002" coverage ended on "2023-12-31"
    When a claim is submitted after the termination date
    Then the member should be considered ineligible
    And the claim should reject with code "007"

  Scenario: Coverage has not started yet
    Given member coverage starts on "2025-01-01"
    When a claim is submitted before the effective date
    Then the member should be considered ineligible

  Scenario: Member ID does not exist
    Given member ID "INVALID" is not present in the system
    When eligibility is checked
    Then the system should return member not found

  Scenario: Member has a gap in coverage
    Given there is a break between two coverage periods
    When a claim is submitted during the gap
    Then the member should be considered ineligible

  Scenario: Dependent is eligible under subscriber
    Given a dependent is linked to an active subscriber
    When eligibility is verified
    Then the dependent should be eligible

  Scenario: Member is suspended
    Given member status is suspended
    When a claim is submitted
    Then the claim should be rejected

  Scenario: Member is reactivated
    Given member was reactivated today
    When eligibility is checked
    Then the member should be considered eligible