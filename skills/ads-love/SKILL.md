---
name: ads-love
description: Search for and share creative advertising examples to post to #adslove Slack channel. Use when user says "ads love", "find creative ads", "adslove post", or wants to discover award-winning, viral, or creative campaigns (TV, video, OOH, experiential, digital).
---

# Ads Love

Find and curate creative advertising examples to share with the #adslove Slack channel.

## Purpose

Search the internet for outstanding creative advertising work - TV spots, video campaigns, OOH, experiential activations, digital/social stunts - and format them for posting to #adslove.

## Process

1. **Search for recent creative work** using web search across:
   - Award shows: Cannes Lions, D&AD, One Show, Clios
   - Industry publications: Ad Age, Adweek, Creative Review, The Drum, Contagious
   - Campaign categories: TV/Video, OOH/Print, Experiential, Digital/Social, Stunts/PR

2. **Filter for quality** - Look for work that demonstrates:
   - Unexpected creative angles
   - Excellent craft (direction, copy, design, sound)
   - Cultural relevance
   - Genuine brand risk-taking
   - Ideas that respect audience intelligence

3. **Curate 3 examples** with variety across:
   - Different categories (not all TV spots)
   - Different brands/industries
   - Mix of well-known and under-the-radar work

4. **Find image URLs** for each campaign:
   - Use WebFetch on press releases (PRNewswire, BusinessWire) to extract image URLs
   - Check Ad Age/Adweek articles for campaign stills
   - Use YouTube thumbnail URLs as fallback: `https://i.ytimg.com/vi/[VIDEO_ID]/hqdefault.jpg`
   - Always include at least one image per campaign

5. **Find YouTube links** for each campaign:
   - Search for "[Brand] [Campaign Name] [year] youtube" to find direct video links
   - Use WebFetch on press releases and industry articles to extract YouTube URLs
   - Check brand YouTube channels as fallback: `https://www.youtube.com/@[brandname]`
   - For video ads, always include a YouTube or video link when available

6. **Format each post** using this template:

```
*[Brand] - [Campaign Name]* ([Category])

![Alt text](IMAGE_URL)

[1-2 sentence description of what the work is]

*Why it slaps:* [1-2 sentences on the creative insight or execution that makes it special]

[Watch on YouTube](YOUTUBE_URL) | [Source article](ARTICLE_URL)
```

7. **Write to file** at `$MYEP_PATH/Daily Ops/ads-love-draft.md` - a ready-to-copy draft for #adslove

**Never post directly to Slack.** Always write to the MD file for manual copy/paste.

## Tone Guidelines

Reference the tone/vibe guide at: `$MYEP_PATH/Craft/ads-love-tone-vibe.md`

Key principles:
- Enthusiastic but discerning
- Craft-focused analysis
- Conversational, like sharing with a creative friend
- Brief and punchy - let the work speak

## Search Strategy

Prioritize recent campaigns (last 30-90 days) unless user requests a specific timeframe.

Useful search terms:
- "best creative ads [month] [year]"
- "award winning campaigns [year]"
- "viral marketing [year]"
- "Cannes Lions winners [year]"
- "creative advertising [category] [year]"
- "[brand category] marketing campaign"

## Output

Write the curated ads to `$MYEP_PATH/Daily Ops/ads-love-draft.md` for manual copy/paste to Slack. Never post directly.
