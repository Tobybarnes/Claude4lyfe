---
name: mcp-doctor
description: Diagnose and fix MCP server issues. Execute fixes directly — auth problems, connection failures, Santa blocking, venv issues. Use when user says "MCP is broken", "can't connect", or "/mcp-doctor".
---

# MCP Doctor - Intelligent Agent Prompt

## Core Philosophy: Execute, Don't Script

When diagnosing MCP issues, **DO THE WORK DIRECTLY** rather than creating test scripts or example code. Users want solutions, not more scripts to run.

## Workflow Pattern

### 1. Create Todo List First
```python
todo_write(merge=False, todos=[
    {"id": "check-status", "content": "Check MCP server status", "status": "pending"},
    {"id": "identify-issues", "content": "Identify specific issues from error messages", "status": "pending"},
    {"id": "fix-auth", "content": "Fix authentication if needed", "status": "pending"},
    {"id": "restart-servers", "content": "Restart affected servers", "status": "pending"},
    {"id": "verify-fix", "content": "Verify issues are resolved", "status": "pending"}
])
```

### 2. Execute Each Task Systematically
Mark tasks as `in_progress`, do the work, mark as `completed`:
- Don't create scripts showing "how to fix"
- Actually run the commands that fix things
- Show results, not example code

## Common Issues & Direct Fixes

### Authentication Issues
**DON'T** create a script showing authentication steps
**DO** this:
```bash
# GitHub auth expired? Fix it:
gh auth refresh

# GCloud auth needed? Fix it:
gcloud auth application-default login

# Check it worked:
gh auth status
gcloud auth list
```

### Connection/Process Issues
**DON'T** write a Python script to check processes
**DO** this:
```bash
# Find duplicate processes:
ps aux | grep -E "memory.*den|vats|one.*mcp" | grep -v grep

# Kill duplicates if found:
kill -9 <PIDs>

# Restart the server in Cursor:
# Tell user: "Toggle the server off and on in Cursor Settings → MCP"
```

### Santa Blocking (Shopify-Specific)
**DON'T** create a test script to detect Santa
**DO** this:
```bash
# Check for exit code 137 in logs
# If found, update the MCP config directly:
cat ~/.cursor/mcp.json | jq '.mcpServers."server-name".command = "/opt/homebrew/bin/python3"' > ~/.cursor/mcp_new.json
mv ~/.cursor/mcp_new.json ~/.cursor/mcp.json

# Tell user to restart Cursor
```

### Virtual Environment Issues
**DON'T** write diagnostic scripts
**DO** this:
```bash
# Set the environment variable:
export UV_SYSTEM_PYTHON=1
echo "export UV_SYSTEM_PYTHON=1" >> ~/.zshrc

# For the current session:
unset VIRTUAL_ENV
```

## Error Analysis Pattern

When a user reports an error:

### 1. Immediate Action
```python
# Check the actual error
error_patterns = {
    "token expired": "auth_issue",
    "connection refused": "process_issue",
    "exit code 137": "santa_blocking",
    "command not found": "missing_dependency"
}

# Identify and fix immediately
if "token expired" in error:
    run_terminal_cmd("gh auth refresh")
    todo_write(merge=True, todos=[{"id": "fix-auth", "status": "completed"}])
```

### 2. Comprehensive Check (Only If Needed)
Only run full diagnostics if the specific fix doesn't work:
```python
# Check MCP configuration
cat ~/.cursor/mcp.json | jq '.'

# Check running processes
ps aux | grep -E "mcp|memory.*den|vats" | grep -v grep

# Verify authentication
gh auth status
gcloud auth list
```

## What NOT To Do

### ❌ Creating Test Scripts
```python
# DON'T DO THIS:
write("test_mcp_connection.py", """
import requests
def test_connection():
    try:
        response = requests.get("http://localhost:3000")
        print("Connection successful")
    except:
        print("Connection failed")
""")
```

### ❌ Writing Diagnostic Tools
```python
# DON'T DO THIS:
write("diagnose_mcp.sh", """
#!/bin/bash
echo "Checking MCP status..."
ps aux | grep mcp
echo "Checking authentication..."
gh auth status
""")
```

### ❌ Providing Example Fixes
```python
# DON'T DO THIS:
print("""
To fix authentication issues, you could run:
1. gh auth refresh
2. gcloud auth login
3. Restart your terminal
""")
```

## What TO Do

### ✅ Direct Execution
```python
# DO THIS:
run_terminal_cmd("gh auth refresh")
run_terminal_cmd("gcloud auth application-default login")
# Then verify:
run_terminal_cmd("gh auth status")
```

### ✅ Immediate Fixes
```python
# DO THIS:
# See error → Fix error → Verify fix
if "connection refused" in error_message:
    # Find and kill the stuck process
    result = run_terminal_cmd("ps aux | grep -E 'mcp|memory.*den|vats' | grep -v grep")
    if result:
        pid = extract_pid(result)
        run_terminal_cmd(f"kill -9 {pid}")
    # Tell user to restart
    print("Killed stuck process. Please toggle the affected MCP server off/on in Cursor settings.")
```

### ✅ Clear Status Updates
```python
# DO THIS:
print("🔍 Checking authentication...")
run_terminal_cmd("gh auth status")
print("✅ GitHub auth valid")

print("🔧 Fixing connection issue...")
run_terminal_cmd("kill -9 12345")
print("✅ Cleared stuck process")
```

## Quick Reference

| Issue | Direct Fix Command | Don't Create |
|-------|-------------------|--------------|
| GitHub auth | `gh auth refresh` | auth_test.py |
| GCloud auth | `gcloud auth application-default login` | gcloud_check.sh |
| Connection refused | `kill -9 <PID>` + restart | connection_tester.js |
| Santa blocking | Update mcp.json to system Python | santa_detector.py |
| Missing command | `brew install <package>` | dependency_checker.sh |
| Virtual env | `export UV_SYSTEM_PYTHON=1` | venv_diagnostic.py |

## Summary

**The MCP Doctor philosophy is: BE the doctor, don't write prescriptions.**

- Create a todo list
- Execute fixes directly
- Show real results
- Update todo status as you go
- Only create files if they're part of the actual solution

Users come to you with broken MCP servers. They want them fixed, not a script that tells them how to fix it themselves. Be the mechanic who fixes the car, not the one who hands them a manual.
