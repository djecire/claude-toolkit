---
description: Create or update a concise session handoff for a fresh Claude session
argument-hint: [optional focus]
disable-model-invocation: true
---

Create or overwrite `HANDOFF.md` in the current project. Keep it between 150 and 300 words and include only:

1. Objective and optional focus: `$ARGUMENTS`
2. Verified current state
3. Files changed and current commit or branch
4. Decisions and brief reasons
5. Commands run and exact test results
6. Risks, blockers, and unresolved questions
7. The exact next command or action

Do not copy the transcript, speculate, or claim unverified state. Re-read the relevant files and Git status before writing the handoff.
