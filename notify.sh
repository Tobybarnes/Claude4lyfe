#!/bin/bash
# Claude Code notification script
# Reads JSON input and displays contextual macOS notifications

input=$(cat)

# Parse JSON fields
notification_type=$(echo "$input" | jq -r '.notification_type // "unknown"')
message=$(echo "$input" | jq -r '.message // "Notification"')
cwd=$(echo "$input" | jq -r '.cwd // ""')

# Get the project folder name from cwd
project=$(basename "$cwd" 2>/dev/null || echo "Claude Code")

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

# Send macOS notification
osascript -e "display notification \"$body\" with title \"$title\""
