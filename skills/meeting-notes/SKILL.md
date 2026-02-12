---
name: meeting-notes
description: Process Gemini meeting transcripts - retrieve from Drive, create recaps, extract signals for vault, and summarize action items. Use when user wants to process meeting notes.
---

You are helping the user work with Gemini meeting notes and transcripts from Google Drive.

This skill handles the full meeting notes workflow:
1. **Retrieve** - Find and fetch meeting transcripts from Google Drive
2. **Recap** - Summarize key discussion points
3. **Signals** - Extract strategic observations for the vault
4. **Actions** - Identify and track next steps

## Process

### Phase 1: Retrieve the Transcript

**Get the meeting reference** from the user:
- Meeting name/title (e.g., "Kazden / Julian - Design Review")
- Date of the meeting (e.g., "yesterday's meeting with Sarah")
- Calendar event reference (e.g., "my 11am meeting today")
- Direct search terms (e.g., "Q1 roadmap discussion")

**Search for the transcript** using Google Workspace MCP:

**Option A: If user provides specific meeting details:**
- Use `mcp__gworkspace__search_drive` with query patterns:
  - `name contains "Transcript"` for meeting transcripts
  - `name contains "Gemini"` for Gemini-generated notes
  - `fullText contains "[meeting topic]"` for content search
  - Combine with date context: `name contains "2026-01-15"` or similar

**Option B: If user provides calendar reference:**
- First use `mcp__gworkspace__calendar_events` to find the meeting:
  - `time_min` and `time_max` for date range
  - Extract meeting title and date
- Then search Drive for transcripts matching that title/date

**Common search patterns:**
```
name contains "Transcript" AND name contains "[Meeting Title]"
name contains "Gemini" AND name contains "[Date]"
fullText contains "[attendee name]" AND name contains "Transcript"
```

**Present search results:**
- Show matching files with titles and dates
- If multiple results, ask user to confirm which one
- If no results, suggest alternative search terms

**Retrieve the transcript:**
- Use `mcp__gworkspace__read_file` with:
  - `file_id`: the selected document's ID
  - `format`: "markdown" for best readability
- Handle multi-tab documents by reading all tabs

### Phase 2: Create the Recap

After retrieving the transcript, generate a structured recap with TL;DR, key discussion points, decisions made, and open questions.

See [references/templates.md](references/templates.md) for the full recap structure.

### Phase 3: Extract Signals

Review the transcript for strategic observations worth capturing in the vault.

**Signal Categories to Look For:**
- **Design Signals** - Design trends, patterns, user experience insights
- **Engineering Signals** - Technical approaches, architecture decisions, tooling
- **AI Signals** - AI/ML developments, automation opportunities, agentic patterns
- **Shopify Signals** - Company strategy, org changes, product direction
- **Tech Industry Signals** - Industry trends, competitive landscape

**For each potential signal found, ask the user:**
> "I noticed [observation]. Would you like to log this as a [Category] signal?"

**If yes, create signal file** at `$MYEP_PATH/Signals/[Category]/YYYY-MM-DD-slug.md` using the format in [references/templates.md](references/templates.md).

### Phase 4: Summarize Action Items

Extract all action items, commitments, and next steps from the transcript. Include owner, action, due date, and status. See [references/templates.md](references/templates.md) for format.

### Phase 5: Save to Meetings Folder

Create a complete meeting notes file at `$MYEP_PATH/Meetings/YYYY-MM-DD-meeting-topic.md` using the full template in [references/templates.md](references/templates.md).

## Google Meet Naming Conventions

Google Meet transcripts are typically saved with these patterns:
- `[Meeting Title] - Transcript`
- `Meeting transcript - [Meeting Title] - [Date]`
- Gemini notes: `[Meeting Title] - Gemini notes`

## Smart Defaults

- Default time range for calendar searches: last 7 days
- Prioritize recently modified files (transcripts appear after meetings)
- Search both "Transcript" and "Gemini" naming patterns
- If meeting title has slashes (/), search for parts individually

## Error Handling

**If no transcript found:**
- Confirm the meeting exists in calendar
- Check if Google Meet recording/transcription was enabled
- Suggest checking "Meet Recordings" folder in Drive
- Note: Transcripts may take a few minutes to appear after meeting ends

**If multiple matches:**
- Present options with dates and sizes
- Ask user to select the correct one

**If file access fails:**
- Check file permissions
- Provide the web view link for manual access

## Workflow Options

After processing, offer these options:

1. **Quick Recap Only** - Just summarize the meeting
2. **Full Processing** - Recap + signals + actions + save to Meetings
3. **Signal Hunt** - Focus on extracting strategic observations
4. **Action Tracker** - Just extract and organize action items

**Ask the user:** "How would you like to process this meeting?"

## Integration with Other Skills

- Use `/log-signal` patterns for signal extraction
- Creates files compatible with `/project-task` for action item tracking
- Meeting notes can feed into `/journal-entry` reflections
- Signals discovered feed into the broader Signals system

## Guidelines

- Be conversational - confirm understanding before processing
- Preserve nuance - don't oversimplify complex discussions
- Attribute clearly - note who said what when relevant
- Be selective with signals - only capture truly strategic observations
- Make action items specific and actionable
- Always provide the source link back to the original transcript
