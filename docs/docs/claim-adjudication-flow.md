# Claim Adjudication Flow

```mermaid
flowchart TD

A[Claim Submitted] --> B[Check Member Eligibility]

B -->|Eligible| C[Check Formulary]
B -->|Ineligible| R1[Reject 007]

C -->|Covered| D[Check Prior Authorization]
C -->|Not Covered| R2[Reject 70]

D -->|PA Missing| R3[Reject 75]
D -->|Valid| E[Check Quantity / Days Supply]

E -->|Exceeded| R4[Reject 76]
E -->|Valid| F[Check Duplicate / Refill Timing]

F -->|Duplicate| R5[Reject 79]
F -->|Refill Too Soon| R6[Reject 79]
F -->|Valid| G[Apply Pricing]

G --> H[AWP / MAC Calculation]
H --> I[Apply Copay Tier]

I --> J[Claim Approved]

R1 --> END
R2 --> END
R3 --> END
R4 --> END
R5 --> END
R6 --> END
J --> END