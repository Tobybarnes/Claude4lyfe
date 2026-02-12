---
name: deploy-weekly
description: Deploy the MM Design Weekly HTML to mm-design-wins.quick.shopify.io. Use after publishing the weekly update.
---

You are deploying the MM Design Weekly site to Shopify's Quick static hosting.

## File Locations

- **Source MD:** `~/Documents/MyEP/Ops/Design-Weekly-Updates/weekly-draft.md`
- **Source HTML:** `~/Documents/MyEP/Ops/Design-Weekly-Updates/index.html`
- **Destination:** https://mm-design-wins.quick.shopify.io/

## Process

### Step 1: Verify the files exist

Check that both files exist and have recent content:
- `~/Documents/MyEP/Ops/Design-Weekly-Updates/weekly-draft.md` (source of truth)
- `~/Documents/MyEP/Ops/Design-Weekly-Updates/index.html` (generated HTML)

### Step 2: Deploy to Quick

Run this command (gcloud must be in PATH):

```bash
export PATH="$HOME/google-cloud-sdk/bin:$PATH" && cd ~/Documents/MyEP/Ops/Design-Weekly-Updates && npx @shopify/quick deploy . mm-design-wins --force
```

This deploys index.html and the emojis folder together.

**Note:** Quick CLI requires interactive confirmation for site overwrites. If deployment fails with "requires manual confirmation", the user must run the command directly in their terminal.

### Step 3: Verify deployment

Check the site is live:

```bash
curl -sL -o /dev/null -w "%{http_code}" https://mm-design-wins.quick.shopify.io/
```

Should return `200`.

## Requirements

- **gcloud CLI:** Installed at `~/google-cloud-sdk/` and authenticated
- **npx:** Available via Node.js (uses `@shopify/quick` package)

## Troubleshooting

- **gcloud CLI not found:** Install from https://cloud.google.com/sdk/docs/install
- **Not authenticated:** Run `~/google-cloud-sdk/bin/gcloud auth login`
- **Requires manual confirmation:** User must run deploy command in their terminal (Quick safety feature)
- **Assets not loading:** Check that emoji paths are relative (`emojis/ads.png` not `/emojis/ads.png`)

## After Deployment

Confirm with the user:
- Site is live at https://mm-design-wins.quick.shopify.io/
- All emojis/images load correctly
