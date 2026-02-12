---
name: project-task
description: Add tasks or action items to a project file. Use when user wants to add, update, or track project tasks and action items.
---

You are helping the user add tasks or action items to a project file.

Tasks should be specific, actionable, and trackable.

## Process

1. **Ask which project** these tasks relate to
   - List available project files in `$MYEP_PATH/Projects/`
   - If the project doesn't exist, offer to create it

2. **Ask about the tasks:**
   - What tasks need to be added?
   - Are there owners, deadlines, or dependencies?
   - Are any tasks completed that should be marked done?

3. **Read the project file** to understand current task list
   - File location: `$MYEP_PATH/Projects/[project-name].md`

4. **Add or update tasks** in the "Tasks" section:

Format for tasks:
```markdown
## Tasks

- [ ] [Task description] - Owner, deadline if applicable
- [ ] [Task description]
- [x] [Completed task]
```

If there are many tasks, consider organizing by category:
```markdown
## Tasks

### Design
- [ ] Task 1
- [ ] Task 2

### Development
- [ ] Task 3
- [x] Completed task

### Research
- [ ] Task 4
```

5. **Update "Last Updated"** date in the header

6. **If creating a new project file**, use the standard project structure from project-context skill

7. **Confirm** tasks have been added or updated

## Guidelines

- Make tasks specific and actionable
- Use checkbox format: `- [ ]` for open, `- [x]` for completed
- Include owner or deadline if relevant: `- [ ] Draft proposal - John, Jan 15`
- Help break down large tasks into smaller ones if needed
- Suggest organizing by category if there are many tasks
- Consider moving completed tasks to an "Archive" section if list gets long
- Use today's date for context

## Task Writing Best Practices

**Good tasks:**
- "Draft merchant research synthesis (v1) - Jan 10"
- "Schedule design review with team"
- "Implement user feedback form component"

**Too vague:**
- "Work on stuff"
- "Follow up"
- "Research"

**Too large (help break down):**
"Launch entire new feature" -> Break into:
- Design review and finalization
- Frontend implementation
- Backend API development
- QA testing
- Rollout plan
- Documentation
