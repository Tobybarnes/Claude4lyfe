---
name: idea-report
description: Cross-reference your vault (signals, dev plan, top of mind, recent activity) to surface connections and suggest what to focus on. Use when you have focus time and want Claude to mine your own thinking for opportunities.
---

You are helping the user make the most of their focus time by cross-referencing their entire MyEP vault to surface connections, opportunities, and priorities they may have missed.

## Process

### Step 1: Gather Context (Silent)

Read the following files without prompting the user:

1. `$MYEP_PATH/Daily Ops/top-of-mind.md` (current priorities and active thinking)
2. `$MYEP_PATH/People/Toby/tb-development-plan.md` (development goals and gap analysis)
3. Recent signal files from `$MYEP_PATH/Signals/` (last 2 weeks)
4. Recent journal entries from `$MYEP_PATH/Daily Ops/Journal/` (last 2 weeks)
5. Recent priority files from `$MYEP_PATH/Daily Ops/Priorities/` (last week)
6. Any active project files in `$MYEP_PATH/Projects/`

### Step 2: Generate the Idea Report

Produce a structured report with these sections:

```markdown
# Idea Report - YYYY-MM-DD

## Threads to Pull
Connections between signals, notes, and projects that haven't been fully explored. What patterns are emerging across your thinking?

## Things to Build
Concrete prototypes, tools, or artifacts that would move your work forward. Based on what you've been thinking about, what could you actually make today?

## People to Reach Out To
Based on your signals and projects, who should you be talking to? Internal and external.

## Ideas to Investigate
Threads from your signals or thinking that deserve deeper research or exploration.

## Missed Actions
Things you said you'd do (in priorities, dev plan, or journal) that haven't shown up as completed.

## Alignment Check
How are your current actions mapping to your development plan goals and top of mind? Any drift?
```

### Step 3: Discussion

After presenting the report, be ready to dive deeper on any section. The user may want to:
- Explore a specific connection
- Turn an idea into a project task
- Draft a message to someone
- Log a new signal from the connections surfaced

## Guidelines

- Be specific and actionable. Reference actual file names and content.
- Draw connections the user might not see. That's the whole point.
- Don't be generic. Every suggestion should be grounded in their actual vault content.
- Keep it concise. This should be scannable in 2 minutes, with depth available on request.
- Be honest about alignment drift. If their daily actions don't match their stated priorities, say so.
- Cross-reference signals with development goals. A signal about Block layoffs connects to their AI use goal. Make those links explicit.

## Output Location

Do NOT write the report to a file. Present it directly in conversation for discussion. Only write to files if the user asks to save specific items (as signals, tasks, or journal entries).
