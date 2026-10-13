#!/bin/bash
# Claude cloud environment setup script v4 (paste into claude.ai/code > Default environment > Setup script).
# Loads Evan's public toolkit (djecire/claude-toolkit) and plugins into every cloud session before Claude starts.
TK=/tmp/claude-toolkit
rm -rf "$TK"
if git clone --depth 1 https://github.com/djecire/claude-toolkit "$TK"; then
  mkdir -p ~/.claude/skills ~/.claude/agents ~/.claude/commands
  cp -rL "$TK/.claude/skills/." ~/.claude/skills/
  cp -rL "$TK/.claude/agents/." ~/.claude/agents/
  cp -rL "$TK/.claude/commands/." ~/.claude/commands/
  echo "evan-toolkit loaded: $(ls ~/.claude/skills | wc -l) skills"
else
  echo "evan-toolkit clone failed" >&2
fi
# Repo-private skills (e.g. ec-entertainment-v2 .agents/skills: EC skills + formal-audit)
for d in /home/user/*/.agents/skills; do [ -d "$d" ] && cp -rL "$d/." ~/.claude/skills/ && echo "repo skills loaded from $d"; done
# Refresh repo-private skills at the start of EVERY session (setup results are cached between sessions)
python3 - <<'PY'
import json, os
p = os.path.expanduser('~/.claude/settings.json')
try:
    d = json.load(open(p))
except Exception:
    d = {}
cmd = 'for d in /home/user/*/.agents/skills; do [ -d "$d" ] && cp -rL "$d/." ~/.claude/skills/; done; true'
ss = d.setdefault('hooks', {}).setdefault('SessionStart', [])
if not any(cmd in json.dumps(h) for h in ss):
    ss.append({'hooks': [{'type': 'command', 'command': cmd}]})
os.makedirs(os.path.dirname(p), exist_ok=True)
json.dump(d, open(p, 'w'), indent=2)
print('session-start skill refresh hook installed')
PY
claude plugin marketplace add openai/codex-plugin-cc >/dev/null 2>&1; claude plugin install codex@openai-codex >/dev/null 2>&1 && echo "codex plugin installed"
claude plugin marketplace add chaseai-yt/claudex-loop >/dev/null 2>&1; claude plugin install claudex-loop@claudex-loop >/dev/null 2>&1 && echo "claudex-loop plugin installed"
claude plugin marketplace add anthropics/claude-plugins-official >/dev/null 2>&1; claude plugin marketplace update claude-plugins-official >/dev/null 2>&1; claude plugin install vercel@claude-plugins-official 2>&1 | tail -1
exit 0
