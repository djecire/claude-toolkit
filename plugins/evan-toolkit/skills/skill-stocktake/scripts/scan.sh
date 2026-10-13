#!/usr/bin/env bash
# scan.sh — enumerate skill files, extract frontmatter and UTC mtime
# Usage: scan.sh [CWD_SKILLS_DIR]
# Output: JSON to stdout
#
# When CWD_SKILLS_DIR is omitted, defaults to $PWD/.claude/skills so the
# script always picks up project-level skills without relying on the caller.
#
# Environment:
#   SKILL_STOCKTAKE_GLOBAL_DIR   Override ~/.claude/skills (for testing only;
#                                do not set in production — intended for bats tests)
#   SKILL_STOCKTAKE_PROJECT_DIR  Override project dir detection (for testing only)

set -euo pipefail

GLOBAL_DIR="${SKILL_STOCKTAKE_GLOBAL_DIR:-$HOME/.claude/skills}"
CWD_SKILLS_DIR="${SKILL_STOCKTAKE_PROJECT_DIR:-${1:-$PWD/.claude/skills}}"
# Path to JSONL file containing tool-use observations (optional; used for usage frequency counts).
# Override via SKILL_STOCKTAKE_OBSERVATIONS env var if your setup uses a different path.
OBSERVATIONS="${SKILL_STOCKTAKE_OBSERVATIONS:-$HOME/.claude/observations.jsonl}"

# Validate CWD_SKILLS_DIR looks like a .claude/skills path (defense-in-depth).
# Only warn when the path exists — a nonexistent path poses no traversal risk.
if [[ -n "$CWD_SKILLS_DIR" && -d "$CWD_SKILLS_DIR" && "$CWD_SKILLS_DIR" != */.claude/skills* ]]; then
  echo "Warning: CWD_SKILLS_DIR does not look like a .claude/skills path: $CWD_SKILLS_DIR" >&2
fi

# Extract name + description from YAML frontmatter in one pass.
# Handles: quoted values, folded/literal block scalars (>- > | |-), nested
# keys (skipped — only top-level keys match), BOM, and CRLF line endings.
# Emits "name<TAB>description" (tabs/newlines inside values become spaces).
FRONTMATTER_PY='
import sys
try:
    text = open(sys.argv[1], encoding="utf-8-sig").read()
except Exception:
    print("\x1f"); sys.exit(0)
lines = text.replace("\r\n", "\n").replace("\r", "\n").split("\n")
if not lines or lines[0].strip() != "---":
    print("\x1f"); sys.exit(0)
fm = []
for ln in lines[1:]:
    if ln.strip() == "---":
        break
    fm.append(ln)
def get(field):
    key = field + ":"
    i, n = 0, len(fm)
    while i < n:
        ln = fm[i]
        if ln.startswith(key):
            val = ln[len(key):].strip()
            if val in (">", ">-", ">+", "|", "|-", "|+"):
                block = []
                i += 1
                while i < n and (fm[i][:1] in (" ", "\t") or fm[i].strip() == ""):
                    block.append(fm[i].strip())
                    i += 1
                sep = " " if val[0] == ">" else "\n"
                return sep.join(b for b in block if b).strip()
            if len(val) >= 2 and val[0] == val[-1] and val[0] in "\"'\''":
                val = val[1:-1]
            return val
        i += 1
    return ""
def clean(s):
    return s.replace("\x1f", " ").replace("\t", " ").replace("\n", " ").strip()
print(clean(get("name")) + "\x1f" + clean(get("description")))
'
# \x1f (unit separator) as delimiter: unlike \t it is not IFS whitespace, so an
# empty name field is preserved instead of shifting description into name.
parse_frontmatter() {
  python3 -c "$FRONTMATTER_PY" "$1" 2>/dev/null || printf '\x1f\n'
}

# Get UTC timestamp N days ago (supports both macOS and GNU date)
date_ago() {
  local n="$1"
  date -u -v-"${n}d" +%Y-%m-%dT%H:%M:%SZ 2>/dev/null ||
  date -u -d "${n} days ago" +%Y-%m-%dT%H:%M:%SZ
}

# Count observations matching a file path since a cutoff timestamp
count_obs() {
  local file="$1" cutoff="$2"
  if [[ ! -f "$OBSERVATIONS" ]]; then
    echo 0
    return
  fi
  jq -r --arg p "$file" --arg c "$cutoff" \
    'select(.tool=="Read" and .path==$p and .timestamp>=$c) | 1' \
    "$OBSERVATIONS" 2>/dev/null | wc -l | tr -d ' '
}

