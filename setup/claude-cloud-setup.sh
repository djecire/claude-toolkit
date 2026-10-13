#!/bin/bash
# Claude cloud environment setup script (paste into claude.ai/code > Default environment > Setup script).
# Loads Evan's toolkit (djecire/claude-toolkit) and plugins into every cloud session before Claude starts.
TK=/tmp/claude-toolkit
rm -rf "$TK"
if git clone --depth 1 https://github.com/djecire/claude-toolkit "$TK" >/dev/null 2>&1 || gh repo clone djecire/claude-toolkit "$TK" -- --depth 1 >/dev/null 2>&1; then
  mkdir -p ~/.claude/skills ~/.claude/agents ~/.claude/commands
  cp -rL "$TK/.claude/skills/." ~/.claude/skills/
  cp -rL "$TK/.claude/agents/." ~/.claude/agents/
  cp -rL "$TK/.claude/commands/." ~/.claude/commands/
  echo "evan-toolkit loaded"
else
  echo "evan-toolkit clone failed" >&2
fi
claude plugin marketplace add openai/codex-plugin-cc >/dev/null 2>&1 && claude plugin install codex@openai-codex >/dev/null 2>&1 && echo "codex plugin installed"
claude plugin marketplace add chaseai-yt/claudex-loop >/dev/null 2>&1 && claude plugin install claudex-loop@claudex-loop >/dev/null 2>&1 && echo "claudex-loop plugin installed"
claude plugin install vercel@claude-plugins-official >/dev/null 2>&1 && echo "vercel plugin installed"
exit 0
