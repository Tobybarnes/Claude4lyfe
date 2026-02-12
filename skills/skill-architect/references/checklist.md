# Complete Skill Review Checklist

Use this checklist when reviewing a skill for quality and effectiveness.

---

## Discovery (Will Claude B find and use this skill?)

### Frontmatter

- [ ] **Name is valid**
  - Lowercase letters, numbers, hyphens only
  - No leading/trailing/consecutive hyphens
  - Matches directory name exactly
  - Under 64 characters

- [ ] **Description is effective**
  - Third person ("Processes..." not "I process...")
  - Includes WHAT the skill does
  - Includes WHEN to use it
  - Contains trigger keywords users might say
  - Under 1024 characters
  - No XML tags (`<` or `>`)

### Discoverability

- [ ] Description keywords match likely user queries
- [ ] Name is meaningful (not "helper" or "utils")
- [ ] Purpose is clear from name + description alone

---

## Effectiveness (Will Claude B do the right thing?)

### Content Quality

- [ ] **Principles are elevated**
  - Core insights expressed as principles
  - Principles are grounded with patterns/examples
  - Not just a list of rules

- [ ] **Examples are concrete**
  - Input → output pairs where format matters
  - Real-world scenarios, not abstract descriptions
  - Cover common cases and key edge cases

- [ ] **Freedom level is calibrated**
  - Low-risk tasks: general guidance
  - Medium-risk tasks: templates with parameters
  - High-risk tasks: specific commands, no improvisation

- [ ] **Decision points are clear**
  - Tables for "when to use what"
  - Explicit conditions, not implied
  - Default recommendations marked

### Completeness

- [ ] Covers the common cases (80% of usage)
- [ ] Edge cases are either handled or linked to references
- [ ] Error scenarios have guidance
- [ ] Prerequisites/dependencies are stated

### Accuracy

- [ ] Technical information is correct
- [ ] Code examples are executable
- [ ] Commands are tested
- [ ] No outdated information

---

## Efficiency (Is context well-spent?)

### Token Budget

- [ ] **SKILL.md under 500 lines**
- [ ] **No over-explanation**
  - Doesn't explain what Claude already knows
  - Each paragraph justifies its token cost
- [ ] **Progressive disclosure used**
  - Quick start in SKILL.md
  - Details in `references/`
  - Scripts executed, not loaded

### Structure

- [ ] **Most important content first**
  - Quick start before deep dives
  - Common cases before edge cases
- [ ] **References are one level deep**
  - No chains: SKILL.md → ref.md → detail.md
- [ ] **Tables for scannable content**
  - Decision trees as tables
  - Options as tables
  - Comparisons as tables

### Maintenance

- [ ] No time-sensitive information (or properly isolated)
- [ ] Consistent terminology throughout
- [ ] No redundancy with other skills
- [ ] Easy to update as requirements change

---

## Technical (Is the structure correct?)

### File Structure

- [ ] `SKILL.md` exists at skill root
- [ ] Directory name matches frontmatter `name`
- [ ] All paths use forward slashes
- [ ] References exist where linked

### Optional Directories

If `references/` exists:
- [ ] Files are well-named (descriptive, not `doc1.md`)
- [ ] Each file has focused purpose
- [ ] Longer files have table of contents

If `scripts/` exists:
- [ ] Scripts have helpful error messages
- [ ] Scripts handle edge cases gracefully
- [ ] Dependencies are documented
- [ ] Constants are explained

If `assets/` exists:
- [ ] Assets are actually used
- [ ] File formats are appropriate

---

## Testing (Has it been validated?)

### Basic Testing

- [ ] Skill triggers when expected
- [ ] Skill doesn't trigger when irrelevant
- [ ] Instructions produce correct results
- [ ] Code examples run without errors

### Model Coverage

- [ ] Works with Claude Haiku (enough guidance?)
- [ ] Works with Claude Sonnet (balanced?)
- [ ] Works with Claude Opus (not over-explained?)

### Real Usage

- [ ] Tested with actual tasks, not just examples
- [ ] Feedback from other users incorporated
- [ ] Observed Claude B behavior and iterated

---

## Quick Scoring

Rate each area 1-5, aim for 4+ in all areas:

| Area | Score | Notes |
|------|-------|-------|
| Discovery | /5 | |
| Effectiveness | /5 | |
| Efficiency | /5 | |
| Technical | /5 | |
| Testing | /5 | |
| **Total** | /25 | |

**Scoring guide:**
- 5: Excellent, no issues
- 4: Good, minor improvements possible
- 3: Acceptable, some issues to address
- 2: Needs work, significant issues
- 1: Major problems, requires rewrite

**Thresholds:**
- 20+: Ready for use
- 15-19: Needs polish
- <15: Needs significant revision
