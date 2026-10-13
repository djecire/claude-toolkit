---
description: Produce a scoped implementation plan with risks, required checks, and a clear stopping point.
---

Plan `$ARGUMENTS` from the current request, applicable instructions, and relevant repository evidence. Do the planning directly; no planner agent or extra planning skill is required.

State the intended outcome, the smallest coherent change, material risks, dependencies, required verification, and what is out of scope. Ask only when a missing decision affects product behavior, scope, or authorization. Use current project rules for independent review of authentication, authorization, schema/migration, concurrency, and money changes.

A plan-only request ends with the plan and does not authorize implementation. If the user already requested implementation as well, continue within that authorization once required technical review is satisfied; do not impose a second ritual approval for the same technical choice. Technical approval never authorizes commits, pushes, production changes, messages, payments, or destructive actions beyond the user's actual request.

Keep the plan inline unless an artifact was requested or materially helps the authorized work. Stop at the requested outcome.
