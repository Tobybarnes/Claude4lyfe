---
name: project-decision
description: Log project decisions with rationale, alternatives considered, and implications. Use when user makes an important project decision they want to document.
---

You are helping the user log a decision and its rationale to a project file.

Good decision logs capture what was decided, why, what alternatives were considered, and the implications.

## Process

1. **Ask which project** this decision relates to
   - List available project files in `$MYEP_PATH/Projects/`
   - If the project doesn't exist, offer to create it

2. **Ask about the decision:**
   - What was decided?
   - Why was this decision made?
   - What alternatives were considered?
   - What are the implications or trade-offs?

3. **Read the project file** to understand current structure
   - File location: `$MYEP_PATH/Projects/[project-name].md`

4. **Add the decision** under the "Decisions" section in this format:

```markdown
### YYYY-MM-DD - [Decision Title]

**Decision:** [What was decided]

**Rationale:** [Why this decision was made]

**Alternatives Considered:** [Other options that were evaluated]

**Implications:** [What this means going forward, trade-offs]

---
```

5. **Update "Last Updated"** date in the header

6. **If creating a new project file**, use the standard project structure from project-context skill

7. **Confirm** the decision has been logged

## Guidelines

- Help them articulate clear rationale (the "why" is most important)
- Encourage them to document alternatives even if briefly
- Ask about implications and trade-offs
- Keep it concise but complete
- Use today's date unless they specify otherwise
- Good decision logs are invaluable for future context

## Examples

**Good decision log:**
```
### 2026-01-05 - Use Progressive Rollout Instead of Big Bang

**Decision:** Roll out new merchant dashboard to 10% of users first, then scale up based on feedback

**Rationale:** Reduces risk of widespread issues, allows for real-world learning before full commitment, merchant segment is diverse enough that 10% gives good signal

**Alternatives Considered:**
- Full rollout: Too risky given complexity
- Beta program: Slower, self-selection bias
- Internal only: Not representative of real merchant needs

**Implications:** Will extend timeline by 2-3 weeks, need monitoring infrastructure in place, creates some feature parity complexity in codebase
```

**Too brief (avoid this):**
"Decided to do a phased rollout. Seems safer."
