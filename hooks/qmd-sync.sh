#!/usr/bin/env bash
# qmd-sync.sh — PostToolUse hook
# Auto-updates QMD index when Claude writes/edits .md files in MyEP vault.
# Rate-limited: batches updates, runs at most once per 60 seconds.

set -euo pipefail

VAULT_DIR="/Users/tobybarnes_shop/Documents/MyEP"
LOCK_FILE="$HOME/.claude/hooks/.qmd-sync-lock"
LOG_FILE="$HOME/.claude/hooks/qmd-sync.log"
QMD_BIN="$HOME/.npm-global/bin/qmd"
COOLDOWN=60

# Read hook input
INPUT=$(cat)
FILE_PATH=$(echo "$INPUT" | jq -r '.tool_input.file_path // empty')

# Guards
[[ -z "$FILE_PATH" ]] && exit 0
[[ "$FILE_PATH" != *.md ]] && exit 0
[[ "$FILE_PATH" != "$VAULT_DIR"/* ]] && exit 0
[[ ! -f "$FILE_PATH" ]] && exit 0

# Skip skill files, hidden dirs, node_modules
[[ "$FILE_PATH" == */.claude/* ]] && exit 0
[[ "$FILE_PATH" == */node_modules/* ]] && exit 0
[[ "$FILE_PATH" == */.obsidian/* ]] && exit 0

# Rate limit — skip if last sync was < COOLDOWN seconds ago
if [[ -f "$LOCK_FILE" ]]; then
  LOCK_AGE=$(( $(date +%s) - $(stat -f%m "$LOCK_FILE" 2>/dev/null || echo 0) ))
  if (( LOCK_AGE < COOLDOWN )); then
    exit 0
  fi
fi

# Mark sync start
touch "$LOCK_FILE"

# Run update + embed in background (non-blocking)
(
  log() { echo "[$(date '+%Y-%m-%d %H:%M:%S')] $*" >> "$LOG_FILE"; }

  REL_PATH="${FILE_PATH#$VAULT_DIR/}"
  log "Triggered by: $REL_PATH"

  "$QMD_BIN" update -c myep >> "$LOG_FILE" 2>&1 || log "ERROR: qmd update failed"
  "$QMD_BIN" embed >> "$LOG_FILE" 2>&1 || log "ERROR: qmd embed failed"

  log "Index updated"
) &

exit 0
