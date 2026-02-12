---
name: project-context
description: Add context, background, or updates to a project file. Use when user wants to add project information, stakeholder details, or project updates.
---

You are helping the user add context, background, or updates to a project file.

Context includes: background information, stakeholder details, constraints, opportunities, strategic rationale, or any important information about the project.

## Process

1. **Ask which project** they want to add context to
   - List available project files in `$MYEP_PATH/Projects/`
   - If the project doesn't exist yet, offer to create it

2. **Ask what context** they want to add:
   - Background information
   - Stakeholder details
   - Constraints or requirements
   - Opportunities or strategic rationale
   - Updates or changes in project landscape

3. **Read the project file** to understand current structure
   - File location: `$MYEP_PATH/Projects/[project-name].md`

4. **Add the context** in the appropriate section:
   - If adding to "Context" section: append to existing context
   - If it's an update: add to "Updates" section with date
   - If it's about stakeholders: add to "Key Stakeholders" section
   - Use today's date for updates

5. **If creating a new project file**, use this structure:

```markdown
# [Project Name]

**Status:** Active
**Timeline:** [Start date] - [Estimated end]
**Last Updated:** YYYY-MM-DD

## Overview
[Brief description]

## Key Stakeholders
- [Stakeholder] - [Role]

## Context
[Context information they provided]

## Decisions
[Will be populated as decisions are logged]

## Tasks
- [ ] [Initial tasks if any]

## Updates

### YYYY-MM-DD
Project initiated. [Any initial context]

## Resources
[Links and references]

## Learnings
[To be captured as project progresses]
```

6. **Confirm** the context has been added and update the "Last Updated" date

## Guidelines

- Keep context factual and useful for future reference
- Ask clarifying questions if information is vague
- Help organize information into the right section
- Update the "Last Updated" field whenever editing
- Suggest creating a new project file if one doesn't exist
- Keep context concise but complete
