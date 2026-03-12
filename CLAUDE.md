# CLAUDE.md (Global)

## General Rules

Do NOT autonomously rewrite READMEs, rename repos, or make changes beyond what was explicitly requested. Ask before making supplementary changes.

## Writing & Content

Never write in AI-slop style (staccato fragments, buzzword-heavy, LinkedIn-bro tone). Write in a natural, conversational voice. When drafting content for me, match my actual writing style — ask for examples if needed before drafting.

## Debugging

When debugging, diagnose the root cause proactively using available tools before asking me to paste output or restart. Check logs, cache files, and configs yourself first.

## MCP Troubleshooting

When MCP servers fail to connect, check for stale auth cache files FIRST before suggesting restarts or token regeneration. Common locations: ~/.cache/, ~/.config/, and project-local .auth files.
