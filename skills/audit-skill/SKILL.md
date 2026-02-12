---
name: audit-skill
description: Assess a skill against the 5-level mastery framework (Novice to Expert). Use when user wants to evaluate their current skill level with evidence-based self-assessment.
---

You are helping the user audit a specific skill against mastery criteria.

This is a structured self-assessment process using the 5-level mastery framework (Novice → Advanced Beginner → Competent → Proficient → Expert).

## Process

1. **Ask which skill** they want to audit
   - Should be specific (e.g., "user research synthesis" not just "research")
   - Check if it already exists in their Skills Inventory

2. **Read the mastery framework** to reference criteria:
   - File: `$MYEP_PATH/Craft/mastery-framework.md`

3. **Guide them through assessment:**
   - **What work have you done** with this skill recently?
   - **What complexity** have you handled?
   - **How independently** do you operate?
   - **Who relies on you** for this skill?
   - **What feedback** have you received?
   - **Have you taught others** this skill?

4. **Help them identify the level:**
   - Review behavioral indicators from the mastery framework
   - Match their evidence to the appropriate level
   - It's OK to be "between levels" (e.g., "2-3")
   - Encourage honest, evidence-based assessment

5. **Ask about target level:**
   - Where do they need/want to be with this skill?
   - What would achieving that level enable?

6. **Identify development needs:**
   - What would move them to the next level?
   - What practice, learning, or experience is needed?

7. **Read the Skills Inventory:**
   - File: `$MYEP_PATH/Craft/skills-inventory.md`

8. **Update or add the skill** in the appropriate category:

```markdown
### [Skill Name]
**Current Level:** [1-5 or between]
**Target Level:** [1-5]
**Last Assessed:** YYYY-MM-DD

**Evidence:**
- [Specific examples of work at this level]
- [Feedback received]
- [Complexity handled]
- [Who relies on them for this]

**Development Notes:**
- [What would move them to next level]
- [Resources or practice needed]

---
```

9. **Update the "Last Updated" date** in the Skills Inventory header

10. **Suggest connections** if this relates to:
    - Role requirements (gaps or strengths)
    - Development plan focus areas
    - Current projects building this skill

## Guidelines

- **Encourage honesty** - Self-assessment only works with truth
- **Ground in evidence** - What have they actually done, not what they feel
- **Watch for biases:**
  - Imposter syndrome (under-assessment) - remind them of their accomplishments
  - Overconfidence (over-assessment) - probe for complexity and edge cases
- **Be specific about evidence** - "I led 5 research projects independently" not "I'm good at research"
- **Connect to development** - Assessment should inform action
- **Reference the framework** - Quote relevant criteria from mastery-framework.md
- Use today's date unless they specify otherwise

## Examples of Good Evidence

**Level 2 (Advanced Beginner):**
"I've conducted 3 user research sessions following the standard protocol. I can synthesize findings with the template. I needed help determining interview questions for the last study."

**Level 3 (Competent):**
"I've led 15+ research projects independently across different merchant segments. I adapt research methods to the question. Other designers ask me to review their research plans. I improved our synthesis template based on what I learned."

**Level 4 (Proficient):**
"I've led 50+ studies and created our team's research framework that's now used across 3 teams. I quickly identify the right research approach for ambiguous problems. I'm regularly consulted on complex research decisions. I mentor others to competence."

## After Assessment

Suggest they:
- Review **role-requirements.md** to see if this skill is a gap or strength
- Update **development-plan.md** if this should be a focus area
- Consider logging this audit in **development-log.md**
