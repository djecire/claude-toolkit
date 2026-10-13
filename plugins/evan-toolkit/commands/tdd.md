---
description: Use a focused red-green-refactor cycle for the behavior the user asks to implement or fix.
---

Apply TDD to `$ARGUMENTS` using the repository's established test runner and fixtures. Inspect the changed behavior and required checks first. Write a focused failing behavioral test, confirm the relevant failure, implement the smallest fix, and run that test again. Refactor only within scope while keeping it green.

Cover the boundaries that matter to the changed behavior: authorization, invalid inputs, error paths, transactions, concurrency, and money calculations when applicable. Prefer tests that execute public behavior or real SQL over source-text assertions. Preserve required independent high-risk review and release gates.

Use the repository's actual coverage policy; do not invent an 80% threshold, a test for every public function, or a universal E2E requirement. Do not introduce tests for documentation-only work or simple reversible edits that do not benefit from them. Hosted E2E and external writes require the user's authorization and a verified target.

Reuse successful checks for unchanged code and base. Repeat only after a relevant change, a failure, an unresolved risk, or a mandatory gate. Report the changed behavior, checks actually run, and any unmet requirement. No missing tdd-workflow skill or extra agent is required.
