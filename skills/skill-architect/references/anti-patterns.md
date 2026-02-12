# Skill Anti-Patterns

What NOT to do, with explanations and fixes.

---

## 1. Over-Explanation

**The problem:** Explaining things Claude already knows wastes context.

**Bad:**
```markdown
PDF files are a common document format created by Adobe. They can contain
text, images, and interactive elements. PDF stands for Portable Document
Format. To work with PDFs in Python, you'll need a library...
```

**Good:**
```markdown
Extract text with pdfplumber:
```python
with pdfplumber.open("file.pdf") as pdf:
    text = pdf.pages[0].extract_text()
```
```

**The test:** "Would a competent developer need this explanation?"

---

## 2. Vague Descriptions

**The problem:** Claude can't find skills with unclear descriptions.

**Bad:**
```yaml
description: Helps with documents
description: A useful tool for data
description: Does stuff with files
```

**Good:**
```yaml
description: Extracts text and tables from PDFs, fills forms, merges documents. Use when working with PDF files or when user mentions PDFs, forms, or document extraction.
```

**The fix:** Include WHAT (actions) + WHEN (triggers) + KEYWORDS (matching terms).

---

## 3. Rule Lists Without Principles

**The problem:** Lists don't help Claude handle novel situations.

**Bad:**
```markdown
## JavaScript Rules
- Don't use var
- Always use const
- Prefer arrow functions
- Use template literals
- Don't use ==
- Always use ===
```

**Good:**
```markdown
## Modern JavaScript Style

**Principle:** Prefer immutability and expression-based code.

| Old Pattern | Modern Pattern | Why |
|-------------|----------------|-----|
| `var x` | `const x` | Prevents accidental reassignment |
| `function() {}` | `() => {}` | Shorter, lexical `this` |
| `"Hi " + name` | `` `Hi ${name}` `` | Cleaner interpolation |
| `==` | `===` | Explicit type comparison |
```

**The fix:** Elevate rules to principles, then ground with examples.

---

## 4. Deeply Nested References

**The problem:** Claude may only partially read chained files.

**Bad:**
```
SKILL.md → advanced.md → details.md → actual-information.md
```

Claude might use `head -100` on intermediate files, missing crucial content.

**Good:**
```
SKILL.md
├── references/api.md
├── references/examples.md
└── references/advanced.md
```

**The rule:** One level of reference depth from SKILL.md.

---

## 5. Time-Sensitive Information

**The problem:** Skills become wrong as time passes.

**Bad:**
```markdown
If you're doing this before August 2025, use the old API.
After August 2025, use the new API.
```

**Good:**
```markdown
## Current Method
Use the v2 API endpoint: `api.example.com/v2/`

<details>
<summary>Legacy v1 API (deprecated)</summary>
The v1 API used: `api.example.com/v1/`
This endpoint is no longer supported.
</details>
```

**The fix:** Document current state; put historical context in collapsed sections.

---

## 6. Too Many Options

**The problem:** Choice paralysis slows Claude down.

**Bad:**
```markdown
You can use pypdf, or pdfplumber, or PyMuPDF, or pdf2image, or
camelot, or tabula-py, or pdfminer. Each has pros and cons...
```

**Good:**
```markdown
**Default:** Use pdfplumber for text extraction.

```python
import pdfplumber
with pdfplumber.open("file.pdf") as pdf:
    text = pdf.pages[0].extract_text()
```

**Exception:** For scanned PDFs, use pdf2image + pytesseract.
```

**The fix:** Provide a default with escape hatches for specific cases.

---

## 7. Missing Examples

**The problem:** Instructions without examples are ambiguous.

**Bad:**
```markdown
Generate commit messages in conventional format.
```

**Good:**
```markdown
Generate commit messages in conventional format.

**Example:**
Input: Added login functionality
Output:
```
feat(auth): add user login

Implement login form and session management
```
```

**The rule:** If output format matters, show input → output.

---

## 8. Inconsistent Terminology

**The problem:** Multiple terms for the same thing confuses Claude.

**Bad:**
```markdown
First, extract the form fields. Then map the boxes to values.
Next, fill in each element. Finally, validate the controls.
```
(fields, boxes, elements, controls = same thing?)

**Good:**
```markdown
First, extract the form fields. Then map fields to values.
Next, fill each field. Finally, validate all fields.
```

**The fix:** Pick one term and use it consistently.

---

## 9. Windows-Style Paths

**The problem:** Backslash paths break on Unix systems.

**Bad:**
```markdown
Run: `python scripts\helper.py`
See: `references\guide.md`
```

**Good:**
```markdown
Run: `python scripts/helper.py`
See: `references/guide.md`
```

**The rule:** Always use forward slashes.

---

## 10. Punting to Claude

**The problem:** Scripts that fail and expect Claude to figure it out.

**Bad (in scripts):**
```python
def process(path):
    return open(path).read()  # Just crashes if file missing
```

**Good (in scripts):**
```python
def process(path):
    try:
        with open(path) as f:
            return f.read()
    except FileNotFoundError:
        print(f"File {path} not found, creating empty")
        with open(path, 'w') as f:
            f.write('')
        return ''
```

**The principle:** Scripts should solve problems, not create new ones.

---

## 11. Magic Numbers

**The problem:** Unexplained constants are impossible to tune.

**Bad:**
```python
TIMEOUT = 47
RETRIES = 5
BATCH_SIZE = 137
```

**Good:**
```python
# HTTP requests typically complete in 30s; add buffer for slow connections
REQUEST_TIMEOUT = 30

# Most transient failures resolve by second retry
MAX_RETRIES = 3

# Balances memory usage vs. API call overhead
BATCH_SIZE = 100
```

**The rule:** Document why, not just what.

---

## 12. Everything in SKILL.md

**The problem:** Long files waste context when only part is needed.

**Bad:** 800-line SKILL.md covering every edge case.

**Good:**
```markdown
## Quick Start
[50 lines of essential content]

## Common Patterns
[100 lines of typical workflows]

## References
- [API Details](references/api.md)
- [Edge Cases](references/edge-cases.md)
- [Examples](references/examples.md)
```

**The rule:** SKILL.md under 500 lines. Move depth to `references/`.

---

## Quick Reference: Anti-Pattern Detection

| Symptom | Likely Anti-Pattern |
|---------|---------------------|
| Skill doesn't trigger | Vague description (#2) |
| Claude makes basic mistakes | Missing examples (#7) |
| Claude ignores instructions | Over-explanation (#1), buried in prose |
| Inconsistent behavior | Multiple terms (#8), too many options (#6) |
| Context overflow warnings | Everything in SKILL.md (#12) |
| Works in tests, fails in practice | Time-sensitive info (#5) |
| Scripts keep failing | Punting to Claude (#10) |
