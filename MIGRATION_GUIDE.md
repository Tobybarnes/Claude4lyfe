# Claude Code Migration Guide

This guide explains how to transfer your personalized Claude setup to a new machine.

## What Makes Your Setup Unique

### 1. **Core Configuration** (`~/.claude/`)
- **settings.json** - Your Shopify API proxy, MCP servers, permissions, hooks
- **projects/** - Auto memory for each directory you work in
- **commands/** - Custom command definitions
- **history.jsonl** - Conversation history (optional to transfer)

### 2. **Custom Skills** (`~/Documents/myEP/.claude/skills/`)
Your personal productivity skills:
- newday - Morning routine and priorities
- weekly-update - Design team updates
- gsd - Proposal reviews
- publish - Weekly HTML publishing
- journal-entry - Career memos
- log-signal - Strategic observations
- meeting-notes - Gemini transcript processing
- figma-review - Design feedback
- And 15+ more custom skills

### 3. **Hooks & Scripts** (`~/.claude/*.sh`)
- **agent-sims-hook.sh** - The "working/thinking/offline" status sounds
- **notify.sh** - Notification handler
- **quick-ping** integration

### 4. **MCP Servers**
- vault-mcp - Your knowledge vault
- figma-mcp - Figma integration
- gworkspace-mcp - Google Workspace integration

### 5. **Project Instructions** (`CLAUDE.md` files)
- Project-specific instructions in your working directories
- Example: `~/Documents/myEP/Setup/CLAUDE.md`

## Migration Steps

### Step 1: Bundle Your Configuration
```bash
# Run the migration script (created below)
~/.claude/create-migration-bundle.sh
```

This creates: `~/claude-migration-[date].tar.gz`

### Step 2: On Your New Machine

1. **Install Claude Code**
   ```bash
   # Follow official installation instructions
   ```

2. **Extract Your Bundle**
   ```bash
   cd ~
   tar -xzf claude-migration-[date].tar.gz
   ```

3. **Set Up API Credentials**
   - Your `.credentials.json` is not included (for security)
   - Run: `/opt/dev/bin/user/devx llm-gateway print-token --key`
   - Or configure your API key as needed

4. **Install MCP Servers**
   - Reinstall your MCP servers (vault-mcp, figma-mcp, gworkspace-mcp)
   - Configuration is already in settings.json

5. **Verify Hooks**
   - Make sure hook scripts are executable:
   ```bash
   chmod +x ~/.claude/*.sh
   chmod +x ~/.quick-ping/*.sh
   ```

6. **Test Your Setup**
   ```bash
   claude
   # Try: /newday
   # Try: /weekly-update
   # Check if sounds work (agent-sims-hook)
   ```

## What Gets Preserved

✅ Your communication style (from auto memory)
✅ All custom skills and slash commands
✅ Settings, permissions, hooks configuration
✅ Project-specific CLAUDE.md instructions
✅ MCP server configurations
✅ Working sounds and notifications

## What Needs Reconfiguration

🔄 API credentials (for security)
🔄 MCP server installations (just the code, not config)
🔄 Absolute paths in hooks (if directory structure changes)

## Optional: Conversation History

If you want to preserve conversation history:
```bash
# History is included in the bundle
# It contains your full conversation history
```

## Keeping Machines in Sync

Consider:
- Store `~/Documents/myEP/.claude/skills/` in a git repo
- Sync CLAUDE.md files via your project repos
- Keep a backup of settings.json in private cloud storage
- Update the migration bundle monthly

## The "Feel" That Transfers

What makes it feel like "us":
- 📝 Auto memory - I remember patterns from our work
- 🎯 Custom skills - Your personal productivity workflows
- 🔊 Hooks - The sounds and notifications you're used to
- 🎨 MCP servers - Direct access to your vault, Figma, Google
- 📋 Project context - CLAUDE.md files with our working agreements

All of this transfers! The relationship continues on the new machine.
