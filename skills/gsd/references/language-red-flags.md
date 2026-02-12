# Language Red Flags

This reference catalogs vague language patterns that signal unclear thinking. Use this to scan GSD documents for problems.

---

## The Core Principle

**Vague language is a red flag for vague thinking.**

If the author can't be specific, they probably haven't thought it through. Reviewers will notice.

---

## Weasel Words

### Vague Improvement Verbs
These words promise change without defining it:

| Word | Problem | Fix |
|------|---------|-----|
| **Improve** | Improve from what to what? | "Reduce latency from 200ms to 100ms" |
| **Enhance** | Enhance how? | "Add 3 new filtering options" |
| **Optimize** | Optimize which metric? | "Reduce memory usage by 30%" |
| **Streamline** | Streamline compared to what? | "Reduce steps from 5 to 2" |
| **Simplify** | Simplify by what measure? | "Remove 3 configuration options" |
| **Modernize** | Modern according to whom? | "Migrate from X to Y framework" |

### Undefined Quantities
These words hide the actual numbers:

| Word | Problem | Fix |
|------|---------|-----|
| **Various** | Which ones? | List them explicitly |
| **Multiple** | How many? | "3 payment methods" |
| **Several** | Several = ? | Give the actual number |
| **Many** | Many = ? | "12 affected merchants" |
| **Significant** | How significant? | "30% improvement" |
| **Substantial** | Quantify it | "$500K annual savings" |
| **Considerable** | In what way? | Provide specific metrics |

### Buzzwords Without Definition
These sound impressive but mean nothing:

| Word | Problem | Better |
|------|---------|--------|
| **Modern** | Modern compared to what? | "Uses React 18 instead of jQuery" |
| **Next-gen** | Next-gen means what exactly? | Describe the specific capabilities |
| **Cutting-edge** | Cutting-edge how? | Name the specific technology |
| **World-class** | By what measure? | "Top 10% in industry benchmarks" |
| **Best-in-class** | Compared to which class? | "Faster than Stripe, Square, PayPal" |
| **Scalable** | Scales to what? | "Handles 10x current traffic" |
| **Robust** | Robust against what? | "99.99% uptime SLA" |
| **Flexible** | Flexible in what ways? | "Supports 5 configurable options" |
| **Intuitive** | Intuitive to whom? | "80% task completion without help" |
| **Seamless** | Seamless how? | "Zero-downtime deployment" |
| **Enterprise-grade** | What does this mean? | Specify the actual requirements |

---

## Escape Hatches

### Indefinite Deferrals
These push hard questions to later:

| Pattern | Problem | Fix |
|---------|---------|-----|
| **TBD** | When will it be determined? | Set a date or make the decision now |
| **TBA** | Who will announce and when? | Commit to a timeline |
| **Phase 2** | Is Phase 2 approved? Scoped? | Define what's in Phase 1 vs. out of scope |
| **Future work** | Is this committed or wishful? | If not committed, say "out of scope" |
| **As needed** | Who decides when it's needed? | Define the criteria |
| **As appropriate** | Appropriate by what standard? | Specify the conditions |

### Hedging Language
These avoid commitment:

| Pattern | Problem | Fix |
|---------|---------|-----|
| **Approximately** | When precision is needed | Give a range: "between X and Y" |
| **Roughly** | Rough isn't a plan | "3-4 weeks" is better than "roughly a month" |
| **Tentative** | Is this the plan or not? | "Plan A (committed) with Plan B (contingency)" |
| **Preliminary** | What makes it final? | State what needs to happen to finalize |
| **Initial** | What comes after initial? | Define the full scope |

---

## Incomplete Specifications

### Incomplete Lists
These hide scope:

| Pattern | Problem | Fix |
|---------|---------|-----|
| **"such as X, Y, etc."** | What else is in the etc.? | List all items, or say "including but not limited to" with a cap |
| **"and more"** | How much more? | Complete the list |
| **"various systems"** | Which systems? | Name each system |
| **"multiple teams"** | Which teams? | "Platform, Payments, and Identity teams" |
| **"several integrations"** | Which integrations? | List them |

### Missing Specifics
These omit critical details:

| Pattern | Problem | Fix |
|---------|---------|-----|
| **"users"** | Which users? | "Plus merchants with >$1M GMV" |
| **"performance"** | Which metric? | "p99 latency" or "throughput" |
| **"quality"** | Quality of what? | "Test coverage" or "bug rate" |
| **"experience"** | Whose experience? How measured? | "NPS score from checkout survey" |

---

## Subjective Language

### Unmeasurable Claims
These can't be verified:

| Claim | Problem | Fix |
|-------|---------|-----|
| **"Better user experience"** | Better how? | "Reduces checkout time by 30 seconds" |
| **"Faster"** | Than what? By how much? | "Reduces from 5s to 2s" |
| **"Easier"** | For whom? By what measure? | "Reduces steps from 7 to 3" |
| **"More reliable"** | What's the reliability target? | "99.9% uptime vs current 99.5%" |
| **"Professional quality"** | Quality standard? | "Passes WCAG 2.1 AA accessibility" |
| **"High engagement"** | What number is "high"? | "DAU/MAU ratio of 40%" |

---

## Scanning for Red Flags

When reviewing a GSD document:

### Quick Scan (30 seconds)
Search for these words:
- improve, enhance, optimize, streamline
- various, multiple, several, significant
- modern, next-gen, scalable, robust
- TBD, etc., Phase 2, as needed

### Deep Scan (5 minutes)
For each red flag found:
1. What specific information is missing?
2. Can the author provide it?
3. Is this a blocker or just needs clarification?

---

## How to Fix Red Flags

### Before: Vague
```
"We will improve the checkout experience by streamlining the flow
and enhancing performance, integrating with various payment systems,
and building a modern, scalable solution."
```

### After: Specific
```
"We will reduce checkout from 5 steps to 2 steps, decrease page load
from 3s to 1s, integrate with Stripe, PayPal, and Apple Pay, and
build on our existing React/GraphQL stack to handle 10x current traffic."
```

---

## Red Flag Density

Count red flags per section:

| Red Flags | Assessment |
|-----------|------------|
| 0-1 | Clear thinking, minor clarifications needed |
| 2-3 | Some ambiguity, needs revision |
| 4-5 | Significant clarity problems |
| 6+ | Fundamental clarity issues, likely not ready for review |

---

## Why This Matters

Vague proposals:
- Waste reviewer time asking for clarification
- Lead to misaligned expectations
- Result in scope creep during execution
- Make success impossible to measure
- Get declined more often

Specific proposals:
- Get approved faster
- Set clear expectations
- Enable focused execution
- Make success measurable
- Build credibility with reviewers

**Invest the time to be specific. It pays off.**
