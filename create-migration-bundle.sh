#!/bin/bash

# Claude Code Migration Bundle Creator
# Creates a portable archive of your personalized Claude setup

set -e

BUNDLE_NAME="claude-migration-$(date +%Y%m%d-%H%M%S)"
TEMP_DIR="/tmp/$BUNDLE_NAME"
BUNDLE_PATH="$HOME/$BUNDLE_NAME.tar.gz"

echo "🎒 Creating Claude Code migration bundle..."
echo ""

# Create temp directory structure
mkdir -p "$TEMP_DIR/.claude"
mkdir -p "$TEMP_DIR/Documents/myEP/.claude"

# Copy core .claude directory (excluding cache, temp files, and credentials)
echo "📦 Copying core configuration..."
rsync -av --progress \
  --exclude='.credentials.json' \
  --exclude='cache/' \
  --exclude='debug/' \
  --exclude='session-env/' \
  --exclude='shell-snapshots/' \
  --exclude='telemetry/' \
  --exclude='stats-cache.json' \
  --exclude='statsig/' \
  --exclude='paste-cache/' \
  --exclude='file-history/' \
  --exclude='downloads/' \
  --exclude='tasks/' \
  --exclude='todos/' \
  --exclude='teams/' \
  --exclude='plans/' \
  "$HOME/.claude/" \
  "$TEMP_DIR/.claude/"

# Copy custom skills
echo "🎯 Copying custom skills..."
if [ -d "$HOME/Documents/myEP/.claude/skills" ]; then
  rsync -av --progress \
    "$HOME/Documents/myEP/.claude/skills/" \
    "$TEMP_DIR/Documents/myEP/.claude/skills/"
fi

# Find and copy CLAUDE.md files
echo "📋 Finding CLAUDE.md files..."
CLAUDE_MDS=$(find "$HOME/Documents/myEP" -name "CLAUDE.md" -type f 2>/dev/null || true)
if [ -n "$CLAUDE_MDS" ]; then
  echo "Found CLAUDE.md files:"
  echo "$CLAUDE_MDS" | while read -r file; do
    rel_path="${file#$HOME/}"
    mkdir -p "$TEMP_DIR/$(dirname "$rel_path")"
    cp "$file" "$TEMP_DIR/$rel_path"
    echo "  ✓ $rel_path"
  done
fi

# Copy hook scripts
echo "🔔 Copying hooks..."
cp "$HOME/.claude/"*.sh "$TEMP_DIR/.claude/" 2>/dev/null || true
if [ -d "$HOME/.quick-ping" ]; then
  mkdir -p "$TEMP_DIR/.quick-ping"
  cp -r "$HOME/.quick-ping/"* "$TEMP_DIR/.quick-ping/" 2>/dev/null || true
fi

# Create the bundle info file
cat > "$TEMP_DIR/BUNDLE_INFO.txt" << EOF
Claude Code Migration Bundle
Created: $(date)
From: $(hostname)
User: $(whoami)

Contents:
- Core configuration (~/.claude/)
- Custom skills (~/Documents/myEP/.claude/skills/)
- Project instructions (CLAUDE.md files)
- Hook scripts (sounds and notifications)
- Auto memory (project-specific learning)

Next Steps:
1. Extract this archive to your home directory on the new machine
2. Reconfigure API credentials
3. Reinstall MCP servers (vault-mcp, figma-mcp, gworkspace-mcp)
4. Make hook scripts executable: chmod +x ~/.claude/*.sh
5. Test with: claude

See MIGRATION_GUIDE.md for detailed instructions.
EOF

# Copy the migration guide
cp "$HOME/.claude/MIGRATION_GUIDE.md" "$TEMP_DIR/" 2>/dev/null || true

# Create the archive
echo ""
echo "🗜️  Creating archive..."
cd /tmp
tar -czf "$BUNDLE_PATH" "$BUNDLE_NAME/"

# Cleanup
rm -rf "$TEMP_DIR"

# Show results
BUNDLE_SIZE=$(du -h "$BUNDLE_PATH" | cut -f1)
echo ""
echo "✅ Migration bundle created!"
echo ""
echo "📦 Bundle: $BUNDLE_PATH"
echo "💾 Size: $BUNDLE_SIZE"
echo ""
echo "📤 Next steps:"
echo "  1. Copy this file to your new machine"
echo "  2. Extract: tar -xzf $BUNDLE_NAME.tar.gz"
echo "  3. Move contents: mv $BUNDLE_NAME/.claude ~/. && mv $BUNDLE_NAME/Documents ~/."
echo "  4. Follow MIGRATION_GUIDE.md for final setup"
echo ""
echo "🔐 Note: API credentials are NOT included for security"
echo ""
