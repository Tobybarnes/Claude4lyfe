# myEP Skills

Custom Claude Code skills for quick captures and daily operations.

---

## Daily Rhythm Skills

### `/newday`
**Start your day with intention (3-5 min)**
- Optional reflection on yesterday's insights
- Required: Set 1-3 priorities for today
- Combines journal + priorities in one flow

**Best time:** First thing in morning
**Output:** `Daily Ops/Journal/YYYY-MM-DD.md` + `Daily Ops/Priorities/YYYY-MM-DD.md`

---

### `/set-priorities`
**Define 1-3 focus areas for the day**
- Strategic focus (not task list)
- Quality over quantity
- Creates daily priority file

**Best time:** Morning (or use `/newday` instead)
**Output:** `Daily Ops/Priorities/YYYY-MM-DD.md`

---

### `/journal-entry`
**Write career memos and reflections**
- Strategic career thinking
- Professional insights
- Learning synthesis

**Best time:** Evening or weekly
**Output:** `Daily Ops/Journal/YYYY-MM-DD.md`

---

## Capture Skills

### `/log-signal`
**Capture strategic observations**
- Design, Shopify, Tech Industry, Merchant Marketing
- Pattern recognition across signals
- Strategic implications

**Use when:** You notice a trend, shift, or important observation
**Output:** `Signals/[Category]/YYYY-MM-DD-slug.md`

---

### `/log-development`
**Track learning activities**
- Courses, training, practice
- Skills being developed
- Time investment
- Key learnings

**Use when:** You complete learning activity
**Output:** `Craft/development-log.md`

---

## Project Skills

### `/project-context`
**Add context to project files**
- Background information
- Updates and progress
- Links to resources

**Use when:** Adding project context or updates
**Output:** Updates project file

---

### `/project-decision`
**Log decisions and rationale**
- What was decided
- Why (reasoning)
- Alternatives considered
- Implications

**Use when:** Making important project decision
**Output:** Appends to project file

---

### `/project-task`
**Add tasks to project**
- Action items
- Owners
- Due dates

**Use when:** Identifying project tasks
**Output:** Updates project file

---

## Design Review Skills

### `/figma-review`
**Review Figma designs with dual-perspective feedback**
- Fetches design from Figma URL
- Generates feedback in two styles:
  - **Toby Barnes style**: Collaborative, curious, grounded in evidence
  - **Carl Rivera (CDO) style**: Strategic, ambitious, craft-focused
- Auto-saves to Design Reviews folder

**Use when:** Reviewing designs before sharing with teams or stakeholders
**Output:** `Craft/Design Reviews/YYYY-MM-DD-[slug].md`

---

## Craft Skills

### `/audit-skill`
**Assess skill against mastery criteria**
- Current mastery level
- Evidence
- Development needs
- Growth goals

**Use when:** Want to assess specific skill
**Output:** Updates skills inventory

---

### `/update-gap`
**Update gap analysis**
- New requirements
- Current capabilities
- Development priorities
- Gap closure progress

**Use when:** Role expectations change
**Output:** Updates role requirements

---

## Meetings

### `/schedule-meeting`
**AI executive assistant for scheduling**
- Find mutual availability
- Book with Google Meet
- Create meeting prep file

**Use when:** Need to schedule a meeting
**Output:** Calendar event + `Meetings/YYYY-MM-DD-person-topic.md`

---

### `/meeting-notes`
**Process Gemini meeting transcripts**
- Retrieve transcripts from Google Drive
- Create structured recaps with key points
- Extract signals for vault capture
- Summarize action items and next steps

**Use when:** After a meeting, to process notes and capture insights
**Output:** `Meetings/YYYY-MM-DD-meeting-topic.md` + optional `Signals/[Category]/YYYY-MM-DD-slug.md`

**Workflow options:**
1. Quick Recap Only - Just summarize
2. Full Processing - Recap + signals + actions + save
3. Signal Hunt - Focus on strategic observations
4. Action Tracker - Just extract action items

---

## Skill Usage Patterns

### Morning Routine
1. `/newday` (3-5 min) - Reflect + set priorities
   - OR `/set-priorities` (2 min) - Just set priorities
2. Email triage (10 min)
3. Calendar review (5 min)

### Throughout Day
- `/log-signal` - When you notice important observations
- `/project-*` - As project work happens
- `/schedule-meeting` - When meetings need booking
- `/meeting-notes` - After meetings, to process transcripts

### Evening/Weekly
- `/journal-entry` - Career reflection (as needed)
- `/log-development` - After learning activities

---

## Integration

**Skills feed into each other:**
- Signals → Patterns → Strategic insights
- Development log → Growth tracking
- Meeting notes → Signals + Action items
- All skills → Career OS system

**The system compounds:**
- Daily captures become weekly insights
- Weekly insights become quarterly outcomes
- Quarterly outcomes become annual impact

---

**Use skills consistently. Small daily captures compound to strategic clarity.**
