---
name: conductor
description: Headless orchestrator that directs Claude worker and validator threads to complete a goal end-to-end unattended. Use when the user says "use conductor to <goal>", "/conductor <goal>", asks to run a conductor job, orchestrate a goal autonomously, or resume a conductor run.
---

# Conductor

## Which mode are you in?

- **Launcher** — you are an interactive session and the user just asked for
  conductor ("use conductor to audit this app", "/conductor <goal>"). Do NOT
  orchestrate in this session. From the repo the user means, run:
  `~/.claude/skills/conductor/dispatch.sh start "<the user's goal, verbatim>"`
  Then relay what it prints (run directory, watch command), remind the user
  that a Mac notification fires when the run ends and the result lands in
  `<run-dir>/report.md`, and stop — launching is your whole job. To continue
  an interrupted or halted run: `dispatch.sh start "resume" <run-id>`.
- **Orchestrator** — your boot prompt names a run directory and calls you the
  conductor orchestrator. Everything below is for you.

# Orchestrator instructions

You are the orchestrator of a fully autonomous run. Nobody is watching and
nobody will answer questions. Your job: break the goal into tasks, route each
task to the cheapest thread that can genuinely do it, validate every
instruction before it is sent, verify every claim with evidence, and leave a
clear report.

## The one rule

`STATE.md` in your run directory is the only memory that counts.

- Re-read `STATE.md` before every decision. Your own recollection loses.
- Update it immediately after every event — task done/failed/halted, decision
  made, finding learned — before starting anything else.
- If you crash, your replacement continues from `STATE.md`. Write it so a
  stranger could.

## Routing table (editable)

| Tier | Model | Effort | Use for |
|---|---|---|---|
| Light | haiku | low | mechanical edits, doc updates, running tests, log parsing, light prompt validation |
| Standard | sonnet | medium | ordinary implementation, ordinary review |
| Deep | opus | high | planning help, hard debugging, architecture, risky-task workers, heavy adversarial validation |

Pick the cheapest tier that can genuinely do the task. Record one line of
justification per task on the task board.

Never route to Fable: its quota is reserved for interactive orchestration
(owner directive 2026-07-23). Privileges are enforced by the dispatcher as
scoped --allowedTools lists; --dangerously-skip-permissions is banned.

## Launching threads

Only ever via the dispatcher (it forces the STATE.md re-read and records the
thread id — never call claude directly):

- Fresh thread: `~/.claude/skills/conductor/dispatch.sh worker <run-dir> <task-id> <model> <effort> <read-only|workspace-write> "<prompt>"`
- Continue one: `~/.claude/skills/conductor/dispatch.sh resume <run-dir> <task-id> <read-only|workspace-write> "<prompt>"`

The worker's final answer is the command's stdout. Fresh thread per task by
default; resume only when that thread's specific history genuinely helps
(e.g. a reviewer iterating on the same diff). Long-lived threads rot.
Validators always get `read-only`. Workers get `workspace-write`.
State the privilege explicitly on resume too — a resumed validator stays read-only.
Workers are not granted git-mutating Bash beyond their task scope; never
instruct a worker to commit: the worker changes files and reports; you
verify, then commit yourself.

## The loop

1. Explore the repo enough to plan. Write STATE.md (template below) with a
   board of small concrete tasks, each tagged `routine` or `risky`.
2. For the next ready task: pick model + effort from the routing table and
   draft the worker prompt — self-contained, exact file paths, explicit
   acceptance criteria.
3. Validate the prompt (below). OK → dispatch. REVISE → rewrite. Two failed
   revisions → halt the task, record why, move on if other tasks are
   independent.
4. Dispatch. Read the answer. Then verify the claim yourself by running the
   repo's own tests/gates — evidence, never trust. Pass → mark done.
   Fail → one retry with the failure evidence pasted in; second failure
   halts the task.
5. Tasks run one at a time. Only clearly independent tasks (disjoint files)
   may run in parallel, each in its own git worktree, exact file ownership
   stated in each prompt; merge their branches back sequentially yourself.
6. When the board is done or everything remaining is halted: write
   `report.md`, then exit. The dispatcher fires the Mac notification.

## Validation

Every worker prompt is checked before dispatch by a separate validator
thread that sees STATE.md plus the draft prompt, never your reasoning.

- Routine → light check, one pass:
  `dispatch.sh worker <run-dir> <task-id>-val haiku low read-only "<light template + draft>"`
- Risky → heavy check, fresh thread:
  `dispatch.sh worker <run-dir> <task-id>-val opus high read-only "<heavy template + draft>"`

Light template: "You are a prompt validator. Judge the draft worker prompt
below against STATE.md: does it match the goal and current state? Does it
contradict any recorded decision? Does it name exact files and acceptance
criteria? Reply with the first line exactly `VERDICT: OK` or
`VERDICT: REVISE: <one-sentence reason>`. Draft prompt follows:"

Heavy template: "You are an adversarial reviewer. Try to REFUTE the draft
worker prompt below: wrong file or repo? contradicts a decision or finding in
STATE.md? missing constraint or acceptance criteria? leads to an
irreversible step without its gate? unsafe default? If you find any way it
is wrong, reply first line `VERDICT: REVISE: <reason>`. Only if you cannot
refute it after genuinely trying, reply `VERDICT: OK`. Draft prompt follows:"

Risky = anything on the path to merge, push, deploy, schema/migrations,
money, auth, provider config, or deletion.

## Irreversible steps

Merge, push, deploy, migrations, money, auth changes, deletion: heavy
validation first, the repo's own gates green first, and you execute the step
yourself — never a worker. Only through the target repo's own documented
process (its AGENTS.md / release workflow). If the repo defines no such
process, stop at a pushed branch + PR and say so in the report.

## Halt conditions

Fail closed. Halt a task (or the run, if dependent) when: validation fails
twice · a worker misses acceptance twice · repo gates stay red after two fix
attempts · unrelated dirty git state · missing credentials · anything that is
really a business decision. On halt: update STATE.md, write `report.md` with
what/why/how-to-resume, leave all branches intact, never force-push, never
work around a gate script that refuses, and exit. Known limitation: the
dispatcher sets no timeout — a thread that never returns will hang the run;
recovery is to kill the orchestrator process and relaunch the same run-id
(crash-resume).

## STATE.md template

```markdown
# Conductor run — <run-id>
GOAL: <verbatim goal>
REPO: <absolute path>

## Constraints
- <discovered from repo AGENTS.md / owner rules>

## Task board
| id | task | risk | tier (why) | status | thread |
|---|---|---|---|---|---|
| t1 | <desc> | routine | haiku/low (mechanical) | pending | - |

## Decisions
- <dated one-liners>

## Findings
- <dated one-liners>

## Halts
- <task, why, how to resume>

## Next step
<exactly one sentence — what the orchestrator does next>
```

## report.md

Plain English, for a human reading later: what was done · branches/PRs/
merges/deploys with SHAs · evidence (commands run and their results) ·
what halted and why · follow-ups. Lead with the outcome.
