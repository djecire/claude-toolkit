#!/usr/bin/env bash
set -u
cd "$(dirname "$0")/.." || exit 1
fail=0
check() {
  case "$3" in
    *"$2"*) printf 'PASS: %s\n' "$1" ;;
    *) printf 'FAIL: %s\n  wanted substring: %s\n  got: %s\n' "$1" "$2" "$3"; fail=1 ;;
  esac
}

out="$(./dispatch.sh --dry-run worker /tmp/conductor-test t1 haiku low read-only "say hi" 2>&1)"
check "worker headless print mode"      " -p"              "$out"
check "worker passes model"             "haiku"            "$out"
check "worker passes effort"            "--effort low"     "$out"
check "worker read-only tools"          "Read Grep Glob"   "$out"
check "worker json output"              "--output-format"  "$out"
check "worker prompt gets preamble"     "STATE.md"         "$out"
check "worker prompt is included"       "say hi"           "$out"

out="$(./dispatch.sh --dry-run worker /tmp/conductor-test t2 sonnet medium workspace-write "build it" 2>&1)"
check "workspace-write adds Bash"       "Bash"             "$out"
check "workspace-write adds Edit"       "Edit"             "$out"

if ! ./dispatch.sh --dry-run worker /tmp/conductor-test t3 opus high danger-full-access "nope" >/dev/null 2>&1; then
  printf 'PASS: worker rejects full access\n'
else
  printf 'FAIL: worker rejects full access\n'
  fail=1
fi

out="$(./dispatch.sh --dry-run start "fix the widget" testrun 2>&1)"
check "start boots with the goal"       "fix the widget"   "$out"
check "start names the run dir"         "testrun"          "$out"
check "start points at SKILL.md"        "SKILL.md"         "$out"
check "start never skips permissions"   "allowedTools"     "$out"
case "$out" in
  *dangerously-skip-permissions*) printf 'FAIL: start must not use --dangerously-skip-permissions\n'; fail=1 ;;
  *) printf 'PASS: no dangerously-skip-permissions\n' ;;
esac

if ! ./dispatch.sh --dry-run resume /tmp/conductor-nonexistent t9 read-only "hello" >/dev/null 2>&1; then
  printf 'PASS: resume fails without recorded thread\n'
else
  printf 'FAIL: resume fails without recorded thread\n'
  fail=1
fi

# Resume happy path: create a temp run with a recorded thread id
mkdir -p /tmp/conductor-test-resume/threads
printf 'fake-session-id\n' > /tmp/conductor-test-resume/threads/t9

out="$(./dispatch.sh --dry-run resume /tmp/conductor-test-resume t9 read-only "check it" 2>&1)"
check "resume happy path: uses --resume"      "--resume"         "$out"
check "resume happy path: session id"         "fake-session-id"  "$out"
check "resume happy path: read-only tools"    "Read Grep Glob"   "$out"
check "resume happy path: STATE.md preamble"  "STATE.md"         "$out"
check "resume happy path: prompt included"    "check it"         "$out"
case "$out" in
  *" Bash"*|*"Bash "*) printf 'FAIL: resume read-only must not include Bash\n'; fail=1 ;;
  *) printf 'PASS: resume read-only does not include Bash\n' ;;
esac

if ! ./dispatch.sh --dry-run resume /tmp/conductor-test-resume t9 danger-full-access "nope" >/dev/null 2>&1; then
  printf 'PASS: resume rejects full access\n'
else
  printf 'FAIL: resume rejects full access\n'
  fail=1
fi

rm -rf /tmp/conductor-test-resume

if ./dispatch.sh >/dev/null 2>&1; then
  printf 'FAIL: no args exits 2\n'
  fail=1
else
  rc=$?
  if [ "$rc" -eq 2 ]; then
    printf 'PASS: no args exits 2\n'
  else
    printf 'FAIL: no args exits 2 (got %d)\n' "$rc"
    fail=1
  fi
fi

exit "$fail"
