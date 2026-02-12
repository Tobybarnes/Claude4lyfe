#!/bin/bash
# Agent Sims status reporter for Claude Code hooks

SERVER="http://localhost:3333"
STATUS="${1:-working}"

# Create unique agent ID from parent PID (stable across tool calls)
AGENT_ID="agent-$PPID"

# Get or create persistent name for this agent
NAME_FILE="/tmp/agent-sims-name-$PPID"
if [ -f "$NAME_FILE" ]; then
  AGENT_NAME=$(cat "$NAME_FILE")
else
  # Random first names
  NAMES=("Alex" "Jordan" "Taylor" "Morgan" "Casey" "Riley" "Quinn" "Avery" "Reese" "Drew" "Sage" "Blair" "Cameron" "Dakota" "Emery" "Finley" "Harper" "Jamie" "Kendall" "Logan" "Marley" "Nico" "Parker" "River" "Skyler" "Tatum")
  AGENT_NAME="${NAMES[$((RANDOM % ${#NAMES[@]}))]}"
  echo "$AGENT_NAME" > "$NAME_FILE"
fi

# Only report if server is running (fail silently otherwise)
curl -s -X POST "$SERVER/api/agent" \
  -H "Content-Type: application/json" \
  -d "{\"id\":\"$AGENT_ID\",\"name\":\"$AGENT_NAME\",\"status\":\"$STATUS\"}" \
  --connect-timeout 1 \
  > /dev/null 2>&1 &
