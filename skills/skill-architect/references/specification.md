# Agent Skills Specification Reference

Condensed reference from [agentskills.io/specification](https://agentskills.io/specification).

---

## Directory Structure

```
skill-name/
├── SKILL.md           # Required
├── references/        # Optional - documentation loaded on demand
├── scripts/           # Optional - executable code
└── assets/            # Optional - templates, images, data files
```

---

## Frontmatter Fields

### Required

**`name`**
- Max 64 characters
- Lowercase letters, numbers, hyphens only
- No leading/trailing hyphens
- No consecutive hyphens (`--`)
- Must match parent directory name

**`description`**
- Max 1024 characters
- Non-empty
- No XML tags (`<` or `>`)
- Should include what AND when to use

### Optional

**`license`**
- License name or reference to LICENSE file
- Keep short

**`compatibility`**
- Max 500 characters
- Environment requirements if any

**`metadata`**
- Key-value mapping for custom properties
- Use unique key names

**`allowed-tools`** (experimental)
- Space-delimited list of pre-approved tools
- Support varies by implementation

---

## Name Validation Rules

| Rule | Valid | Invalid |
|------|-------|---------|
| Lowercase only | `pdf-processing` | `PDF-Processing` |
| Hyphens for spaces | `code-review` | `code_review` |
| No leading hyphen | `my-skill` | `-my-skill` |
| No trailing hyphen | `my-skill` | `my-skill-` |
| No double hyphens | `my-skill` | `my--skill` |
| Match directory | `skill-name/` + `name: skill-name` | `skill-name/` + `name: other` |

---

## Description Best Practices

**Third person required:**
```yaml
# Good
description: Processes Excel files and generates reports

# Bad
description: I can help you process Excel files
description: You can use this to process Excel files
```

**Include trigger context:**
```yaml
# Good
description: Extracts text from PDFs, fills forms, merges documents. Use when working with PDF files or when user mentions PDFs, forms, or document extraction.

# Bad
description: Helps with PDFs.
```

---

## Progressive Disclosure

| Phase | Content | Token Cost |
|-------|---------|------------|
| Startup | name + description from all skills | ~100 per skill |
| Activation | SKILL.md body | Full content |
| On demand | references/*, scripts output | Only when accessed |

**Implications:**
- Keep SKILL.md under 500 lines
- Move detailed content to `references/`
- Keep file references one level deep
- Scripts are executed, not loaded into context

---

## File Reference Rules

**One level deep:**
```markdown
# Good - direct references
See [API Reference](references/api.md)
See [Examples](references/examples.md)

# Bad - chained references
SKILL.md → advanced.md → details.md → info.md
```

**Use forward slashes:**
```markdown
# Good (cross-platform)
scripts/helper.py

# Bad (Windows-only)
scripts\helper.py
```

---

## Validation

Use the `skills-ref` library or custom validation:

```bash
skills-ref validate ./my-skill
```

Checks:
- Valid SKILL.md frontmatter
- Proper naming conventions
- Correct file structure
