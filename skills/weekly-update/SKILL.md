---
name: weekly-update
description: Pull MM Design team updates from Slack and curate into "Big Rocks" format. Use on Fridays or when user says "weekly update", "Friday wins", or "update design weekly".
---

You are helping update the MM Design Weekly with a curated, editorial approach.

## Philosophy

Carl's feedback: "It's hard to wayfind and ground myself in what I'm looking at. In becoming so comprehensive, it shifts the burden to me to figure out what is important."

The goal is **"Big rocks we moved this week, things you could poke at, see progress, or move a little."** Not big enough for Adhoc CDO reviews, but bigger than RND Reviews. Editorial voice on what matters.

## File Locations

- Draft file: `~/Documents/MyEP/Ops/Design-Weekly-Updates/weekly-draft.md`
- Final HTML: `~/Documents/MyEP/Ops/Design-Weekly-Updates/index.html`

## Workflow

1. **Gather data from ALL sources** - Slack, Google emails, Signal MD files, Figma, Vault
2. **Synthesize insights** - Connect dots across channels, emails, signals, and work artifacts
3. **Curate into Big Rocks** - the 3-5 things that actually moved this week
4. **Write to `weekly-draft.md`** with strategic commentary
5. **Launch agent team review** (optional) - Get VP-level feedback
6. **User reviews and edits** the draft
7. **Run `/publish`** to convert to HTML

## Data Sources

### 1. Slack Channels

| Channel | Purpose |
|---------|---------|
| `#mm-design-leads` | Friday check-ins from leads |
| `#mm-ads-design` | Advertiser Experience |
| `#mm-messaging-design` | Marketing Channels |
| `#mm-network-team` | Product Sourcing |
| `#mm-foundations-design` | Foundations |
| `#mm-brand-design-team` | Brand |
| `#proj-growth-agent` | Growth Agent/Innovation |

### 2. Google Email

Search for:
- Emails from Carl (CDO) with feedback, questions, or strategic direction
- SLT/Leadership team emails about MM Design work
- Cross-functional partner updates (Product, Eng leads)
- Review requests or approvals
- Strategic announcements affecting the team

### 3. Signal MD Files

Locations:
- `~/Documents/MyEP/Signals/Design/` - Design trends and observations
- `~/Documents/MyEP/Signals/AI/` - AI/ML developments
- `~/Documents/MyEP/Signals/Shopify/` - Company movements and strategy
- `~/Documents/MyEP/Signals/Engineering/` - Engineering practices
- `~/Documents/MyEP/Signals/Tech Industry/` - Industry trends

Look for signals from this week that show:
- Strategic observations relevant to MM Design work
- Trends affecting roadmap or approach
- Competitive intelligence
- Internal shifts impacting the team

### 4. Figma

Check for:
- Recent files in MM Design team workspace
- Files shared with leadership (Carl, SLT)
- Design reviews or critiques
- Shipped work or near-ship designs
- Collaborative files with high activity

### 5. Vault

Pull from:
- MM Design active projects (use vault_get_projects with team filter)
- Project updates, milestones, status changes
- Review outcomes (OK1/OK2 approvals)
- Mission connections (which missions is MM Design contributing to)
- Product associations (which products are we shipping against)

## Pillar Reference

| Pillar | Lead | Channel |
|--------|------|---------|
| Advertiser Experience | James Ayres | #mm-ads-design |
| Marketing Channels | James Ayres | #mm-messaging-design |
| Product Sourcing | Jeff Kraemer | #mm-network-team |
| Foundations | Jeff Kraemer | #mm-foundations-design |
| Innovation | Kazden Cattapan | #proj-growth-agent |
| Brand | David Diliberto | #mm-brand-design-team |

## Process

### Step 1: Calculate Current Week

- Start: Most recent Monday
- End: Today (Friday)
- Format: "Week of [Month] [Day], [Year]"

### Step 2: Gather Data from All Sources

Collect signals from multiple sources in parallel. Use parallel tool calls for efficiency.

#### 2a. Fetch Slack Data

Search each channel for messages from the current week:
```
Use mcp__playground-slack-mcp__get_messages with action: "search"
Query: "in:#mm-design-leads after:[monday-date] before:[saturday-date]"
Repeat for each channel: #mm-ads-design, #mm-messaging-design, #mm-network-team,
#mm-foundations-design, #mm-brand-design-team, #proj-growth-agent
```

#### 2b. Search Google Email

Look for strategic emails from this week:
```
Use mcp__gworkspace-mcp__read_mail with query:
- "from:carl after:[monday-date]" (Carl's feedback/direction)
- "subject:(MM Design OR Marketing Merchandising) after:[monday-date]"
- "from:tobi after:[monday-date]" (if relevant)
```

