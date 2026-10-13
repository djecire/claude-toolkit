---
name: verification-loop
description: Verify a requested change or readiness claim using the repository checks required for the actual diff. Use for substantive verification; do not start recurring checks or a full suite merely because several files changed.
metadata:
  origin: ECC
---

Determine the requested outcome, actual diff/base, applicable repository instructions, and available verification evidence. Choose the smallest set of checks that can establish correctness for the changed behavior, plus every mandatory project or release gate.

- Run focused behavioral tests for changed logic. Use established fixtures and database replay patterns when applicable.
- Run typecheck, lint, build, broader tests, or coverage when the touched surface or repository policy requires them. Use the project's actual commands and coverage thresholds.
- Preserve required independent review and authorization, security, financial, migration, concurrency, and data-integrity checks. Never skip a mandatory gate for usage savings.
- Inspect the diff for unintended changes. When checking secrets, report only redacted locations/categories; never print matched credential values or populated environment files.
- Preserve command exit status. Do not pipe a check into head/tail and infer success from the pipeline's final command.

Reuse a successful check for unchanged code and base unless an existing release policy requires a fresh run. Repeat only after a relevant change, failure, new risk, or mandatory requirement. Do not run on a timer, after every function, or as an unrequested continuous mode.

Read-only audits report findings without fixing them. Hosted E2E, production actions, pushes, deployments and other external writes require authorization and a verified target. A green local check is not evidence of a completed deployment.

Report the checks actually executed and their results, reused evidence with its revision/scope, and anything required but not run. Do not label an omitted check as passed. Stop once the requested verification is complete.
