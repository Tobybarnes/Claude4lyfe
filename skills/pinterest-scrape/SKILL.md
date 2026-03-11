---
name: pinterest-scrape
description: Scrape full-resolution images from Pinterest pin pages. Navigates to a pin URL, scrolls to load related pins, extracts all original-quality image URLs, and downloads them. Use when user says "scrape pinterest", "grab pinterest images", "download pins", or provides a Pinterest URL to scrape.
allowed-tools: Bash(npx agent-browser:*), Bash(agent-browser:*), Bash(curl:*), Bash(mkdir:*), Bash(ls:*), Bash(wc:*), Bash(python3:*), Bash(rm:*)
---

# Pinterest Image Scraper

Scrape large, high-resolution images from Pinterest pin pages. Downloads the hero pin image and all visible related pin images, filtering out small thumbnails and icons.

## Usage

The user provides a Pinterest pin URL. You scrape it using agent-browser and download all large images.

**Default output directory**: `./images/` relative to the current working directory. Ask the user if they want a different location.

**Filtering**: Images are filtered by dimensions extracted from the browser DOM. Only images where the natural width is >= 474px are collected. After download, any file under 30KB is deleted (broken/placeholder files).

## Workflow

1. Close any existing browser session to avoid conflicts
2. Open the Pinterest pin URL with agent-browser
3. Wait for content to load (use fixed wait, NOT networkidle — Pinterest never stops fetching)
4. Scroll down multiple times to load related pins (default 6 scrolls)
5. Extract image URLs AND their natural dimensions from the DOM
6. Filter to images with naturalWidth >= 474px (excludes thumbnails, avatars, icons)
7. For each URL, try `/originals/` first via HEAD request, fall back to `/736x/` if 403
8. Download qualifying images, skipping any that already exist
9. Delete any downloaded file under 30KB (broken/placeholder)
10. Report summary: found, downloaded, skipped
11. Close the browser

## Important: Pinterest blocks `/originals/`

Pinterest returns 403 for many `/originals/` URLs. The download script MUST:
1. Try the `/originals/` URL first with a HEAD request
2. If it returns non-200, fall back to `/736x/`
3. Use `re.sub(r"/(originals|\d+x)/", "/originals/", url)` to rewrite URLs (preserves the full hash path)

## Script

### Step 1: Open and scroll

```bash
npx agent-browser close 2>/dev/null
npx agent-browser open "<PINTEREST_URL>"
npx agent-browser wait 5000

for i in $(seq 1 6); do
  npx agent-browser scroll down 3000
  npx agent-browser wait 2000
done
```

### Step 2: Extract URLs with dimensions

```bash
npx agent-browser eval --stdin <<'EVALEOF'
JSON.stringify(
  [...new Map(
    Array.from(document.querySelectorAll("img"))
      .filter(i => i.src.includes("pinimg.com") && i.naturalWidth >= 474)
      .map(i => [i.src.split("/").pop(), { src: i.src, w: i.naturalWidth, h: i.naturalHeight }])
  ).values()]
)
EVALEOF
```

This deduplicates by filename and only includes images >= 474px wide.

### Step 3: Download with fallback

Save the eval output to a temp file, then run Python:

```python
import json, subprocess, os, re

images = json.load(open("/tmp/pin_urls.json"))
outdir = os.environ.get("OUTDIR", "./images")
min_file_size = 30720  # 30KB - catch broken files

downloaded = 0
skipped_small = 0
skipped_exists = 0
skipped_failed = 0

for img in images:
    url = img["src"]
    filename = url.split("/")[-1]
    filepath = os.path.join(outdir, filename)

    if os.path.exists(filepath) and os.path.getsize(filepath) >= min_file_size:
        skipped_exists += 1
        continue

    if os.path.exists(filepath):
        os.remove(filepath)

    # Try originals first, then 736x
    originals_url = re.sub(r"/(originals|\d+x)/", "/originals/", url)
    fallback_url = re.sub(r"/(originals|\d+x)/", "/736x/", url)

    chosen_url = None
    source = ""
    for try_url, src in [(originals_url, "originals"), (fallback_url, "736x")]:
        result = subprocess.run(
            ["curl", "-sI", "-L", "-o", "/dev/null", "-w", "%{http_code}", try_url],
            capture_output=True, text=True, timeout=10
        )
        if result.stdout.strip() == "200":
            chosen_url = try_url
            source = src
            break

    if not chosen_url:
        skipped_failed += 1
        continue

    subprocess.run(["curl", "-sL", "-o", filepath, chosen_url], timeout=30)

    if os.path.exists(filepath):
        size = os.path.getsize(filepath)
        if size < min_file_size:
            os.remove(filepath)
            skipped_small += 1
            continue
        downloaded += 1
        print(f"  [{downloaded}] {filename} ({size // 1024}KB) from {source}")
    else:
        skipped_failed += 1

print(f"\n--- Summary ---")
print(f"Found on page: {len(images)}")
print(f"Downloaded:    {downloaded}")
print(f"Skipped small: {skipped_small} (<30KB)")
print(f"Skipped exist: {skipped_exists}")
print(f"Skipped 403:   {skipped_failed}")
```

### Step 4: Close browser

```bash
npx agent-browser close
```

## Notes

- Pinterest blocks `/originals/` with 403 — always try it first but fall back to `/736x/`
- Use `re.sub(r"/(originals|\d+x)/", "/originals/", url)` to rewrite URLs — do NOT split by `/` and take last 3 segments (the path has 4 segments after the size prefix)
- `networkidle` wait will timeout on Pinterest; use fixed `wait 5000` instead
- More scrolls = more related pins loaded (default 6, user can request more)
- Images are deduplicated by filename before downloading
- Pinterest images are often well-compressed (100-200KB for 1080p) — filtering by file size alone would miss good content. Filter by DOM dimensions instead.
- Files under 30KB are deleted (broken downloads or placeholder images)
- Always close the browser session when done
