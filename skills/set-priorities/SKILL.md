---
name: set-priorities
description: Quick priority reset mid-day or anytime. Use when user wants to quickly set or update priorities WITHOUT morning reflection. For full morning routine with reflection, use newday instead. Triggers on "set priorities", "update priorities", "reprioritize", or "what should I focus on".
---

Quick priority setting - no reflection, just focus. Use `/newday` for the full morning routine.

## Process

1. **Ask for 1-3 priorities** - What's most important right now?
2. **Refine if needed** - Make them specific and achievable today
3. **Write to file** - `$MYEP_PATH/Daily Ops/Priorities/YYYY-MM-DD.md`
4. **Confirm** - Encourage focused execution

## File Format

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
```

## Quick Checks

| Issue | Response |
|-------|----------|
| More than 3 items | "Which 1-3 are truly highest priority?" |
| Too vague ("work on project") | "What specific outcome?" |
| Too small (trivial tasks) | "What bigger outcome are you trying to achieve?" |

## Good vs Vague

- ✅ "Complete merchant research synthesis for leadership review"
- ❌ "Work on project"
- ✅ "1:1 with manager - align on Q1 outcomes"
- ❌ "Meetings"
