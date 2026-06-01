#!/usr/bin/env bash
# Verify that coding-os is installed correctly.
# Run after the README quick-install: ./scripts/verify.sh

set -u

PASS="\033[0;32m✓\033[0m"
FAIL="\033[0;31m✗\033[0m"
WARN="\033[0;33m!\033[0m"

errors=0
warnings=0

check() {
  local label="$1"
  local cmd="$2"
  if eval "$cmd" >/dev/null 2>&1; then
    printf "  ${PASS} %s\n" "$label"
  else
    printf "  ${FAIL} %s\n" "$label"
    errors=$((errors + 1))
  fi
}

check_opt() {
  local label="$1"
  local cmd="$2"
  if eval "$cmd" >/dev/null 2>&1; then
    printf "  ${PASS} %s\n" "$label"
  else
    printf "  ${WARN} %s (optional)\n" "$label"
    warnings=$((warnings + 1))
  fi
}

echo ""
echo "coding-os install check"
echo "======================="

echo ""
echo "Symlinks under ~/.claude/"
check "agents/   linked"    "[ -L \"$HOME/.claude/agents\" ]"
check "commands/ linked"    "[ -L \"$HOME/.claude/commands\" ]"
check "skills/   linked"    "[ -L \"$HOME/.claude/skills\" ]"
check "rules/    linked"    "[ -L \"$HOME/.claude/rules\" ]"

echo ""
echo "Settings + templates"
check "~/.claude/settings.json exists"      "[ -f \"$HOME/.claude/settings.json\" ]"
check "settings.json has \"hooks\" block"    "grep -q '\"hooks\"' \"$HOME/.claude/settings.json\""
check_opt "~/.claude/CLAUDE.md exists"        "[ -f \"$HOME/.claude/CLAUDE.md\" ]"

echo ""
echo "Hook scripts reachable"
for script in session-start.js session-end.js scope-check.js taste-lint.js compact-trigger.js suggest-compact.js pre-compact.js evaluate-session.js; do
  check "hooks/$script"   "[ -f \"$HOME/coding-os/scripts/hooks/$script\" ]"
done

echo ""
echo "Runtime dependencies"
check "Node.js >= 18"   "node -e 'process.exit(parseInt(process.versions.node) >= 18 ? 0 : 1)'"
check "git"             "command -v git"

echo ""
echo "Optional CLIs (only matter for /cap ship-verify)"
check_opt "gh (GitHub CLI)"  "command -v gh"
check_opt "vercel"           "command -v vercel"
check_opt "codex (for /qa)"  "command -v codex"
check_opt "coderabbit"       "command -v coderabbit"

echo ""
if [ $errors -eq 0 ]; then
  printf "${PASS} All required checks passed (%d optional warnings)\n" "$warnings"
  echo "  Restart Claude Code and you're good to go."
  exit 0
else
  printf "${FAIL} %d required check(s) failed (%d optional warnings)\n" "$errors" "$warnings"
  echo "  See README quick-install for fixes."
  exit 1
fi
