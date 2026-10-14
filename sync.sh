#!/bin/bash
# Re-sync the PUBLIC toolkit from ~/.claude on Evan's Mac, then commit and push.
# formal-audit, audit-campaign and ec-enquiry-reply are excluded (private EC content).
set -euo pipefail
cd "$(dirname "$0")"
P=plugins/evan-toolkit
rsync -aL --delete --exclude '.git' --exclude 'synced' --exclude 'formal-audit' --exclude 'audit-campaign' --exclude 'ec-enquiry-reply' --exclude 'node_modules' --exclude '.DS_Store' --exclude '__pycache__' ~/.claude/skills/ "$P/skills/"
rsync -a --delete --exclude '.DS_Store' ~/.claude/agents/ "$P/agents/"
rsync -a --delete --exclude '.DS_Store' ~/.claude/commands/ "$P/commands/"
for d in "$P"/skills/*; do ln -sfn "../../$d" ".claude/skills/$(basename "$d")"; done
for l in .claude/skills/*; do [ -e "$l" ] || rm "$l"; done
for f in "$P"/agents/*.md; do ln -sfn "../../$f" ".claude/agents/$(basename "$f")"; done
for f in "$P"/commands/*.md; do ln -sfn "../../$f" ".claude/commands/$(basename "$f")"; done
if grep -rIqiE 'ecentertainment|ec-entertainment|djecire|sk-ant-|ghp_[A-Za-z0-9]{20}' "$P" .claude; then echo "Refusing: private identifiers found" >&2; exit 1; fi
git add -A && git commit -m "Sync toolkit from ~/.claude" && git push || echo "Nothing to sync."
