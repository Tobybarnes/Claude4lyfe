# Claude4lyfe 🤖

Personal Claude Code configuration - everything that makes Claude feel like "us".

Repository: https://github.com/Tobybarnes/Claude4lyfe

## What's Here

### 🎯 Core Configuration
- **settings.json** - Claude settings, MCP servers, hooks, permissions
- **settings.local.json** - Local overrides

### 💡 Custom Skills (`skills/`)
22 personal productivity and workflow skills (9,451 lines):

**🌅 Morning & Planning:**
- **newday** - Morning routine with reflection and priorities
- **set-priorities** - Quick priority updates mid-day

**📋 Project Management:**
- **project-task** - Track action items
- **project-context** - Document project details
- **project-decision** - Log decisions with rationale

**📊 GSD & Reviews:**
- **gsd** - Review GSD proposals and updates (with comprehensive reference docs)
- **update-gap** - Skills gap analysis for career growth

**✍️ Documentation:**
- **journal-entry** - Career memos and reflections
- **log-signal** - Track strategic observations
- **log-development** - Learning activity tracking

**🎨 Design & Creative:**
- **figma-review** - Design feedback in Toby & Carl styles
- **ads-love** - Search and share creative advertising examples

**🤝 Collaboration:**
- **weekly-update** - Pull team updates from Slack
- **meeting-notes** - Process Gemini transcripts
- **schedule-meeting** - AI meeting scheduler with Calendar integration

**🚀 Publishing:**
- **publish** - Convert weekly draft to HTML
- **deploy-weekly** - Deploy MM Design Weekly site
- **fieldguide-sync** - Sync and deploy fieldguide content

**🛠️ Meta:**
- **skill-architect** - Design and improve Claude skills
- **audit-skill** - Assess skill mastery levels

### 🔊 Hooks & Scripts
- **agent-sims-hook.sh** - "working/thinking/offline" status sounds
- **notify.sh** - Notification handler for subagent completion

### 🧠 Auto Memory (`projects/`)
Per-directory learned context and patterns - how Claude remembers your preferences

### ⚡ Commands (`commands/`)
Custom command definitions (claudeception, rams)

## Using This on a New Machine

### 1. Install Claude Code
Follow official installation instructions first.

### 2. Clone & Set Up
```bash
# Clone to temporary location
git clone https://github.com/Tobybarnes/Claude4lyfe.git ~/.claude-backup

# Copy configuration files
cp -r ~/.claude-backup/* ~/.claude/

# Set permissions for hooks
chmod +x ~/.claude/*.sh
chmod +x ~/Documents/MyEP/projects/noisy-claude/*.sh  # if you use noisy-claude

# If using symlinked skills (optional):
# rm ~/.claude/skills
# ln -s ~/Documents/myEP/.claude/skills ~/.claude/skills
```

### 3. Configure Credentials & MCP Servers

**API Credentials** (not in repo for security):
```bash
# For Shopify:
/opt/dev/bin/user/devx llm-gateway print-token --key

# Or configure your personal API key
```

**MCP Servers** (configs already set in settings.json):
- Install vault-mcp for your knowledge vault
- Install figma-mcp for Figma integration
- Install gworkspace-mcp for Google Workspace

### 4. Test Your Setup
```bash
claude

# Try some skills:
/newday
/weekly-update
/gsd

# Check if sounds work (agent-sims-hook)
```

### Detailed Migration Guide
See `MIGRATION_GUIDE.md` for comprehensive step-by-step instructions.

## What's NOT Included (Security)

For security, these are excluded via `.gitignore`:

❌ `.credentials.json` - API keys and tokens
❌ `history.jsonl` - Full conversation history
❌ `projects/*/tool-results/` - May contain sensitive MCP data
❌ Cache, debug, telemetry, and temporary files

## Keeping Configuration in Sync

### After making changes on this machine:
```bash
cd ~/.claude

# Stage your changes
git add settings.json commands/ skills/

# Commit
git commit -m "Update configuration"

# Push (requires switching to personal account)
gh auth switch --user Tobybarnes
git push
gh auth switch --user Tobybarnes-Shop  # switch back to work
```

### Pull updates on another machine:
```bash
cd ~/.claude
git pull
```

### Regular backups:
Consider updating the repo monthly or after significant changes to skills/settings.

## Repository Structure

```
Claude4lyfe/
├── README.md                  # This file
├── .gitignore                 # Protects sensitive data
├── settings.json              # Main Claude configuration
├── settings.local.json        # Local overrides
├── projects/                  # Auto memory (per-directory context)
│   ├── -Users-tobybarnes-shop/memory/
│   └── -Users-tobybarnes-shop-Documents-myEP/memory/
├── commands/                  # Custom commands
│   ├── claudeception.md
│   └── rams.md
├── skills/                    # 22 productivity skills
│   ├── newday/
│   ├── weekly-update/
│   ├── gsd/
│   │   └── references/       # Comprehensive GSD docs
│   ├── figma-review/
│   ├── meeting-notes/
│   ├── skill-architect/
│   └── ... and 16 more
├── agent-sims-hook.sh        # Status sounds (working/thinking/offline)
├── notify.sh                 # Notifications
├── MIGRATION_GUIDE.md        # Detailed migration instructions
├── WHATS_PRESERVED.md        # What transfers between machines
└── create-migration-bundle.sh # One-command backup bundler

Total: 22 skills, 49 files, 9,451 lines of custom skill definitions
```

## What Makes This Special

This isn't just configuration - it's the **relationship**:

- 📝 **Auto memory** - Claude remembers patterns from our conversations
- 🎯 **Custom skills** - Workflows tuned to how you work
- 🔊 **Sounds** - The audio feedback that makes it feel alive
- 🔌 **Integrations** - Direct access to vault, Figma, Google Workspace
- 📋 **Context** - Project-specific working agreements

All of this transfers to a new machine. The way we work together continues.

## Notes

- This is my personal Claude configuration
- Includes learned patterns and preferences from actual use
- Skills are production-tested productivity tools
- Keep credentials and sensitive data out of git
- Update regularly to preserve latest learnings

---

**Created:** 2026-02-12
**Skills:** 22 custom productivity workflows
**Lines of Code:** 9,451
**Status:** Active & evolving

Built with Claude Sonnet 4.5
