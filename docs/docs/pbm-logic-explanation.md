# PBM Adjudication Logic Overview

## Eligibility Check
Before processing a claim, the system verifies:
- Member is active
- Coverage dates are valid
- Dependent is linked correctly (if applicable)

## Claims Adjudication Flow
1. Check member eligibility
2. Validate drug against formulary
3. Check prior authorization requirements
4. Validate plan limits (quantity, days supply)
5. Check duplicate or refill timing
6. Apply pricing logic (AWP / MAC)
7. Apply copay based on drug tier
8. Finalize claim as paid or rejected

## Common Reject Codes
- 70 → Drug not covered under formulary
- 75 → Prior Authorization required
- 76 → Quantity or days supply exceeded
- 79 → Duplicate claim or refill too soon
- 07 → Member not eligible

## Pricing Logic
- AWP (Average Wholesale Price) used as base
- MAC (Maximum Allowable Cost) overrides AWP when available
- Copay is calculated based on formulary tier

## Prior Authorization
- Required for restricted drugs
- Can override plan limits if approved
- Must be valid and not expired

## Coordination of Benefits (COB)
- Primary insurance pays first
- Secondary insurance covers remaining eligible balance
- Proper payer sequence must be maintained