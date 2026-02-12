# Common Skill Patterns

Reusable patterns with examples. Each pattern solves a specific design problem.

---

## 1. Workflow Pattern

**Use when:** Task has multiple steps that must happen in sequence.

**Structure:**
```markdown
## Workflow

Copy this checklist:
- [ ] Step 1: [Action]
- [ ] Step 2: [Action]
- [ ] Step 3: [Action]

### Step 1: [Name]
[Detailed instructions]

### Step 2: [Name]
[Detailed instructions, may reference Step 1 output]
```

**Example:**
```markdown
## PDF Form Filling Workflow

- [ ] Step 1: Analyze form (run analyze_form.py)
- [ ] Step 2: Create field mapping (edit fields.json)
- [ ] Step 3: Validate mapping (run validate.py)
- [ ] Step 4: Fill form (run fill_form.py)
- [ ] Step 5: Verify output

### Step 1: Analyze the Form
Run: `python scripts/analyze_form.py input.pdf`
Output: `fields.json` with field names and locations.

### Step 2: Create Field Mapping
Edit `fields.json` to add values for each field.
...
```

---

## 2. Decision Table Pattern

**Use when:** Multiple valid approaches exist, choice depends on context.

**Structure:**
```markdown
## Choosing Your Approach

| Condition | Approach | Details |
|-----------|----------|---------|
| [Context A] | [Method A] | [Link or brief] |
| [Context B] | [Method B] | [Link or brief] |
```

**Example:**
```markdown
## Document Modification

| Starting Point | Approach | Reference |
|----------------|----------|-----------|
| Creating new document | Use docx-js library | [Creation guide](references/creation.md) |
| Editing existing document | Modify XML directly | [Editing guide](references/editing.md) |
| Simple text replacement | Find/replace in document.xml | See below |
| Complex formatting changes | Unpack, modify, repack | [OOXML guide](references/ooxml.md) |
```

---

## 3. Template Pattern

**Use when:** Output must follow a specific format.

**Strict version (for APIs, data formats):**
```markdown
## Report Structure

ALWAYS use this exact template:

```markdown
# [Analysis Title]

## Executive Summary
[One paragraph overview]

## Key Findings
- Finding 1
- Finding 2

## Recommendations
1. [Action]
2. [Action]
```
```

**Flexible version (for creative tasks):**
```markdown
## Report Structure

Sensible default format (adapt as needed):

```markdown
# [Title]

## Summary
[Adapt length to content]

## Details
[Organize by what you discover]
```
```

---

## 4. Examples Pattern

**Use when:** Output style/quality depends on seeing examples.

**Structure:**
```markdown
## Examples

**Example 1:**
Input: [description]
Output:
```
[formatted output]
```

**Example 2:**
Input: [description]
Output:
```
[formatted output]
```
```

**Example (commit messages):**
```markdown
## Commit Message Format

**Example 1:**
Input: Added user authentication
Output:
```
feat(auth): implement JWT-based authentication

Add login endpoint and token validation middleware
```

**Example 2:**
Input: Fixed date display bug
Output:
```
fix(reports): correct date formatting

Use UTC timestamps consistently across report generation
```
```

---

## 5. Guardrails Pattern

**Use when:** Preventing specific mistakes is critical.

**Structure:**
```markdown
## Critical Rules

**DO:**
- [Required behavior]
- [Required behavior]

**DON'T:**
- [Prohibited behavior]
- [Prohibited behavior]

**Why:** [Brief explanation of consequences]
```

**Example:**
```markdown
## Database Migration Rules

**DO:**
- Always run `--verify --backup` flags
- Test on staging first
- Check row counts before and after

**DON'T:**
- Run migrations during peak hours
- Skip the backup step
- Modify the migration script mid-run

**Why:** Migrations are irreversible. Data loss requires restore from backup.
```

---

## 6. Progressive Reference Pattern

**Use when:** Skill covers broad domain, not all content needed at once.

**Structure:**
```markdown
## Overview
[Brief intro and quick start]

## Common Tasks
[Table of task → approach]

## Deep Dives
- [Domain A](references/domain-a.md)
- [Domain B](references/domain-b.md)
```

**Example:**
```markdown
## BigQuery Analysis

### Quick Start
```sql
SELECT * FROM `project.dataset.table` LIMIT 10
```

### Available Datasets
| Domain | Tables | Reference |
|--------|--------|-----------|
| Finance | revenue, billing, arr | [finance.md](references/finance.md) |
| Sales | opportunities, pipeline | [sales.md](references/sales.md) |
| Product | usage, features | [product.md](references/product.md) |
```

---

## 7. Feedback Loop Pattern

**Use when:** Quality depends on iterative validation.

**Structure:**
```markdown
## Workflow with Validation

1. [Create/modify]
2. **Validate:** [command or check]
3. If errors:
   - [Fix approach]
   - Return to step 2
4. [Continue only when valid]
```

**Example:**
```markdown
## Document Editing Process

1. Make edits to `word/document.xml`
2. **Validate:** `python scripts/validate.py unpacked_dir/`
3. If validation fails:
   - Review error message
   - Fix XML issues
   - Run validation again
4. **Only proceed when validation passes**
5. Rebuild: `python scripts/pack.py unpacked_dir/ output.docx`
```

---

## 8. Conditional Workflow Pattern

**Use when:** Different contexts require different approaches.

**Structure:**
```markdown
## Determine Your Path

**[Condition A]?** → Follow [Workflow A]
**[Condition B]?** → Follow [Workflow B]

### Workflow A: [Name]
[Steps for condition A]

### Workflow B: [Name]
[Steps for condition B]
```

**Example:**
```markdown
## Image Processing

**Is image a screenshot?** → Follow OCR workflow
**Is image a photo?** → Follow Enhancement workflow
**Is image a diagram?** → Follow Vectorization workflow

### OCR Workflow
1. Preprocess for text clarity
2. Run tesseract
3. Clean up output

### Enhancement Workflow
1. Analyze lighting/color
2. Apply corrections
3. Resize as needed
```

---

## Combining Patterns

Most effective skills combine 2-3 patterns:

| Combination | Good For |
|-------------|----------|
| Decision Table + Workflow | Complex tasks with branching paths |
| Template + Examples | Consistent formatted output |
| Guardrails + Feedback Loop | High-stakes operations |
| Progressive Reference + Decision Table | Broad domains with many subtasks |
