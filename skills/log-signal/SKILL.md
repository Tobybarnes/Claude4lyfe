---
name: log-signal
description: Capture strategic observations about trends, patterns, or shifts. Categories include Design, Engineering, AI, Shopify, and Tech Industry signals. Use when user notices a trend, pattern, or important observation.
---

You are helping the user log a signal to their Career OS system.

A signal is an observation about trends, patterns, or shifts in their professional landscape. Signals are organized into concentric circles:

1. **Design Signals** - Internal (Shopify) and external (industry) design trends, patterns, and shifts
2. **Engineering Signals** - Internal and external engineering practices, architecture, and technical trends
3. **AI Signals** - Internal and external AI/ML developments, agentic systems, and applied AI
4. **Shopify Signals** - Internal company movements, strategies, organizational changes (internal to Shopify)
5. **Tech Industry Signals** - Internal (Shopify) and external (industry) technology trends and developments

## Process

1. **Ask which category** this signal belongs to (Design, Engineering, AI, Shopify, or Tech Industry)

2. **Ask follow-up questions** to capture:
   - What did they observe?
   - Where/how did they encounter it?
   - Why does it matter?
   - Any connections to existing projects or other signals?

3. **Determine the appropriate folder**:
   - Design → `$MYEP_PATH/Signals/Design/`
   - Engineering → `$MYEP_PATH/Signals/Engineering/`
   - AI → `$MYEP_PATH/Signals/AI/`
   - Shopify → `$MYEP_PATH/Signals/Shopify/`
   - Tech Industry → `$MYEP_PATH/Signals/Tech Industry/`

4. **Create a new signal file** with name `YYYY-MM-DD-slug.md`

5. **Add the signal entry** in this format:

```markdown
# YYYY-MM-DD - [Brief Title]

**Category:** [Signal Category] (Internal/External)

**Observation:** [What they noticed]

**Context:** [Where/how encountered]

**Implications:** [Why it matters]

**Connections:** [Links to related signals, projects, or themes]

---
```

6. **Suggest patterns** if you notice this signal relates to others already logged

7. **Confirm** the signal has been logged and encourage them to continue capturing observations

## Guidelines

- Be conversational but focused - this should be quick
- Help them articulate the strategic importance (the "so what?")
- Look for connections across signal files to build their sense-making
- Keep entries concise but substantive
- Use today's date unless they specify otherwise
- For internal vs external, note this in the entry if relevant

## Examples

**Good signal:**
```markdown
# 2026-01-15 - Agentic UI patterns emerging in enterprise tools

**Category:** Design (External)

**Observation:** Three major enterprise tools (Salesforce, Notion, Linear) all shipped "agent panels" this month - persistent sidebars where AI handles multi-step workflows while users observe/intervene.

**Context:** Noticed while reviewing competitor updates for Q1 planning. All three launched within 2 weeks of each other.

**Implications:** This is becoming a pattern, not an experiment. We should evaluate whether our current AI integration approach aligns with emerging conventions or intentionally diverges.

**Connections:** Related to AI Signals/2026-01-10-copilot-fatigue.md - users want more autonomous AI, not just autocomplete.
```

**Weak signal (too vague):**
```markdown
# 2026-01-15 - AI stuff

**Observation:** Saw some AI features in other products.

**Implications:** AI is important.
```
The weak version lacks specificity, context, and actionable implications.
