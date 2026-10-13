---
name: codex-plan-review
description: Run a bounded adversarial review of an implementation plan by driving `codex exec` directly, with Codex as a read-only critic. Self-contained — it does NOT use the claudex-loop runner, does not build, and does not cross-inspect code. Use when the user requests Codex plan review or this project's high-risk review policy calls for it. Not a required workflow for routine edits. For the multi-phase plan-harden-then-build-and-cross-inspect workflow, use claudex-loop instead.
---

Claude prepares or reads the plan; Codex reviews it independently without write access. Honor the user's scope, current project instructions, and explicit model choice. Use available model controls according to current user routing and task risk; do not assume a legacy model ID or install a CLI upgrade as a prerequisite.

Use an existing plan when provided. Keep task-specific review artifacts in a private temporary directory or an authorized task artifact directory, not shared fixed /tmp filenames. Never overwrite an existing plan or review log from another task. Do not copy credentials or create an isolated credential home. Reuse existing version/capability evidence; otherwise inspect `codex --version` and relevant `--help`. No paid smoke prompt is required.

Set MAX_ROUNDS from the user's argument, default 3. A round is a review plus any resulting plan revision. Ask Codex to identify concrete correctness, security, data-integrity, concurrency, and rollback defects, distinguish uncertainty, and finish with `VERDICT: APPROVED` or `VERDICT: REVISE`. Read the actual critique; a marker alone does not establish a sound plan.

For the first review, use `codex exec --sandbox read-only --json --output-last-message <task-verdict-file> -` with the prepared prompt on stdin. Record the returned thread ID only after a successful command. For later rounds, resume that exact review using `codex exec resume <thread-id> -c 'sandbox_mode="read-only"' --json --output-last-message <task-verdict-file> -`. The local resume command does not accept `--sandbox`; the explicit configuration override preserves read-only operation. Never use an approval/sandbox bypass to make a review run.

Use unique verdict/event/error files per round so a failed command cannot reuse a stale verdict. Check the process exit code and current round's response. Keep diagnostic output private and redact it before presenting errors. Stop on authentication, usage-limit, model-access, or tooling failure; do not retry repeatedly, refresh/copy credentials, or substitute an unapproved service.

Record each substantive finding, the plan revision or reason for rejecting it, and remaining disagreements. Reuse settled evidence for unchanged parts of the plan. Re-review only changed or unresolved issues. Stop when approved or MAX_ROUNDS is reached; do not declare approval at the cap if defects remain. Surface unresolved consequential risk for the appropriate decision-maker.

For a plan-review-only request, deliver the reviewed plan and outcome, then stop. If implementation was already requested, required technical approval plus Claude's evidence-based concurrence permits continuation only within that existing authorization. Do not ask for the same technical approval again. Neither a reviewer verdict nor a skill grants authority for commits, pushes, production changes, external messages, payments, credential changes, or destructive actions.

Do not use this plan workflow to review an existing code diff; perform the requested code review using the available tools instead.

The `claudex-loop` plugin (Chase AI) is installed and ships its own `claudex-loop:codex-review`, which is a shim into the claudex-loop runner. This skill is the separate, self-contained one: it calls `codex exec` directly and has no runner dependency. Do not mix the two in one task — pick one and say which. grill-me-codex is not installed and never was.
