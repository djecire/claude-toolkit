#!/usr/bin/env bash
# conductor dispatch — all plumbing for conductor runs (Claude Code backend).
# Judgment lives in SKILL.md; this script only makes every thread launch identical.
set -euo pipefail

RUNS_ROOT="${CONDUCTOR_RUNS_ROOT:-$HOME/.claude/conductor/runs}"
ORCH_MODEL="${CONDUCTOR_ORCH_MODEL:-opus}"
ORCH_EFFORT="${CONDUCTOR_ORCH_EFFORT:-high}"
SKILL_DIR="$(cd "$(dirname "$0")" && pwd)"
SKILL_MD="$SKILL_DIR/SKILL.md"
DRY_RUN=0
RO_TOOLS="Read Grep Glob"
RW_TOOLS="Read Grep Glob Edit Write Bash"

usage() {
  cat >&2 <<'USAGE'
usage:
  dispatch.sh [--dry-run] start "<goal>" [run-id]
  dispatch.sh [--dry-run] worker <run-dir> <task-id> <model> <effort> <read-only|workspace-write> "<prompt>"
  dispatch.sh [--dry-run] resume <run-dir> <task-id> <read-only|workspace-write> "<prompt>"
USAGE
  exit 2
}

die() { printf 'conductor: %s\n' "$*" >&2; exit 1; }

preamble() {
  printf 'Read %s/STATE.md before doing anything else. It is the single source of truth for this run; if anything you believe conflicts with it, STATE.md wins.\n\n' "$1"
}

# notify bodies must be internal strings only (run-id/paths) — never goal or model text.
notify() { # $1 = body
  command -v osascript >/dev/null 2>&1 || return 0
  local body
  body="${1//\"/}"
  body="${body//\\/}"
  osascript -e "display notification \"$body\" with title \"conductor\"" >/dev/null 2>&1 || true
}

json_field() { # $1 json-file, $2 key → value or empty
  python3 -c 'import json,sys
try:
    d = json.load(open(sys.argv[1]))
    print(d.get(sys.argv[2], ""))
except Exception:
    pass' "$1" "$2"
}

run_claude() { # $1 run_dir, $2 task_id, $3 prompt, $4.. claude args
  local run_dir="$1" task_id="$2" prompt="$3"; shift 3
  local stamp log sid answer
  stamp="$(date +%Y%m%d-%H%M%S)"
  log="$run_dir/logs/$task_id-$stamp.json"
  if [ "$DRY_RUN" -eq 1 ]; then
    printf 'claude'; printf ' %s' -p "$@" --output-format json "$prompt"; printf '\n'
    return 0
  fi
  mkdir -p "$run_dir/logs" "$run_dir/threads"
  if ! claude -p "$@" --output-format json "$prompt" >"$log" 2>"$log.err" </dev/null; then
    die "claude call failed for task '$task_id' — see $log.err"
  fi
  sid="$(json_field "$log" session_id)"
  if [ -n "$sid" ]; then printf '%s\n' "$sid" >"$run_dir/threads/$task_id"; fi
  answer="$(json_field "$log" result)"
  [ -n "$answer" ] || die "empty result for task '$task_id' — see $log"
  printf '%s\n' "$answer"
}

cmd_worker() {
  [ $# -eq 6 ] || usage
  local run_dir="$1" task_id="$2" model="$3" effort="$4" sandbox="$5" prompt="$6" tools
  case "$sandbox" in
    read-only)       tools="$RO_TOOLS" ;;
    workspace-write) tools="$RW_TOOLS" ;;
    *) die "workers get read-only or workspace-write, never full access (got: $sandbox)" ;;
  esac
  # shellcheck disable=SC2086  # tools is a deliberate word list
  run_claude "$run_dir" "$task_id" "$(preamble "$run_dir")$prompt" \
    --model "$model" --effort "$effort" --allowedTools $tools
}

cmd_resume() {
  [ $# -eq 4 ] || usage
  local run_dir="$1" task_id="$2" sandbox="$3" prompt="$4" sid tools
  case "$sandbox" in
    read-only)       tools="$RO_TOOLS" ;;
    workspace-write) tools="$RW_TOOLS" ;;
    *) die "resumed threads get read-only or workspace-write, never full access (got: $sandbox)" ;;
  esac
  [ -f "$run_dir/threads/$task_id" ] || die "no recorded thread for task '$task_id' in $run_dir/threads/"
  sid="$(cat "$run_dir/threads/$task_id")"
  # shellcheck disable=SC2086  # tools is a deliberate word list
  run_claude "$run_dir" "$task_id" "$(preamble "$run_dir")$prompt" \
    --resume "$sid" --allowedTools $tools
}

cmd_start() {
  [ $# -ge 1 ] && [ $# -le 2 ] || usage
  local goal="$1" run_id="${2:-$(date +%Y%m%d-%H%M%S)}"
  local run_dir="$RUNS_ROOT/$run_id" mode boot
  mode="a new run"
  [ -f "$run_dir/STATE.md" ] && mode="a resume of an interrupted run — read STATE.md and do NOT redo tasks it marks done"
  boot="You are the conductor orchestrator for $mode.
Follow the skill instructions in $SKILL_MD exactly — read that file first, in full.
Your run directory (absolute): $run_dir
The target repo (launch directory): $PWD
Launch every worker and validator thread ONLY via $SKILL_DIR/dispatch.sh worker/resume — never call claude directly.
GOAL: $goal"
  if [ "$DRY_RUN" -eq 1 ]; then
    printf 'claude'
    # shellcheck disable=SC2086
    printf ' %s' -p --model "$ORCH_MODEL" --effort "$ORCH_EFFORT" \
      --allowedTools $RW_TOOLS --output-format json "$boot"
    printf '\n'
    return 0
  fi
  mkdir -p "$run_dir/logs" "$run_dir/threads"
  (
    rc=0
    # shellcheck disable=SC2086
    claude -p --model "$ORCH_MODEL" --effort "$ORCH_EFFORT" \
      --allowedTools $RW_TOOLS --output-format json "$boot" \
      >"$run_dir/logs/orchestrator.json" 2>"$run_dir/logs/orchestrator.err" </dev/null || rc=$?
    if [ -f "$run_dir/report.md" ]; then
      notify "Run $run_id finished — report ready: $run_dir/report.md"
    else
      notify "Run $run_id exited (rc=$rc) with NO report — check $run_dir/logs/"
    fi
  ) >/dev/null 2>&1 &
  printf 'conductor run started: %s\n' "$run_dir"
  printf 'watch:  tail -f %s/logs/orchestrator.json\n' "$run_dir"
  printf 'report: %s/report.md (when done)\n' "$run_dir"
}

[ "${1:-}" = "--dry-run" ] && { DRY_RUN=1; shift; }
[ $# -ge 1 ] || usage
cmd="$1"; shift
case "$cmd" in
  start)  cmd_start "$@" ;;
  worker) cmd_worker "$@" ;;
  resume) cmd_resume "$@" ;;
  *) usage ;;
esac
