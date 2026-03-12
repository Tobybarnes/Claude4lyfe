---
name: ui-details
description: Mandatory UI detail rules for all frontend code. Enforces text wrapping, concentric radii, icon animations, font smoothing, tabular numbers, interruptible animations, staggered enters, subtle exits, optical alignment, shadow-over-border, and image outlines. Use when generating, reviewing, or editing any frontend code (HTML/CSS/JS/React/Tailwind).
args:
  - name: target
    description: The component or area to review/apply rules to (optional)
    required: false
user-invokable: true
metadata:
  author: toby-barnes
  version: "1.0.0"
---

These are **rules**, not principles. Apply them whenever generating or reviewing frontend code (HTML/CSS/JS/React/Tailwind). Do not treat them as optional guidance.

---

## Rule 1: Text Wrapping

Prevent orphaned words and uneven line breaks.

- Apply `text-wrap: balance` to headings, labels, and short UI text blocks.
- Apply `text-wrap: pretty` for longer body paragraphs.
- Never leave short UI strings without one of these properties.

```css
h1, h2, h3, label, .card-title {
  text-wrap: balance;
}

p {
  text-wrap: pretty;
}
```

**Tailwind:**
```html
<h1 class="text-balance">...</h1>
<p class="text-pretty">...</p>
```

---

## Rule 2: Concentric Border Radius

Nested elements must have harmonious border radii.

**Formula:** `outer radius = inner radius + padding`

- Inner element: `border-radius: 12px`
- Container padding: `8px`
- Outer container: `border-radius: 20px`

Always recalculate when a rounded card contains a rounded button, chip, image, or input.

```css
.outer {
  border-radius: 20px; /* inner (12px) + padding (8px) */
  padding: 8px;
}
.inner {
  border-radius: 12px;
}
```

**Anti-pattern (WRONG):**
```css
.outer { border-radius: 12px; padding: 8px; }
.inner { border-radius: 12px; }
```

---

## Rule 3: Contextual Icon Animations

Icons that appear/disappear contextually must animate with opacity, scale, and blur.

- Never hard-swap icons without a transition.
- Animate `opacity`, `scale`, and `filter: blur()` together.
- Prefer spring-based animations (e.g., Framer Motion) over linear transitions.

```jsx
import { AnimatePresence, motion } from "framer-motion";

{isCopied ? (
  <motion.div
    key="check"
    initial={{ opacity: 0, scale: 0.8, filter: "blur(4px)" }}
    animate={{ opacity: 1, scale: 1, filter: "blur(0px)" }}
    exit={{ opacity: 0, scale: 0.8, filter: "blur(4px)" }}
    transition={{ type: "spring", duration: 0.3, bounce: 0 }}
  >
    <CheckIcon />
  </motion.div>
) : (
  <motion.div key="copy" ...>
    <CopyIcon />
  </motion.div>
)}
```

**CSS-only fallback:**
```css
.icon {
  transition: opacity 150ms ease, transform 150ms ease, filter 150ms ease;
}
.icon.hidden {
  opacity: 0;
  transform: scale(0.85);
  filter: blur(3px);
}
```

---

## Rule 4: Crisp Text Rendering

Always apply font smoothing globally at the root/layout level.

```css
body {
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}
```

**Tailwind:**
```html
<body class="font-sans antialiased">
```

---

## Rule 5: Tabular Numbers

Any UI element where numbers change dynamically MUST use `font-variant-numeric: tabular-nums`.

Applies to: counters, prices, timers, stats, table columns with numbers.

```css
.counter, .price, .timer, .stat {
  font-variant-numeric: tabular-nums;
}
```

**Tailwind:**
```html
<span class="tabular-nums">1,234</span>
```

---

## Rule 6: Interruptible Animations

Animations must not feel stuck when users interact rapidly.

- Use **CSS transitions** for interactive state changes (hover, toggle, open/close). These retarget mid-animation.
- Use **CSS keyframe animations** only for one-shot staged sequences (intro animations, loading states).
- Never use keyframe animations for user-triggered toggles.

