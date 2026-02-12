---
name: publish
description: Convert the weekly-draft.md file to HTML and update the MM Design Weekly site. Use after reviewing and editing the draft. Triggers with "publish weekly", "ship weekly", or "convert draft to html".
---

You are converting the weekly draft markdown file to the final HTML for the MM Design Weekly site.

## File Locations

- **Draft source:** `~/Documents/MyEP/Ops/Design-Weekly-Updates/weekly-draft.md`
- **HTML output:** `~/Documents/MyEP/Ops/Design-Weekly-Updates/index.html`
- **Emoji folder:** `~/Documents/MyEP/Ops/Design-Weekly-Updates/emojis/`

## Process

### Step 1: Read the Draft

Read `~/Documents/MyEP/Ops/Design-Weekly-Updates/weekly-draft.md` and parse:
- Config section (week_of, week_id)
- Announcement (if present)
- Highlights for each pillar
- Detailed updates for each pillar
- Slack summary text

### Step 2: Read Current HTML

Read `~/Documents/MyEP/Ops/Design-Weekly-Updates/index.html` to understand:
- Current week structure
- Existing archived weeks (keep last 2, plus new week = 3 total)

### Step 3: Update HTML

1. **Update header** with new week date
2. **Update nav tabs** - new week active, archive previous weeks
3. **Create new week content** div with:
   - Announcement banner (if present in draft)
   - Highlights grid (6 pillars)
   - Detailed updates section (6 pillar cards)
4. **Move current content** to archived div with `style="display: none;"`
5. **Remove oldest week** if more than 3 weeks
6. **Update footer** week text
7. **Update copyToSlack()** function with Slack summary from draft

### Step 4: Emoji Handling

Use text emojis for reliability:
- Advertiser Experience: 📊
- Marketing Channels: 💬
- Product Sourcing: 🌐
- Foundations: 💎
- Growth Agent: 🤖
- Brand: 🎨

### Step 5: Confirm

1. Validate HTML structure
2. Tell user the file is ready
3. Provide deployment instructions

## HTML Templates

### Highlights Grid Cell
```html
<div class="highlight-cell [css-class]">
    <div class="cell-header">
        <span class="cell-icon">[emoji]</span>
        <span class="cell-label">[Pillar Name]</span>
    </div>
    <p class="cell-content">[highlight text from draft]</p>
</div>
```

### Pillar Card
```html
<div class="pillar-card [css-class]">
    <div class="pillar-header">
        <div class="pillar-info">
            <span class="pillar-number">[01-06]</span>
            <div class="pillar-meta">
                <h3>[Pillar Name]</h3>
                <p class="pillar-lead">[Lead Name]</p>
            </div>
        </div>
        <span class="pillar-status">[Status]</span>
    </div>
    <div class="wins-section">
        <div class="wins-label">Wins</div>
        <ul class="wins-list">
            [wins from draft as <li> items]
        </ul>
    </div>
    <div class="team-section">
        <div class="wins-label">Team Activity</div>
        <ul class="wins-list">
            [team activity from draft as <li> items]
        </ul>
    </div>
</div>
```

## Pillar Mapping

| Number | CSS Class | Name | Lead |
|--------|-----------|------|------|
| 01 | ads | Advertiser Experience | James Ayres |
| 02 | messaging | Marketing Channels | James Ayres |
| 03 | network | Product Sourcing | Jeff Kraemer |
| 04 | foundations | Foundations | Jeff Kraemer |
| 05 | growth | Growth Agent | Kazden Cattapan |
| 06 | brand | Brand | David Diliberto |

## Deployment Reminder

After publishing, remind the user:
1. Preview locally: `python3 -m http.server 8080` then visit http://localhost:8080
2. Deploy to Quick: Drag `index.html` to quick.shopify.io with subdomain `mm-design-wins`
3. Live URL: https://mm-design-wins.quick.shopify.io
