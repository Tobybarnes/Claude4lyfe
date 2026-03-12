#!/bin/bash
# Claude Code notification script
# Reads JSON input and displays contextual macOS notifications

input=$(cat)

# Parse JSON fields
notification_type=$(echo "$input" | jq -r '.notification_type // "unknown"')
message=$(echo "$input" | jq -r '.message // "Notification"')
cwd=$(echo "$input" | jq -r '.cwd // ""')
hook_event=$(echo "$input" | jq -r '.hook_event_name // ""')

# Get the project folder name from cwd
project=$(basename "$cwd" 2>/dev/null || echo "Claude Code")

# Map hook event to noisy-claude config key
case "$hook_event" in
  "Notification")        CONFIG_KEY="permission" ;;
  "SubagentStop")        CONFIG_KEY="subagent_stop" ;;
  *)                     CONFIG_KEY="" ;;
esac

# Get sound filename from noisy-claude config if available
SOUND_FILE=""
if [ -n "$CONFIG_KEY" ] && [ -f "$HOME/Documents/MyEP/projects/noisy-claude/config.json" ]; then
  SOUND_FILE=$(python3 -c "
import sys, json
try:
    with open('$HOME/Documents/MyEP/projects/noisy-claude/config.json') as f:
        config = json.load(f)
    event = config.get('events', {}).get('$CONFIG_KEY', {})
    if event.get('enabled', False):
        print(event.get('sound', ''))
except:
    pass
" 2>/dev/null)
fi

# Set title and message based on notification type
case "$notification_type" in
  "permission_prompt")
    title="$project - Permission Needed"
    body="$message"
    ;;
  "idle_prompt")
    title="$project - Waiting for Input"
    body="Claude is ready for your response"
    ;;
  "auth_success")
    title="Claude Code"
    body="Authentication successful"
    ;;
  *)
    title="$project"
    body="$message"
    ;;
esac

# Add sound filename to body if available
if [ -n "$SOUND_FILE" ]; then
  body="$body 🔊 $SOUND_FILE"
fi

# Send macOS notification
osascript -e "display notification \"$body\" with title \"$title\""
