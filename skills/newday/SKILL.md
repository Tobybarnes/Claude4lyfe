---
name: newday
description: Start your day with intention. Reflect on yesterday's insights (optional) and set 1-3 priorities for today (required). Use when starting your day, planning your morning, or when user says "newday", "start my day", or "morning routine".
---

You are helping the user start their day with intention by combining reflection on yesterday with focus for today.

This skill captures insights from the previous day (journal) and sets 1-3 priorities for today (focus areas).

## Process

### Part 1: Yesterday's Insights (Optional)

1. **Ask about yesterday:**
   - What stood out from yesterday?
   - Any key learnings, decisions, or observations?
   - Any patterns or insights worth capturing?

2. **Help them articulate the insight:**
   - What's the core takeaway?
   - Why does it matter for their work/career?
   - Any implications going forward?

3. **If they have something to capture**, treat it like a career memo:
   - Focus on professional insights and learnings
   - Include strategic implications
   - Connect to broader patterns or themes
   - Keep it concise but substantive

4. **If they want to skip reflection**, that's fine - move straight to priorities

### Part 2: Today's Priorities (Required)

5. **Ask about today's focus:**
   - What are the 1-3 most important things to accomplish today?
   - What will move important work forward?

6. **Help them refine if needed:**
   - Are they specific enough? ("Draft Q2 strategy" not "Work on strategy")
   - Are they achievable in one day?
   - Are they truly priorities (high impact)?
   - Are there only 1-3 items? (Push back if more)

### Part 3: Write to Files

7. **Create journal file** if reflection provided:
   - Location: `$MYEP_PATH/Daily Ops/Journal/YYYY-MM-DD.md` (yesterday's date)

8. **Add yesterday's reflection** in this format:

```markdown
# YYYY-MM-DD - [Title/Theme]

[Career memo content - their insights, learnings, patterns, reflections]

**Related:**
- [Any connections to projects, signals, or themes]
- Tags: #relevant #tags

---
```

9. **Create priorities file**:
   - Location: `$MYEP_PATH/Daily Ops/Priorities/YYYY-MM-DD.md` (today's date)

10. **Add today's priorities** in this format:

```markdown
# Priorities - YYYY-MM-DD (Day Name)

## Focus Areas

1. [Priority 1]
2. [Priority 2]
3. [Priority 3]

## End of Day

- [ ] Priority 1 completed
- [ ] Priority 2 completed
- [ ] Priority 3 completed

**Notes:**
[Any end-of-day reflections]
```

11. **Confirm** the day is set up and encourage focused execution

## Guidelines

- Keep it quick and focused - this should take 3-5 minutes total
- Yesterday's reflection is optional - some days won't have insights to capture
- Today's priorities are required - always set 1-3 focus areas
- Push back gently if they list more than 3 priorities
- Help make priorities specific and actionable
- Use yesterday's date for journal entries
- Use today's date for priorities
- Create a smooth transition from reflection to intention

## Example Flow

**Good flow:**
- User shares: "Yesterday I noticed all three merchant calls struggled with the same problem..."
- You help them articulate the insight and implications
- You write it to journal with yesterday's date
- You ask: "Great insight captured. Now, what are your 1-3 priorities for today?"
- User shares priorities
- You help refine if needed
- You write to priorities file with today's date
- You confirm: "Your day is set. Yesterday's insight captured, and you're focused on [summarize priorities]."

**Quick flow (no reflection):**
- User says: "No major insights yesterday, just want to set priorities"
- You skip journal and move straight to priorities
- You write priorities to file
- You confirm: "Priorities set. Stay focused on these 1-3 things today."

## Priority Best Practices

**Good priorities:**
- "Complete merchant research synthesis for leadership review"
- "Design review prep: 3 key alternatives with rationale"
- "1:1 with Sarah - align on Q1 outcomes"

**Too vague:**
- "Work on project"
- "Meetings"
- "Catch up on emails"

**Too many:**
If they list 5+ things, ask: "Which 1-3 of these are truly the highest priority today?"

**Too small:**
If they list trivial tasks, ask: "What's the bigger outcome you're trying to achieve?"

## Journal Best Practices

**Good career memos:**
"Noticed a pattern across three merchant conversations this week: they all struggle to articulate their brand story in a way that translates to marketing tactics. This suggests an opportunity for tools or frameworks that bridge brand strategy and tactical execution."

**Too superficial:**
"Had three merchant calls today. Interesting conversations."

Focus on insights, patterns, decisions, and implications - not just documentation of events.
