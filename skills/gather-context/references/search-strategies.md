# Search Strategies

Tips for maximizing search effectiveness across all tools.

---

## QMD (Vault Semantic Search)

QMD indexes the entire MyEP vault. Use it first for existing knowledge.

**Keyword search** (exact matches, fast):
```bash
qmd search "campaign builder" --md -n 10
qmd search "James feedback" --md -n 5
```

**Semantic search** (meaning-based, finds related concepts):
```bash
qmd vsearch "how does autopilot handle merchant onboarding" --md -n 10
qmd vsearch "Carl's expectations for design leadership" --md -n 5
```

**Tips:**
- Use keyword search for specific terms (project names, people, features)
- Use semantic search for conceptual questions ("what's the strategy for...")
- Combine both for comprehensive coverage
- Check the docid in results to avoid reading duplicate chunks from the same file

---

## Slack Search

Use `mcp__playground-slack-mcp__get_messages` with action `search`.

**Search patterns:**
- Simple: `query: "campaign builder"`
- Person + topic: `query: "from:@james campaign builder"`
- Channel-scoped: `query: "in:#mm-ads-design campaign builder"`
- Date-scoped: `query: "campaign builder after:2026-02-01"`
- Combined: `query: "from:@carl campaign builder after:2026-02-15"`

**Channel guide by topic area:**

| Topic Area | Primary Channels |
|-----------|-----------------|
| Design leadership, Carl feedback | #mm-design-leads |
| Ads, Campaign Builder, Shop Campaigns | #mm-ads-design |
| Messaging, Automations | #mm-messaging-pillar |
| Autopilot, Growth Agent | #mm-growth-design, #mm-autopilot-design |
| Design crits, async feedback | #mm-design-async-feedback |
| Hiring, recruiting | #product-design_merchant-marketing_hiring |
| Product Sourcing, Product Network | Check with Jeff's channels |

**For threads:** If you find a key message, get the full thread:
```
action: "thread", channel: "<channel_id>", ts: "<message_ts>"
```

---

## Google Drive

Use `mcp__gworkspace-mcp__search_drive`.

**Query syntax** (Drive API, NOT plain text):
- `name contains "Campaign Builder"` — file name search
- `fullText contains "autopilot launch"` — content search
- `name contains "Q2" and name contains "planning"` — combined name search
- `modifiedTime > "2026-02-01T00:00:00"` — recent files only

**What to look for:**
- Planning docs and roadmaps
- Review decks (Slides)
- Meeting notes and transcripts
- Tech briefs and RFCs
- Spreadsheets with data/metrics

**Read files** with `mcp__gworkspace-mcp__read_file`:
- Use `format: "markdown"` for docs
- Use `format: "csv"` for sheets

---

## Google Calendar

Use `mcp__gworkspace-mcp__calendar_events`.

**When to search calendar:**
- Finding upcoming review dates
- Identifying who's in recurring meetings
- Finding meeting transcripts (search Drive for the meeting title)

---

## Figma

Use `mcp__figma-mcp__get_design_context` or `mcp__figma-mcp__get_screenshot`.

**When to search Figma:**
- Design review prep (get current state of explorations)
- Understanding what a team has been working on
- Capturing visual artifacts for a context report

**Finding Figma links:**
- Search Slack for "figma.com" in relevant channels
- Check Google Docs for embedded Figma links

---

## Search Order (Recommended)

1. **QMD first** — check what you already know in the vault
2. **Provided resources** — consume everything the user gave you
3. **Slack** — most current, most conversational
4. **Google Drive** — structured documents, decisions, plans
5. **Calendar** — timeline and people context
6. **Figma** — visual artifacts if design-relevant
