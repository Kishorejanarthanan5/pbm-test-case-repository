# PBM Test Case Repository (BDD / Gherkin)

## Overview

This repository contains real-world test scenarios for Pharmacy Benefit Management (PBM) systems written in Gherkin (BDD) format.

The scenarios are based on actual claim adjudication workflows and cover core modules used in enterprise healthcare systems.

---

## Modules Covered

* Member Eligibility Verification
* Claims Adjudication
* Formulary Validation
* Prior Authorization (PA)
* Coordination of Benefits (COB)

---

## Repository Structure

```
eligibility/        -> Member eligibility scenarios  
claims/             -> Claim adjudication scenarios  
formulary/          -> Drug coverage and tier logic  
prior_auth/         -> Prior authorization validations  
cob/                -> Coordination of benefits scenarios  
test-data/          -> Sample claim input data  
docs/               -> PBM logic explanation and flow diagram  
```

---

## Key PBM Concepts Covered

* NCPDP Reject Codes:

  * 70 → Drug not covered
  * 75 → Prior Authorization required
  * 76 → Quantity / Days supply exceeded
  * 79 → Duplicate claim / Refill too soon
  * 007 → Member not eligible

* Pricing Logic:

  * AWP (Average Wholesale Price)
  * MAC (Maximum Allowable Cost) override
  * Copay based on formulary tier

* Coverage Rules:

  * Step therapy validation
  * Generic substitution
  * Preventive drug coverage

* Claims Processing:

  * Eligibility validation
  * Plan limit checks
  * Duplicate and refill timing validation

* COB (Coordination of Benefits):

  * Primary and secondary payer flow
  * Balance calculation
  * Payer sequencing

---

## Sample Scenario

```gherkin
Scenario: Refill attempted too soon
  Given the member has already filled the same drug recently
  And the next refill is not yet due based on days supply
  When a new claim is submitted
  Then the claim should be rejected as refill too soon with code "79"
```

---

## Additional Artifacts

* Sample claim request data available in `test-data/sample-claim.json`
* PBM adjudication logic explained in `docs/pbm-logic-explanation.md`
* Claim adjudication flow diagram available below

---

## Why This Repository

Most automation portfolios focus only on tools like Selenium or API testing.

This repository focuses on:

* Real-world PBM domain scenarios
* Strong test design thinking
* Backend claim adjudication logic
* Business-readable BDD scenarios

---

## How This Can Be Used

* Manual test case design
* BDD automation (Cucumber)
* API testing (claims adjudication systems)
* Requirement validation and client discussions

---

## Author

Senior QA Engineer with 6+ years of experience in PBM domain, specializing in claims adjudication, benefit validation, and production issue analysis.

---

## Future Enhancements

* Convert scenarios into API automation using RestAssured
* Integrate with Cucumber framework
* Add request/response validation for claims processing

---

## Claim Adjudication Flow

Visual representation of claim processing:

👉 [View Claim Adjudication Flow](docs/claim-adjudication-flow.md)
