---
name: fieldguide-sync
description: Sync markdown content files to TypeScript, build, commit to GitHub, and deploy to Vercel. Use after editing content in /content/ folder. Triggers with "sync fieldguide", "update fieldguide", or "publish fieldguide".
---

You are syncing the Field Guide course content from markdown files to the live website.

## Project Location

**Project root:** `/Users/tobybarnes_shop/Documents/MyEP/fieldguide`

## Content Structure

### Source Files (Markdown)
- `content/practices/` - 9 practice files (01-starting.md through 09-make-your-own.md)
- `content/guides/` - 4 guide files (01-before-you-begin.md through 04-shipping.md)
- `content/resources/prompts.md` - Prompt library
- `content/resources/glossary.md` - Glossary

### Target Files (TypeScript)
- `src/app/(course)/practice/[slug]/page.tsx` - Practice pages
- `src/app/(course)/guide/[slug]/page.tsx` - Guide pages
- `src/app/(course)/prompts/page.tsx` - Prompts page
- `src/app/(course)/resources/glossary/page.tsx` - Glossary page

## Markdown Format

### Practice Files
```markdown
---
num: "01"
slug: starting
title: Starting
build: Personal Page
principle: Start before you're ready
---

## Overview
[overview text]

## What You'll Build
[description]

## Steps

### 01. Step Title
Description text.

```prompt
Prompt text here
```

> **Tip:** Tip text here

## Additional Prompts

### Prompt Title
When to use description.
```prompt
Prompt text
```

## Troubleshooting

### Problem description
Solution text.

## Reflection
- Question 1?
- Question 2?

## Extensions
- Extension 1
- Extension 2
```

### Guide Files
```markdown
---
num: "01"
slug: before-you-begin
title: Before You Begin
---

[Content paragraphs]
```

## Process

### Step 1: Read All Markdown Content

Read all files from:
- `content/practices/*.md` (9 files)
- `content/guides/*.md` (4 files)
- `content/resources/prompts.md`
- `content/resources/glossary.md`

### Step 2: Parse Markdown

For each practice file, extract:
- YAML frontmatter (num, slug, title, build, principle)
- Overview section
- What You'll Build section
- Steps (numbered, with description, optional prompt, optional tip)
- Additional Prompts (title, use case, prompt)
- Troubleshooting (problem, solution pairs)
- Reflection (list of questions)
- Extensions (list of items)

For each guide file, extract:
- YAML frontmatter (num, slug, title)
- Content paragraphs

### Step 3: Generate TypeScript

Transform markdown into TypeScript objects matching the existing interfaces:

```typescript
interface Step {
  title: string;
  description: string;
  prompt?: string;
  tip?: string;
}

interface AdditionalPrompt {
  title: string;
  prompt: string;
  use: string;
}

interface TroubleshootingItem {
  problem: string;
  solution: string;
}

interface Practice {
  num: string;
  title: string;
  build: string;
  principle: string;
  overview: string;
  whatYoullBuild?: string;
  steps: Step[];
  prompts?: AdditionalPrompt[];
  troubleshooting?: TroubleshootingItem[];
  reflection?: string[];
  extensions?: string[];
}
```

### Step 4: Update TypeScript Files

Replace the content objects in:
- `src/app/(course)/practice/[slug]/page.tsx` - Update `practices` object
- `src/app/(course)/guide/[slug]/page.tsx` - Update `guides` object
- `src/app/(course)/prompts/page.tsx` - Update prompt sections
- `src/app/(course)/resources/glossary/page.tsx` - Update glossary terms

**Important:** Preserve the React component code, imports, and rendering logic. Only update the data objects.

### Step 5: Build and Verify

Run from project root:
```bash
cd /Users/tobybarnes_shop/Documents/MyEP/fieldguide && npm run build
```

If build fails, fix the TypeScript errors before proceeding.

### Step 6: Commit to GitHub

```bash
cd /Users/tobybarnes_shop/Documents/MyEP/fieldguide && git add -A && git commit -m "Update content from markdown files"
```

### Step 7: Push to Remote

```bash
cd /Users/tobybarnes_shop/Documents/MyEP/fieldguide && git push
```

Vercel auto-deploys from GitHub, so pushing triggers a deployment.

### Step 8: Confirm

Tell the user:
1. Which files were updated
2. Build status (pass/fail)
3. Commit hash
4. That Vercel deployment is triggered
5. Live URL: https://fieldguide.builders (or current Vercel URL)

## String Escaping

When converting markdown to TypeScript strings:
- Escape single quotes: `'` → `\'`
- Escape backslashes: `\` → `\\`
- Preserve newlines within template literals or escape them

## Minimal Changes

Only update the data objects. Do not modify:
- Import statements
- Interface definitions
- Component rendering logic
- Styling or CSS

## Error Handling

If any step fails:
1. Report the specific error
2. Do not proceed to git operations
3. Suggest how to fix the issue

## Rollback

If something goes wrong after pushing:
```bash
git revert HEAD
git push
```
