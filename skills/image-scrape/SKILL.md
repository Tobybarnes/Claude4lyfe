---
name: image-scrape
description: Scrape large images (over 256KB) from any web page. Navigates to a URL, extracts all images, filters by file size, and downloads the large ones. Use when user says "scrape images", "download images from", "grab large images", "image scrape", or wants to collect images from a non-Pinterest web page.
allowed-tools: Bash(npx agent-browser:*), Bash(agent-browser:*), Bash(curl:*), Bash(mkdir:*), Bash(ls:*), Bash(wc:*), Bash(python3:*)
---

# Universal Image Scraper

Scrape large images (over 256KB) from any web page. Opens the page with a headless browser, extracts all image URLs, checks their file sizes via HTTP HEAD requests, and downloads only images exceeding the size threshold.

## Usage

The user provides a URL. You scrape it and download all large images.

**Default output directory**: `./scraped-images/` relative to the current working directory. Ask the user if they want a different location.

**Default size threshold**: 256KB (262144 bytes). User can request a different threshold.

## Workflow

1. Close any existing browser session
2. Open the target URL with agent-browser
3. Wait for page to load (try `wait --load networkidle` with a fallback to fixed wait)
4. Scroll the page to trigger lazy-loaded images
5. Extract all unique image URLs (img src, srcset, CSS background-image, og:image)
6. For each URL, send a HEAD request to check Content-Length
7. Download only images over the size threshold
8. Close the browser

## Script

```bash
OUTDIR="./scraped-images"
mkdir -p "$OUTDIR"
SCROLLS=4
MIN_SIZE=262144  # 256KB in bytes

# Open page
npx agent-browser close 2>/dev/null
npx agent-browser open "<URL>"

# Try networkidle first, fall back to fixed wait
npx agent-browser wait --load networkidle 2>/dev/null || npx agent-browser wait 5000

# Scroll to trigger lazy loading
for i in $(seq 1 $SCROLLS); do
  npx agent-browser scroll down 2000
  npx agent-browser wait 1500
done

# Extract all image URLs from the page
npx agent-browser eval --stdin <<'EVALEOF'
JSON.stringify(
  [...new Set([
    // img src attributes
    ...Array.from(document.querySelectorAll("img"))
      .flatMap(i => {
        let urls = [i.src];
        if (i.srcset) {
          urls.push(...i.srcset.split(",").map(s => s.trim().split(" ")[0]));
        }
        return urls;
      }),
    // og:image and meta images
    ...Array.from(document.querySelectorAll('meta[property="og:image"], meta[name="twitter:image"]'))
      .map(m => m.content),
    // CSS background images
    ...Array.from(document.querySelectorAll("[style]"))
      .map(el => {
        let match = el.style.backgroundImage.match(/url\(["']?(.*?)["']?\)/);
        return match ? match[1] : null;
      })
      .filter(Boolean),
    // source elements (picture tags)
    ...Array.from(document.querySelectorAll("source[srcset]"))
      .flatMap(s => s.srcset.split(",").map(x => x.trim().split(" ")[0])),
    // a tags linking directly to images
    ...Array.from(document.querySelectorAll('a[href$=".jpg"], a[href$=".jpeg"], a[href$=".png"], a[href$=".webp"]'))
      .map(a => a.href)
  ])]
    .filter(u => u && u.startsWith("http"))
    .filter(u => !u.includes("data:"))
)
EVALEOF
```

Then filter and download with python3:

```python
import json, sys, subprocess, os

urls = json.load(sys.stdin)
outdir = os.environ.get("OUTDIR", "./scraped-images")
min_size = int(os.environ.get("MIN_SIZE", "262144"))
downloaded = 0

for i, url in enumerate(urls):
    # Check file size via HEAD request
    result = subprocess.run(
        ["curl", "-sI", "-L", url],
        capture_output=True, text=True, timeout=10
    )
    size = 0
    for line in result.stdout.splitlines():
        if line.lower().startswith("content-length:"):
            size = int(line.split(":")[1].strip())

    if size < min_size:
        continue

    # Derive filename from URL
    filename = url.split("/")[-1].split("?")[0]
    if not filename or "." not in filename:
        filename = f"image_{i}.jpg"
    filepath = os.path.join(outdir, filename)

    if os.path.exists(filepath):
        print(f"  SKIP (exists): {filename}")
        continue

    print(f"  Downloading ({size // 1024}KB): {filename}")
    subprocess.run(["curl", "-sL", "-o", filepath, url])
    downloaded += 1

print(f"\nDone! Downloaded {downloaded} images (>= {min_size // 1024}KB) to {outdir}/")
```

## Notes

- Uses HEAD requests to check size before downloading — avoids pulling small icons/thumbnails
- Extracts from multiple sources: `<img>`, `<source>`, `<meta>`, CSS `background-image`, and direct `<a>` links
- Deduplicates URLs before checking
- Skips data: URIs and relative paths
- Falls back gracefully if networkidle times out
- Always close the browser when done: `npx agent-browser close`
- For Pinterest specifically, use the `pinterest-scrape` skill instead (it handles Pinterest's URL structure)
