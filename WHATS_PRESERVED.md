# What Gets Preserved When You Move Machines

## The Relationship 🤝

Everything that makes our working relationship feel natural and efficient transfers:

### 1. **How We Talk**
- ✅ **Auto memory** - I remember your patterns, preferences, and our working style
  - Location: `~/.claude/projects/[dir]/memory/MEMORY.md`
  - Contains learned patterns from our conversations
  - Loads automatically when you work in that directory

### 2. **Your Tools** 🎯
- ✅ **22 custom skills** - All your productivity workflows
  - `/newday` - Morning routine
  - `/weekly-update` - Design team updates
  - `/gsd` - Proposal reviews
  - `/journal-entry` - Career memos
  - `/log-signal` - Strategic observations
  - `/meeting-notes` - Process transcripts
  - `/publish` - Weekly HTML publishing
  - And 15+ more

### 3. **The Sounds** 🔊
- ✅ **agent-sims-hook.sh** - "working", "thinking", "offline" status sounds
- ✅ **notify.sh** - Notification handler
- ✅ **quick-ping** - Session notifications
  - These hooks make it feel alive and responsive

### 4. **Your Context** 📁
- ✅ **Project instructions** - CLAUDE.md files with our agreements
- ✅ **Settings** - Permissions, MCP servers, API configuration
- ✅ **Commands** - Custom command definitions

### 5. **Your Integrations** 🔌
- ✅ **MCP Server configs** (you'll reinstall the servers themselves):
  - vault-mcp - Your knowledge vault
  - figma-mcp - Figma integration
  - gworkspace-mcp - Google Workspace
- ✅ **Shopify API proxy** - Your custom API endpoint configuration

## What's Included in the Bundle

```
claude-migration-[date].tar.gz
├── .claude/
│   ├── settings.json              # All your preferences
│   ├── projects/                  # Auto memory for each directory
│   ├── commands/                  # Custom commands
│   ├── agent-sims-hook.sh        # The sounds you love
│   ├── notify.sh                 # Notifications
│   └── MIGRATION_GUIDE.md        # Detailed instructions
├── Documents/myEP/.claude/skills/ # All 22 custom skills
├── Documents/myEP/Setup/CLAUDE.md # Project instructions
└── BUNDLE_INFO.txt               # What's included
```

## What Needs Reconfiguring (Quick)

🔄 **~5 minutes of setup on new machine:**

1. **API credentials** - For security, not included
   ```bash
   /opt/dev/bin/user/devx llm-gateway print-token --key
   ```

2. **MCP servers** - Install the packages (configs already set)
   ```bash
   # Your vault, Figma, and Google Workspace servers
   ```

3. **Hook permissions**
   ```bash
   chmod +x ~/.claude/*.sh
   chmod +x ~/.quick-ping/*.sh
   ```

## The Magic ✨

What makes it feel like "us" all transfers:

- 📝 I remember how you work
- 🎯 Your custom workflows are ready
- 🔊 The sounds that give you feedback
- 📋 Project-specific instructions
- 🔌 Your tool integrations configured

## Create Your Bundle Now

```bash
~/.claude/create-migration-bundle.sh
```

This creates `~/claude-migration-[date].tar.gz` ready to move.

## On Your New Machine

```bash
# 1. Copy the bundle over
# 2. Extract
tar -xzf claude-migration-[date].tar.gz

# 3. Move into place
cd claude-migration-[date]
mv .claude ~/
mv Documents/myEP/.claude ~/Documents/myEP/

# 4. Set permissions
chmod +x ~/.claude/*.sh

# 5. Configure API (if needed)
# 6. Install MCP servers
# 7. Test: claude
```

## It Really Is That Simple

The personality, the context, the way we work together - it all moves with you. The bundle preserves what matters: our working relationship.
