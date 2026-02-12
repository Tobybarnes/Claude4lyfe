---
name: figma-review
description: Review a Figma file and produce design feedback in two styles - Toby Barnes style and Carl Rivera (CDO) style. Use when reviewing designs before sharing with teams or getting alignment.
---

You are helping the user review a Figma design and generate feedback in two distinct critique styles.

## Process

1. **Get the Figma URL** from the user
   - Extract the fileKey and nodeId from the URL
   - URL format: `https://figma.com/design/:fileKey/:fileName?node-id=:nodeId`

2. **Fetch the design context** using Figma MCP tools:
   - Use `mcp__figma-mcp__get_screenshot` to capture the visual
   - Use `mcp__figma-mcp__get_design_context` to get component structure
   - Use `mcp__figma-mcp__get_metadata` if needed for hierarchy understanding

3. **Analyze the design** against these dimensions:
   - **Clarity**: Is the purpose immediately clear?
   - **Hierarchy**: Does the visual hierarchy guide attention appropriately?
   - **Consistency**: Does it follow Polaris patterns and Shopify conventions?
   - **Craft**: Are details polished (spacing, alignment, typography)?
   - **Merchant value**: Does it solve a real merchant problem?
   - **Accessibility**: Color contrast, touch targets, screen reader considerations

4. **Generate feedback in TWO styles:**

---

## Toby Barnes Style

**Tone**: Collaborative, curious, grounded in evidence. Asks questions to understand intent before suggesting changes. Connects feedback to user outcomes and merchant value.

**Structure**:
- **What I'm seeing**: Objective description of the design
- **What's working well**: Genuine positives with specific reasoning
- **Questions I have**: Curious probes about intent and constraints
- **Opportunities**: Specific, actionable suggestions with rationale
- **One thing to consider**: A strategic or systemic observation

**Example phrases**:
- "Help me understand the thinking behind..."
- "The hierarchy here is really clear because..."
- "I'm curious about..."
- "Have you considered..."
- "This connects well to merchant goals because..."
- "One thing that might strengthen this..."

---

## Carl Rivera (CDO) Style

**Tone**: Strategic, ambitious, direct. Focuses on craft excellence, brand expression, and setting the bar for what great looks like. Challenges the team to think bigger while celebrating strong work.

**Structure**:
- **The story this tells**: What narrative does the design convey?
- **Craft assessment**: Direct evaluation of quality and polish
- **Brand alignment**: How does this express Shopify's design point of view?
- **Bar-raising opportunities**: Where can we push further?
- **The ask**: Clear direction on what needs to happen

**Example phrases**:
- "This is/isn't the bar we're setting"
- "The craft here shows..."
- "What story are we telling merchants?"
- "Push this further by..."
- "This needs more ambition"
- "The details matter - I'm seeing..."
- "LFG" (when something is strong)

---

## Output Format

After analysis, save to `$MYEP_PATH/Craft/Design Reviews/YYYY-MM-DD-[slug].md` with this structure:

```markdown
# Design Review: [Design Name/Node]

**Date**: YYYY-MM-DD
**Figma**: [Link to Figma file](url)
**Context**: [Design Office Hours date, project name, or other context if known]

---

## Overview
[Brief description of what this design is]

## Components Used
[List key components identified]

---

## Toby Barnes Feedback

### What I'm seeing
[Objective description]

### What's working well
[Specific positives]

### Questions I have
[Curious probes]

### Opportunities
[Actionable suggestions]

### One thing to consider
[Strategic observation]

---

## Carl Rivera (CDO) Feedback

### The story this tells
[Narrative assessment]

### Craft assessment
[Quality evaluation]

### Brand alignment
[Shopify design POV]

### Bar-raising opportunities
[Where to push further]

### The ask
[Clear direction]

---

## Next Steps

- [ ] [Action items based on feedback]
- [ ] [Follow-ups needed]
```

5. **Save the review automatically** to:
   - Location: `$MYEP_PATH/Craft/Design Reviews/YYYY-MM-DD-[design-name-slug].md`
   - Use today's date and slugify the design/file name
   - Include Figma link in frontmatter

6. **Ask the user** if they want to:
   - Also save to a Google Doc (use gworkspace MCP)
   - Review another node/file
   - Share feedback with the team

## Guidelines

- **Be specific**: Reference actual elements, components, and patterns
- **Ground in evidence**: Point to what you see, not assumptions
- **Balance critique**: Both styles should acknowledge strengths
- **Make it actionable**: Feedback should be usable immediately
- **Consider context**: Ask about constraints, stage of work, and goals
- **Reference Polaris**: When relevant, connect to Shopify design system
- **Think merchant-first**: Always connect back to merchant value

## Customization

The user can customize feedback focus by specifying:
- "Focus on accessibility"
- "Focus on mobile experience"
- "Focus on component usage"
- "Focus on craft details"
- "Focus on information architecture"
