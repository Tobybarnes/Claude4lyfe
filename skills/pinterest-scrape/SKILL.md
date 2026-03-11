---
name: pinterest-scrape
description: Scrape full-resolution images from Pinterest pin pages. Navigates to a pin URL, scrolls to load related pins, extracts all original-quality image URLs, and downloads them. Use when user says "scrape pinterest", "grab pinterest images", "download pins", or provides a Pinterest URL to scrape.
allowed-tools: Bash(npx agent-browser:*), Bash(agent-browser:*), Bash(curl:*), Bash(mkdir:*), Bash(ls:*), Bash(wc:*)
---

# Pinterest Image Scraper

Scrape full-resolution images from Pinterest pin pages. Downloads the hero pin image and all visible related pin images at their highest available resolution (`/originals/` path).

## Usage

The user provides a Pinterest pin URL. You scrape it using agent-browser and download all full-res images.

**Default output directory**: `./images/` relative to the current working directory. Ask the user if they want a different location.

## Workflow

1. Close any existing browser session to avoid conflicts
2. Open the Pinterest pin URL with agent-browser
3. Wait for content to load (use fixed wait, NOT networkidle — Pinterest never stops fetching)
4. Scroll down multiple times to load related pins (default 6 scrolls)
5. Extract all unique image URLs from `pinimg.com` with size >= 236px
6. Convert all URLs to `/originals/` path for max resolution
7. Download images, skipping any that already exist
8. Close the browser

## Script

Run this sequence for each Pinterest URL:

```bash
# Setup
OUTDIR="./images"
mkdir -p "$OUTDIR"
SCROLLS=6

# Open and wait
npx agent-browser open "<PINTEREST_URL>"
npx agent-browser wait 5000

# Scroll to load related pins
for i in $(seq 1 $SCROLLS); do
  npx agent-browser scroll down 3000
  npx agent-browser wait 2000
done

# Extract all unique full-res image URLs
npx agent-browser eval --stdin <<'EVALEOF'
JSON.stringify(
  [...new Set(
    Array.from(document.querySelectorAll("img"))
      .map(i => i.src)
      .filter(s => s.includes("pinimg.com"))
      .filter(s => {
        let m = s.match(/\/(\d+)x\//);
        return m ? parseInt(m[1]) >= 236 : s.includes("/originals/");
      })
      .map(s => s.replace(/\/\d+x\//, "/originals/"))
  )]
)
EVALEOF
```

Then parse the JSON output and download each URL with curl:

```bash
curl -sL -o "$OUTDIR/<filename>" "<url>"
```

Skip files that already exist to avoid re-downloading duplicates.

## Notes

- Pinterest uses `/originals/`, `/736x/`, `/474x/`, `/236x/` paths — always convert to `/originals/`
- `networkidle` wait will timeout on Pinterest; use fixed `wait 5000` instead
- More scrolls = more related pins loaded (pass as second arg or default to 6)
- The script deduplicates URLs before downloading
- Always close the browser session when done: `npx agent-browser close`