# Scan a directory and produce a JSON array of skill objects
scan_dir_to_json() {
  local dir="$1"
  local c7 c30
  c7=$(date_ago 7)
  c30=$(date_ago 30)

  local tmpdir
  tmpdir=$(mktemp -d)
  # Use a function to avoid embedding $tmpdir in a quoted string (prevents injection
  # if TMPDIR were crafted to contain shell metacharacters).
  local _scan_tmpdir="$tmpdir"
  _scan_cleanup() { rm -rf "$_scan_tmpdir"; }
  trap _scan_cleanup RETURN

  # Pre-aggregate observation counts in two passes (one per window) instead of
  # calling jq per-file — reduces from O(n*m) to O(n+m) jq invocations.
  local obs_7d_counts obs_30d_counts
  obs_7d_counts=""
  obs_30d_counts=""
  if [[ -f "$OBSERVATIONS" ]]; then
    obs_7d_counts=$(jq -r --arg c "$c7" \
      'select(.tool=="Read" and .timestamp>=$c) | .path' \
      "$OBSERVATIONS" 2>/dev/null | sort | uniq -c)
    obs_30d_counts=$(jq -r --arg c "$c30" \
      'select(.tool=="Read" and .timestamp>=$c) | .path' \
      "$OBSERVATIONS" 2>/dev/null | sort | uniq -c)
  fi

  local i=0
  while IFS= read -r file; do
    local name desc mtime u7 u30 dp
    IFS=$'\x1f' read -r name desc < <(parse_frontmatter "$file") || true
    name="${name:-}"
    desc="${desc:-}"
    mtime=$(date -u -r "$file" +%Y-%m-%dT%H:%M:%SZ)
    # Use awk exact field match to avoid substring false-positives from grep -F.
    # uniq -c output format: "   N /path/to/file" — path is always field 2.
    u7=$(echo "$obs_7d_counts" | awk -v f="$file" '$2 == f {print $1}' | head -1)
    u7="${u7:-0}"
    u30=$(echo "$obs_30d_counts" | awk -v f="$file" '$2 == f {print $1}' | head -1)
    u30="${u30:-0}"
    dp="${file/#$HOME/~}"

    jq -n \
      --arg path "$dp" \
      --arg name "$name" \
      --arg description "$desc" \
      --arg mtime "$mtime" \
      --argjson use_7d "$u7" \
      --argjson use_30d "$u30" \
      '{path:$path,name:$name,description:$description,use_7d:$use_7d,use_30d:$use_30d,mtime:$mtime}' \
      > "$tmpdir/$i.json"
    i=$((i+1))
  # -L: follow symlinks — skills installed as symlinked dirs (e.g. supabase)
  # are invisible to plain find and silently drop out of the audit.
  done < <(find -L "$dir" -name "*.md" -type f 2>/dev/null | sort)

  if [[ $i -eq 0 ]]; then
    echo "[]"
  else
    jq -s '.' "$tmpdir"/*.json
  fi
}

# --- Main ---

global_found="false"
global_count=0
global_skills="[]"

if [[ -d "$GLOBAL_DIR" ]]; then
  global_found="true"
  global_skills=$(scan_dir_to_json "$GLOBAL_DIR")
  global_count=$(echo "$global_skills" | jq 'length')
fi

project_found="false"
project_path=""
project_count=0
project_skills="[]"

if [[ -n "$CWD_SKILLS_DIR" && -d "$CWD_SKILLS_DIR" ]]; then
  project_found="true"
  project_path="$CWD_SKILLS_DIR"
  project_skills=$(scan_dir_to_json "$CWD_SKILLS_DIR")
  project_count=$(echo "$project_skills" | jq 'length')
fi

# Merge global + project skills into one array
all_skills=$(jq -s 'add' <(echo "$global_skills") <(echo "$project_skills"))

jq -n \
  --arg global_found "$global_found" \
  --argjson global_count "$global_count" \
  --arg project_found "$project_found" \
  --arg project_path "$project_path" \
  --argjson project_count "$project_count" \
  --argjson skills "$all_skills" \
  '{
    scan_summary: {
      global: { found: ($global_found == "true"), count: $global_count },
      project: { found: ($project_found == "true"), path: $project_path, count: $project_count }
    },
    skills: $skills
  }'
