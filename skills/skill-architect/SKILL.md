---
name: skill-architect
description: Design, create, review, and improve Claude skills with prompt engineering rigor. Use when creating new skills, reviewing skill effectiveness, improving existing skills, or learning skill design principles. Triggers on skill creation, SKILL.md authoring, skill review, or skill improvement requests.
---

## The Meta-Principle

**You are writing instructions for another Claude instance.**

Every line in a skill competes for context with the user's actual work. The skill you create will be read by "Claude B" - a fresh Claude instance with no memory of this conversation. Claude B is smart but knows nothing about your specific domain.

**The question for every line:** "Does Claude B need this to succeed, or am I just being thorough?"

---

## 1. Choose Your Mode

| Mode | When to Use | Jump to |
|------|-------------|---------|
| **Create** | Building a new skill from scratch | [Section 2](#2-create-mode) |
| **Review** | Evaluating an existing skill's effectiveness | [Section 3](#3-review-mode) |
| **Improve** | Making a skill better based on observed behavior | [Section 4](#4-improve-mode) |

---

## 2. Create Mode

### Step 1: Define the Skill's Purpose

Answer these questions before writing anything:

1. **What task does this skill help with?** (Be specific)
2. **What does Claude B NOT already know?** (Claude is already smart)
3. **What mistakes would Claude B make without this skill?** (The gaps)
4. **When should this skill trigger?** (The keywords/contexts)

If you can't answer #2 and #3 clearly, the skill may not be necessary.

### Step 2: Choose Your Architecture

| Pattern | Use When | Example |
|---------|----------|---------|
| **Workflow** | Multi-step process with dependencies | Form filling, data migration |
| **Reference** | Domain knowledge Claude lacks | API schemas, company conventions |
| **Guardrails** | Preventing specific mistakes | Code review standards |
| **Capability** | Enabling a new action | PDF manipulation, file format handling |

Most skills combine 2-3 patterns. Lead with the dominant one.

### Step 3: Write the Frontmatter

```yaml
---
name: skill-name
description: [What it does] and [when to use it]. Triggers on [keywords].
---
```

**Name rules:**
- Lowercase, hyphens only: `pdf-processing`, `code-review`
- Match the directory name exactly
- Max 64 characters

**Description rules (critical for discovery):**
- Third person: "Processes PDFs" not "I process PDFs"
- Include BOTH purpose AND trigger context
- Add specific keywords Claude will match against
- Max 1024 characters

**Good:** "Generates commit messages following conventional commits format. Use when committing code, writing git messages, or reviewing staged changes."

**Bad:** "Helps with git stuff."

### Step 4: Structure the Body

**The Elevation Pattern:**

```markdown
## Principle (the "why")
[One sentence that captures the core insight]

## Pattern (the "how")
[Decision table or flowchart]

## Examples (the "what")
[Concrete input/output pairs]
```

This structure lets Claude B apply principles to situations you didn't enumerate.

**Progressive Disclosure:**

Keep SKILL.md under 500 lines. Move detailed content to `references/`:

```markdown
## Quick Start
[Immediate working example]

## Common Patterns
[Decision table]

## Deep Dives
- [API Reference](references/api.md)
- [Edge Cases](references/edge-cases.md)
```

### Step 5: Calibrate Freedom

| Task Fragility | Guidance Level | Example |
|----------------|----------------|---------|
| **Low** (many valid approaches) | High freedom, general direction | "Review for clarity and bugs" |
| **Medium** (preferred pattern exists) | Pseudocode with parameters | Template with customization points |
| **High** (must be exact) | Specific script, no parameters | Database migration command |

Match specificity to how badly things break if Claude B improvises.

### Step 6: Validate

Run `python scripts/validate.py path/to/skill/` to check:
- Frontmatter format and required fields
- Name matches directory
- No reserved words (anthropic, claude)
- Description length and content

### Step 7: Test with Real Usage

The skill now exists, but does it work?

1. **Use it**: Give Claude B (fresh instance with skill loaded) real tasks
2. **Observe**: Did Claude B find the skill? Follow instructions? Succeed?
3. **Diagnose**: Map failures to causes (see Review Mode table)
4. **Refine**: Make targeted changes based on observations
5. **Repeat**: Test again until Claude B reliably succeeds

**Don't skip this.** Skills that work in your head often fail in practice.

---

## 3. Review Mode

### The Review Question

**"If Claude B read only this skill, would it succeed at the intended task?"**

### Review Checklist

**Discovery (will Claude B find and use this skill?):**
- [ ] Description includes trigger keywords
- [ ] Description says both WHAT and WHEN
- [ ] Name is discoverable and meaningful

**Effectiveness (will Claude B do the right thing?):**
- [ ] Principles are elevated (not just rules)
- [ ] Examples show input → output
- [ ] Freedom level matches task fragility
- [ ] No over-explanation of what Claude already knows

**Efficiency (is context well-spent?):**
- [ ] SKILL.md under 500 lines
- [ ] Detailed content in `references/`
- [ ] No time-sensitive information
- [ ] No redundant explanations

**Structure (is it scannable?):**
- [ ] Most important content first
- [ ] Tables for decision points
- [ ] One level of reference depth (no chains)

See [references/checklist.md](references/checklist.md) for the complete review checklist.

### Common Issues

| Symptom | Likely Cause | Fix |
|---------|--------------|-----|
| Skill doesn't trigger | Weak description keywords | Add specific trigger terms |
| Claude B ignores instructions | Too verbose, buried in text | Elevate, use tables |
| Wrong approach chosen | Ambiguous decision points | Add decision table |
| Inconsistent outputs | No examples | Add input/output pairs |
| Context overflow | Everything in SKILL.md | Split to `references/` |

---

## 4. Improve Mode

### The Iteration Loop

```
Observe Claude B → Identify gaps → Refine skill → Test again
```

**Step 1: Observe** - Use the skill with real tasks. Note:
- Did Claude B find the skill?
- Did Claude B follow the workflow?
- What did Claude B get wrong?
- What did Claude B ask about?

**Step 2: Diagnose** - Map observations to causes:

| Observation | Diagnosis | Action |
|-------------|-----------|--------|
| Skill didn't activate | Weak trigger keywords | Improve description |
| Skipped important step | Buried in prose | Promote to numbered list |
| Made preventable mistake | Missing guardrail | Add explicit warning |
| Asked obvious questions | Over-explained elsewhere | Trim the obvious |
| Improvised incorrectly | Too much freedom | Add specific guidance |

**Step 3: Apply** - Make minimal targeted changes:
- Don't rewrite the whole skill
- Change one thing at a time
- Preserve what's working

**Step 4: Test** - Use the improved skill on the same task type.

---

## 5. Anti-Patterns

| Pattern | Problem | Quick Fix |
|---------|---------|-----------|
| Over-explanation | Wastes context on what Claude knows | Show code, not prose |
| Vague descriptions | Claude can't find the skill | Include WHAT + WHEN + KEYWORDS |
| Rule lists | Can't handle novel situations | Elevate to principles, add tables |
| Nested references | Partial reads miss content | One level deep from SKILL.md |
| Everything in SKILL.md | Context overflow | Split to `references/` |
| Missing examples | Ambiguous output expectations | Add input → output pairs |

See [references/anti-patterns.md](references/anti-patterns.md) for detailed examples and fixes.

---

## 6. Quick Reference

See [references/specification.md](references/specification.md) for:
- Frontmatter field rules and validation
- Directory structure requirements
- Token budget mental model

---

## References

- [references/specification.md](references/specification.md) - Full Agent Skills spec
- [references/patterns.md](references/patterns.md) - Common skill patterns with examples
- [references/anti-patterns.md](references/anti-patterns.md) - Detailed anti-patterns
- [references/checklist.md](references/checklist.md) - Complete review checklist

**For large skills (>300 lines of reference material):**
- [domain-skill-architect](../domain-skill-architect/SKILL.md) - Structure context-heavy skills for selective loading

**External:**
- [Agent Skills Specification](https://agentskills.io/specification)
- [Skill Authoring Best Practices](https://platform.claude.com/docs/en/agents-and-tools/agent-skills/best-practices)
- [anthropics/skills repository](https://github.com/anthropics/skills)