| Use Case | Use |
|---|---|
| Toggle, hover, open/close | CSS transition |
| Intro / one-shot sequence | CSS keyframe |

---

## Rule 7: Staggered Enter Animations

Entering content must feel alive, not like a single flat block.

- Break large entering containers into semantic sections (title, description, CTA).
- Apply a `100ms` stagger delay between sections.
- For titles/headings, split into individual word `<span>` elements with `80ms` per word.
- Start state: `translateY(8px)`, `blur(5px)`, `opacity: 0`.

```css
@keyframes enter {
  from {
    transform: translateY(8px);
    filter: blur(5px);
    opacity: 0;
  }
}

.animate-enter {
  animation: enter 800ms cubic-bezier(0.25, 0.46, 0.45, 0.94) both;
  animation-delay: calc(var(--delay, 0ms) * var(--stagger, 0));
}
```

---

## Rule 8: Subtle Exit Animations

Exit animations must recede quietly — less intensity than enter animations.

- Enter: full translate distance, blur, opacity.
- Exit: small fixed value (e.g., `-12px`), same blur and opacity.
- Do NOT mirror enter and exit with the same intensity.

```jsx
<motion.div
  initial={{ opacity: 0, y: "calc(-100% - 4px)", filter: "blur(4px)" }}
  animate={{ opacity: 1, y: 0, filter: "blur(0px)" }}
  exit={{
    opacity: 0,
    y: "-12px",       // subtle — not full distance
    filter: "blur(4px)",
  }}
  transition={{ type: "spring", duration: 0.45, bounce: 0 }}
/>
```

---

## Rule 9: Optical Alignment

Geometric centering looks off for certain icon/text combinations. Use optical adjustment.

- When a button contains text and an icon, reduce padding on the icon side slightly.
- Triangles, play buttons, and asymmetric icons require manual margin nudges.
- Fix asymmetric icons inside the SVG itself when possible.

```html
<button class="flex items-center gap-2 pl-4 pr-3">
  <span>Play</span>
  <PlayIcon class="ml-0.5" />
</button>
```

---

## Rule 10: Shadows Instead of Borders

Prefer `box-shadow` over `border` for card and button outlines, especially in light mode.

- Use 3-layer shadows for richness.
- Add `transition-[box-shadow]` for hover states.
- Use semi-transparent RGBA values — never hardcoded colors.

```css
.card {
  box-shadow:
    0px 0px 0px 1px rgba(0, 0, 0, 0.06),
    0px 1px 2px -1px rgba(0, 0, 0, 0.06),
    0px 2px 4px 0px rgba(0, 0, 0, 0.04);
  transition: box-shadow 150ms ease;
}
```

**When to use borders instead:** Dark mode flat components, dividers, table cells.

---

## Rule 11: Image Outline Overlay

Add a `1px` semi-transparent outline with `outline-offset: -1px` to images.

- Light mode: `rgba(0, 0, 0, 0.1)`
- Dark mode: `rgba(255, 255, 255, 0.1)`

```css
.image-outline {
  outline: 1px solid rgba(0, 0, 0, 0.1);
  outline-offset: -1px;
}

.dark .image-outline {
  outline-color: rgba(255, 255, 255, 0.1);
}
```

---

## Checklist (run on every frontend output)

- [ ] Headings use `text-wrap: balance`
- [ ] Nested rounded elements follow `outer = inner + padding`
- [ ] Swapping icons use opacity/scale/blur transition
- [ ] `antialiased` applied to body
- [ ] Dynamic numbers use `tabular-nums`
- [ ] Toggle/hover animations use CSS transitions, not keyframes
- [ ] Entering content is staggered
- [ ] Exit animations use subtle fixed translate, not full distance
- [ ] Asymmetric icons have optical margin nudge
- [ ] Cards/buttons use layered `box-shadow` instead of `border`
- [ ] Images have `1px` semi-transparent outline overlay

---

Source: [Details that make interfaces feel better](https://jakub.kr/writing/details-that-make-interfaces-feel-better) by Jakub Krehel.
