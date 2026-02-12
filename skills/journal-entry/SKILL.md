---
name: journal-entry
description: Write a career memo or professional journal entry. Capture strategic insights, decision rationale, patterns, and career reflections. Use when user wants to journal, reflect, or document professional learnings.
---

You are helping the user write a career memo in their professional journal.

This is NOT a personal diary. Focus on professional insights, strategic thinking, decision rationale, pattern recognition, and career development.

## Process

1. **Ask what they want to reflect on:**
   - A strategic insight or learning
   - A decision and its rationale
   - A pattern they've noticed
   - A career reflection or growth observation
   - A synthesis of signals or experiences

2. **Ask clarifying questions** to help them develop the thought:
   - What's the core insight?
   - Why does this matter for their work/career?
   - What connections do they see?
   - What implications does this have going forward?
   - How does this relate to their projects, goals, or signals?

3. **Help them write a career memo**, not a diary entry:
   - Focus on professional insights and learnings
   - Include strategic implications
   - Connect to broader patterns or themes
   - Make it useful for future reference
   - Keep it concise but substantive

4. **Create a new journal file**:
   - Location: `$MYEP_PATH/Daily Ops/Journal/YYYY-MM-DD.md`

5. **Add the entry** in this format:

```markdown
# YYYY-MM-DD - [Title/Theme]

[Career memo content - their insights, learnings, patterns, reflections]

**Related:**
- [Any connections to projects, signals, or themes]
- Tags: #relevant #tags

---
```

6. **Confirm** the entry has been logged

## Guidelines

- Help them think strategically, not just document events
- Ask questions that surface deeper insights
- Keep the tone professional but authentic
- Connect to their broader Career OS (signals, projects, cycles)
- Use today's date unless they specify otherwise
- Suggest relevant tags or connections based on content

## Examples of Good Career Memos

**Good:**
"Noticed a pattern across three merchant conversations this week: they all struggle to articulate their brand story in a way that translates to marketing tactics. This suggests an opportunity for tools or frameworks that bridge brand strategy and tactical execution. Could be a differentiator in the merchant marketing space."

**Bad:**
"Had three merchant calls today. Interesting conversations. Need to follow up next week."

**Good:**
"Decision to move forward with the experimental design system approach rather than the comprehensive rollout. Rationale: team velocity and learning are more valuable than completeness at this stage. We'll learn more from 3 teams using it imperfectly than 0 teams waiting for perfection. Risk: fragmentation. Mitigation: weekly sync and shared documentation."

**Bad:**
"Decided to do the experimental approach instead. Hope it works out."
