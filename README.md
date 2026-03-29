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

## Key PBM Concepts Included

* NCPDP Reject Codes (70 – Non-formulary, 75 – PA required, 76 – Plan limits, 79 – Refill too soon)
* AWP (Average Wholesale Price) & MAC (Maximum Allowable Cost) pricing logic
* Copay tiering (Tier 1, 2, 3)
* Step therapy validation
* Prior authorization workflows
* COB sequencing and balance calculation

---

## Repository Structure

```
eligibility/        -> Member eligibility scenarios  
claims/             -> Claim adjudication scenarios  
formulary/          -> Drug coverage and tier logic  
prior_auth/         -> Prior authorization validations  
cob/                -> Coordination of benefits scenarios  
```

---

## Sample Scenario (Claims)

```gherkin
Scenario: Refill attempted too soon
  Given the member has already filled the same drug recently
  And the next refill is not yet due based on days supply
  When a new claim is submitted
  Then the claim should be rejected as refill too soon with code "79"
```

---

## Why This Repository

Most automation portfolios focus only on tools like Selenium or API testing.

This repository demonstrates:

* Strong PBM domain knowledge
* Real-world test design thinking
* Understanding of backend claim adjudication logic
* Ability to write meaningful and business-relevant test scenarios

---

## How This Adds Value

These scenarios can be directly used for:

* Manual test case design
* BDD automation (Cucumber)
* API validation (claims processing systems)
* Client requirement validation

---

## Author

Senior QA Engineer with 6+ years of experience in PBM domain, specializing in claims adjudication, benefit validation, and production issue analysis.

---

## Future Enhancements

* Convert scenarios into API automation using RestAssured
* Integrate with Cucumber framework
* Add sample request/response payload validation