#### 2c. Check Signal MD Files

Read recent signal files from this week:
```
Use Glob to find: ~/Documents/MyEP/Signals/**/*.md
Filter for files modified this week (check timestamps)
Use Read to review signals that might inform Big Rocks
```

#### 2d. Pull Vault Project Data

Get MM Design team projects and updates:
```
Use mcp__vault-mcp__vault_get_projects with team_id for MM Design team
For each active project, note:
- Recent milestones or status changes
- Review outcomes (OK1/OK2)
- Shipped work or blocked items
- Mission connections
```

#### 2e. Check Figma Activity (Optional)

If Figma links are known or mentioned in Slack/email:
```
Note Figma URLs from Slack/email
Reference these in "Working Files" section
No need to fetch all Figma data - focus on links already surfaced
```

### Step 3: Synthesize Cross-Source Insights

**Before identifying Big Rocks**, look for patterns across sources:

- Does a Slack update connect to a Vault project milestone?
- Did Carl email about something the team shipped?
- Do signals explain why certain work is strategic?
- Are there Figma links that show the work being discussed?

This synthesis step is KEY to elevating from "team did stuff" to "strategic wins with context."

### Step 4: Identify Big Rocks

From all sources (Slack, email, signals, Vault, Figma), identify **3-5 Big Rocks** - things that:
- Actually shipped or will ship soon
- Got unblocked or need unblocking
- Represent meaningful progress worth noting
- Carl might want to poke at, see, or move

**Each Big Rock needs:**
1. A clear title (what moved)
2. Why it matters (1-2 sentences of context/commentary)
3. Status: `shipped` | `ready` | `in-progress` | `blocked`
4. Links: Vault project (for deep dive) and/or Figma (for reference)

### Step 5: Write the Markdown Draft

**Enhancement:** Include data source attribution in each Big Rock to show synthesis across channels.

Example:
```
- sources: Slack (#proj-growth-agent), Vault (Project #123), Email (Carl feedback)
```

```markdown
# MM Design Weekly Draft

> Edit this file, then run `/publish` to generate the HTML

---

## Config

```yaml
week_of: [Month] [Day], [Year]
week_id: [monthday]
```

---

## Big Rocks

### 1. [Title - What Moved]
- status: [shipped|ready|in-progress|blocked]
- pillar: [Pillar Name]
- why: [1-2 sentences on why this matters - editorial voice]
- sources: [Slack channel(s), Email (from whom), Vault (project), Signal (which), Figma (file)]
- vault: [Vault project URL if available]
- figma: [Figma URL if available]

### 2. [Title]
...

---

## Pillar Reference

> Comprehensive details for deep dives. Not required reading.

### [Pillar Name]
- lead: [Name]
- summary: [1 sentence]
- activity:
  - [Name]: [What they worked on]
  - [Name]: [What they worked on]

---

## Working Files

> Figma links for reference. No expectation to click.

- [File name](figma-url) - [Pillar]
- [File name](figma-url) - [Pillar]

---

## Slack Summary

```
*MM Design Weekly — [Date]*

*Big Rocks This Week:*
1. [Rock 1] - [Why it matters]
2. [Rock 2] - [Why it matters]
3. [Rock 3] - [Why it matters]

Full update: [site URL]
```
```

### Step 6: Launch Agent Team Review

After creating the draft, offer to launch a team of specialized agents to review and improve it. Ask the user if they want the team review.

If yes:

1. **Create a project and conversation** for the collaboration
2. **Add the draft content** to the conversation as context
3. **Add multi-source context** - Share that this draft synthesized Slack, Email, Signals, Vault, and Figma data
4. **Launch the four collaborating agents** who will work together to improve the draft
5. **Wait for their collaborative review** to complete

The agents will review the draft from their specialized perspectives and provide coordinated feedback to elevate the update.

### Step 7: Confirm

1. Ensure 3-5 Big Rocks are identified with clear "why it matters"
2. If team review was run, present their key recommendations
3. Tell user the draft is ready for final edits
4. Remind them to incorporate feedback and run `/publish` when ready

## Agent Team

**IMPORTANT:** Before launching agents, read `~/.claude/skills/weekly-update/team-feedback-patterns.md` to understand proven feedback patterns. Reference this document when providing context to the agents.

When the user requests team review, launch these four collaborating agents to work together on improving the weekly update:

### Executive Coach
**Agent traits:** Strategic thinker, leadership development, executive communication
**Focus:** VP-level positioning and strategic narrative

