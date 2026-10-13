#!/bin/bash
# Claude cloud environment setup script v2 (paste into claude.ai/code > Default environment > Setup script).
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
claude plugin marketplace add openai/codex-plugin-cc >/dev/null 2>&1; claude plugin install codex@openai-codex >/dev/null 2>&1 && echo "codex plugin installed"
claude plugin marketplace add chaseai-yt/claudex-loop >/dev/null 2>&1; claude plugin install claudex-loop@claudex-loop >/dev/null 2>&1 && echo "claudex-loop plugin installed"
claude plugin marketplace add anthropics/claude-plugins-official >/dev/null 2>&1; claude plugin marketplace update claude-plugins-official >/dev/null 2>&1; claude plugin install vercel@claude-plugins-official 2>&1 | tail -1
exit 0
