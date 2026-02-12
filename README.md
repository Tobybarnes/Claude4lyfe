# My Claude Code Configuration

Personal Claude Code setup - settings, skills, hooks, and learned context.

## What's Here

### Core Configuration
- **settings.json** - Claude settings, MCP servers, hooks, permissions
- **settings.local.json** - Local overrides

### Custom Skills (`skills/` → symlink to `~/Documents/myEP/.claude/skills/`)
22 personal productivity skills including:
- 🌅 **newday** - Morning routine and priority setting
- 📊 **weekly-update** - Design team updates
- 📋 **gsd** - GSD proposal reviews
- 🚀 **publish** - Weekly HTML publishing
- 📝 **journal-entry** - Career memos
- 📡 **log-signal** - Strategic observations
- 🎯 **meeting-notes** - Process Gemini transcripts
- 🎨 **figma-review** - Design feedback (Toby & Carl styles)
- And 14 more...

### Hooks & Scripts
- **agent-sims-hook.sh** - "working/thinking/offline" status sounds
- **notify.sh** - Notification handler

### Auto Memory (`projects/`)
Per-directory learned context and patterns

### Commands (`commands/`)
Custom command definitions

## Using This on a New Machine

### Quick Setup
```bash
# Clone this repo
git clone https://github.com/[your-username]/claude-config.git ~/.claude-backup

# Copy files
cp -r ~/.claude-backup/* ~/.claude/

# Set permissions
chmod +x ~/.claude/*.sh

# Configure API credentials (not in repo)
# Set up MCP servers
```

### Detailed Setup
See `MIGRATION_GUIDE.md` for step-by-step instructions.

## What's NOT Included (Security)

❌ `.credentials.json` - API keys
❌ `history.jsonl` - Conversation history
❌ Cache, debug, and temporary files

## Keeping in Sync

### After making changes:
```bash
cd ~/.claude
git add settings.json projects/ commands/
git commit -m "Update configuration"
git push
```

### On other machine:
```bash
cd ~/.claude
git pull
```

## Repository Structure

```
.claude/
├── settings.json              # Main configuration
├── projects/                  # Auto memory (per-directory)
│   └── -Users-...-myEP/
│       └── memory/
│           └── MEMORY.md
├── commands/                  # Custom commands
├── agent-sims-hook.sh        # Status sounds
├── notify.sh                 # Notifications
├── MIGRATION_GUIDE.md        # Detailed migration instructions
├── WHATS_PRESERVED.md        # What transfers between machines
└── create-migration-bundle.sh # One-command bundler

~/Documents/myEP/.claude/skills/ # Custom skills (separate repo or submodule)
```

## Skills Repository

The skills are symlinked from `~/Documents/myEP/.claude/skills/`. Consider:
- Keeping skills in a separate repo
- Adding as a git submodule
- Or including directly in this repo

## Notes

- This is my personal Claude configuration
- Includes learned patterns and preferences
- Keep credentials and sensitive data out of git
- Update regularly to preserve latest learnings