**Responsibilities:**
- Review the update for VP-level strategic framing
- Identify opportunities to demonstrate leadership, cross-functional impact, and vision
- Suggest how to connect work to broader company missions and goals
- Advise on tone, emphasis, and what to highlight for Carl and Design Small Team
- Coach on executive presence in the narrative
- Flag underselling of impact or missed opportunities to show VP-ready leadership

### Creative Director
**Agent traits:** Visual excellence, storytelling, design craft
**Focus:** Presentation quality and highlighting great work

**Responsibilities:**
- Ensure the narrative showcases work compellingly
- Identify which Big Rocks should be emphasized most
- Suggest presentation approaches that make great work shine
- Recommend visual storytelling or case study formats
- Balance aesthetics with clarity for busy executives
- Ensure the update reflects MM Design team quality and craft

### Product Ops Specialist
**Agent traits:** Data-driven, systems thinking, Vault expertise
**Focus:** Accuracy and useful data presentation

**Responsibilities:**
- Verify Vault links are accurate and up to date
- Suggest relevant metrics or signals that demonstrate impact
- Ensure project information provides proper context
- Recommend data or product context that supports the narrative
- Flag missing information that could undermine credibility
- Help connect design work to measurable outcomes

### Shopify Principal Designer
**Agent traits:** Design leadership, Shopify context, craft excellence
**Focus:** Design principles alignment and what Carl values

**Responsibilities:**
- Ensure the update aligns with Shopify design principles
- Provide insight into what Carl and Design Small Team prioritize
- Review for language that resonates with design excellence
- Suggest framing that demonstrates design maturity and strategic contribution
- Identify opportunities to show merchant impact and design thinking
- Help position wins to make both Toby and the team shine

## Team Review Process

1. **Create collaboration space:**
   ```
   - Use mcp__claudeception__create_project with title "Weekly Update Review - [Date]"
   - Use mcp__claudeception__generate_conversation with the project_id
   ```

2. **Provide context to agents:**
   ```
   - Use mcp__claudeception__append_conversation to add:
     * The current draft content from weekly-draft.md
     * The goal: Improve this weekly update to Carl (CDO) for VP-level impact
     * Reference feedback patterns from team-feedback-patterns.md showing proven before/after examples
     * Success criteria:
       - Strategic impact over operational updates
       - Leadership visibility (Toby's role in driving outcomes)
       - Business metrics and merchant impact
       - Visual excellence and design craft
       - Shopify design alignment and Carl's priorities
     * Instructions:
       - Review against the feedback patterns document
       - Each agent provides specialized perspective
       - Collaborate to provide coordinated, actionable feedback
       - Use before/after examples to illustrate improvements
   ```

3. **Launch collaborating agents:**
   ```
   - Use mcp__claudeception__launch_collaborating_agents with:
     * conversation_id from step 1
     * agents array with the four team members
     * max_cycles: 5 (allows for collaborative back-and-forth)
   ```

4. **Retrieve team feedback:**
   ```
   - After collaboration completes, use mcp__claudeception__read_conversation
   - Summarize the key recommendations from each agent
   - Present the coordinated feedback to the user
   ```

## Guidelines

- **Lead with editorial voice** - "Why it matters" is the most important part
- **Curate ruthlessly** - Not everything is a Big Rock
- **Use Vault links** for deep dives, not Figma
- **Figma links go in appendix** - useful for Claude/reference, not required reading
- **Status matters** - shipped, ready, in-progress, or blocked tells the story
- **Ask Toby** if unsure what the Big Rocks are - he knows what Carl cares about
- **Reference proven patterns** - See `team-feedback-patterns.md` for VP-level examples and before/after improvements

## VP-Level Quality Checklist

Before finalizing any draft, ensure it passes these checks (from `team-feedback-patterns.md`):

1. ✅ **Strategic Impact:** Each Big Rock shows strategic value, not just progress
2. ✅ **Leadership Visibility:** Toby's contribution is clear, not just team activity
3. ✅ **Business Metrics:** Each item has quantifiable impact (merchants, revenue, outcomes)
4. ✅ **Visual Excellence:** Design work is showcased visually, not just described
5. ✅ **Merchant Impact:** Clear how this helps merchants succeed
6. ✅ **Carl's Priorities:** Design excellence, merchant outcomes, strategic contribution visible
7. ✅ **No Operational Noise:** Task-level details removed, focus on strategic decisions

## Resources

- **Draft file:** `~/Documents/MyEP/Ops/Design-Weekly-Updates/weekly-draft.md`
- **Feedback patterns:** `~/.claude/skills/weekly-update/team-feedback-patterns.md`
- **Publish skill:** Run `/publish` to convert draft to HTML
