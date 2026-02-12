# Writing Strong Proposals

Proposals should be **lightweight and fast** - spend less time writing documents, more time building. A good proposal takes hours, not days.

---

## What Makes a Great Proposal

Great proposals share key characteristics that set them apart:

### 1. Strong Case for Net Shopify Value
Don't just argue why this helps your team or product—make the case for how **Shopify will be better overall** because of this work. Great proposals look at the net effect across the company.

```
BAD:  "This helps our team ship faster."

GOOD: "This reduces checkout latency by 200ms, which our data shows increases
       conversion by 0.3% across all merchants—approximately $X GMV annually."
```

### 2. First Principles Reasoning
Make your case from fundamentals. Why does solving this commerce problem matter? A proposal that reasons from first principles is compelling because it doesn't rely on "we've always done it this way" or copying competitors.

```
BAD:  "Competitors have this feature, so we should too."

GOOD: "Merchants need to know when inventory is low to avoid overselling.
       Currently they check manually. Automating this notification removes
       friction from their core job: selling."
```

### 3. Aims to Reduce System Complexity
Keeping overall system complexity manageable is critical for fast movement. Excessive complexity slows the entire company. Great proposals actively aim to **reduce** complexity, not add to it.

```
BAD:  "We'll add a new service to handle this edge case."

GOOD: "We'll extend the existing notifications service to handle this case,
       consolidating logic that's currently duplicated in three places."
```

### 4. Alignment with Mission, Themes, and Infrastructure
Every proposal should be tested against:
- **The mission**: Does this increase the rate of successful entrepreneurship on the internet?
- **2026 Themes**: Does this strengthen Shopify's position in agentic commerce? (See `themes-2026.md`)
  - Catalog: Making products discoverable everywhere
  - Trust: Shop Pay, Shop Promise, Shop Identity working everywhere
  - Shop App: The single best shopping destination
  - Platform APIs: Best products with best APIs for all platforms
  - Sidekick: The n+1 employee for every merchant
- **Available infrastructure**: Are we building on what exists, or creating unnecessary duplication?

```
BAD:  "This project improves our internal tooling."

GOOD: "This project strengthens Catalog by adding real-time inventory signals,
       enabling agents to recommend products that are actually in stock.
       This directly supports the 'discoverable everywhere' theme and
       our position as foundation of agentic commerce."
```

### 5. Infrastructure Over Problem-Solving (for Recurring Problems)
For common, recurring problems, great proposals suggest **building infrastructure to make solving that problem trivial**, rather than just solving the specific instance.

```
BAD:  "We'll build a custom retry mechanism for this API."

GOOD: "We'll extend the platform's retry library to handle this pattern,
       which will also fix the same problem in 12 other places."
```

### 6. Thoughtful Prototype Phase
Address how the prototype phase will be conducted. Depending on the project type:
- Will you need to **rapidly prune** unfruitful approaches?
- Do you need to **quickly gain knowledge** (especially for hardware or unfamiliar domains)?
- What's the culture of experimentation during prototype?

### 7. Passes the Tobi Test

Great proposals can answer Tobi's common questions:

| Question | What It Tests |
|----------|---------------|
| "Why can't this be 10x simpler?" | Have you challenged complexity? |
| "How does this help merchants win?" | Is merchant value clear? |
| "Is this a platform capability or just a feature?" | Are you thinking long-term? |
| "What's the real problem we're solving?" | First principles thinking |
| "Have we tried the simple approach first?" | Simplicity as default |
| "What's the smallest thing we can ship?" | Incremental delivery |

**Tobi's Pet Peeves (Avoid These):**
- Over-engineering simple problems
- Building frameworks instead of solutions
- Complexity without proportional value
- Feature-factory mentality
- Solutions looking for problems
- Premature optimization

```
BAD:  "We'll build a flexible, configurable framework that can handle
       any future use case..."

GOOD: "We'll solve the specific problem for merchants today. If we need
       to generalize later, we'll have real data on what flexibility
       actually matters."
```

---

## Proposal Structure

### 1. Title
`[Product Name]: [Clear, Descriptive Project Name]`

The title should tell someone what this is about without reading further.

```
BAD:  "Checkout improvements"
GOOD: "Checkout: One-page checkout for mobile conversion"
```

### 2. TL;DR (2-3 sentences)
Answer: What are you building and why does it matter?

```
BAD:  "We're improving the checkout experience."

GOOD: "Mobile checkout conversion is 12% lower than desktop. We'll consolidate
       the 3-page flow into a single scrollable page, targeting a 3% conversion lift."
```

### 3. Problem Statement
Answer: What problem are you solving and why now?

- Be specific about the pain point
- Quantify if possible (conversion rates, support tickets, churn)
- Explain why this is the right time to solve it

```
BAD:  "Merchants want better checkout."

GOOD: "Mobile traffic is now 68% of checkout sessions, but conversion is 54% vs
       66% on desktop. Exit surveys show 'too many steps' as the #1 complaint.
       Q4 is our highest-traffic quarter - fixing this before Black Friday
       would maximize impact."
```

### 4. Intended Outcomes
Answer: What does success look like?

This is NOT a list of features. It's what changes in the world if you succeed.

```
BAD:  "- Build one-page checkout
       - Add progress indicator
       - Improve mobile styling"

GOOD: "- Mobile checkout conversion increases from 54% to 57%
       - Mobile checkout abandonment decreases by 15%
       - Merchant NPS for checkout improves by 5 points"
```

### 5. Success Metrics
Answer: How will you measure success?

Include:
- Baseline (current state)
- Target (where you want to be)
- How you'll measure it
- When you'll measure it

```
BAD:  "We'll track conversion rate."

GOOD: "Primary metric: Mobile checkout conversion rate
       - Baseline: 54% (measured Oct 2024)
       - Target: 57% (+3 points)
       - Measurement: 30 days post-launch, A/B test with 50% rollout
       - Dashboard: [link to existing dashboard]"
```

See `success-metrics-guide.md` for the full framework.

### 6. Scope
Answer: What's in and what's out?

Be explicit about boundaries. This prevents scope creep and sets expectations.

```
IN SCOPE:
- One-page checkout for mobile web
- Integration with existing payment methods
- A/B testing framework

OUT OF SCOPE:
- Desktop checkout changes (separate project)
- New payment method integrations
- Checkout extensibility for apps
```

### 7. Team & Resources
Answer: Who's doing this and what do they need?

- List roles needed (not necessarily names)
- Estimate effort in weeks, not hours
- Note any dependencies on other teams

```
Team:
- 1 Senior Engineer (lead)
- 1 Engineer
- 0.5 Designer (shared with other project)
- PM support from existing team

Duration: 8 weeks (prototype: 2 weeks, build: 4 weeks, release: 2 weeks)
Confidence: 70% (higher after prototype)
```

### 8. Timeline
Answer: When will this ship?

- Use phases (Prototype, Build, Release)
- Include key milestones
- Note confidence level

```
Timeline:
- Prototype: Nov 1-15 (2 weeks)
- Prototype Review: Nov 15
- Build: Nov 16 - Dec 13 (4 weeks)
- Build Review: Dec 13
- Release: Dec 14-27 (2 weeks, gradual rollout)
- Target GA: Dec 27

Confidence: 70% - dependent on Design availability
```

### 9. Risks & Dependencies
Answer: What could go wrong? What do you need from others?

```
Risks:
- Design team capacity (mitigation: early alignment meeting scheduled)
- Holiday code freeze (mitigation: targeting completion before Dec 20)

Dependencies:
- Payment team API (already available)
- Analytics instrumentation (need 2 days from Data team)
```

---

## Common Proposal Mistakes

### 1. Too Long
Proposals should be scannable in 5 minutes. If you're writing pages, you're writing a spec, not a proposal.

### 2. Features Instead of Outcomes
"Build X" is not success criteria. "X improves Y by Z%" is.

### 3. No Baseline Metrics
You can't measure improvement without knowing the starting point.

### 4. Hiding Details in External Docs
Key information should be in Vault. Link to docs for details, but include summaries.

### 5. Unrealistic Timelines
If you've never built something like this, add buffer. Prototype phase is for de-risking, not delivery.

### 6. No Risks Identified
Every project has risks. If you list none, reviewers assume you haven't thought about it.

### 7. Vague Team Composition
"We'll figure out staffing" is not a plan. Be specific about roles and availability.

### 8. Team-Only Justification
Arguing "this helps our team" without explaining net Shopify value. Reviewers want to see company-wide impact.

### 9. Adding Complexity Without Justification
Proposing new services, systems, or patterns without acknowledging the complexity cost or exploring simpler alternatives.

### 10. Solving the Instance, Not the Pattern
Building a one-off solution for a recurring problem instead of proposing infrastructure that makes the problem trivial everywhere.

### 11. Skipping First Principles
Justifying work with "competitors do it" or "stakeholders asked for it" instead of reasoning from commerce fundamentals.

---

## Proposal Review Checklist

Before submitting, verify:

**Strategic Foundation**
- [ ] Makes a clear case for net Shopify value (not just team value)
- [ ] Aligned with 2026 themes (Catalog, Trust, Shop App, APIs, Sidekick)
- [ ] Strengthens Shopify's position in agentic commerce
- [ ] Reasoning is from first principles (not "competitors do it")
- [ ] Aligned with mission and available infrastructure
- [ ] Addresses system complexity (reduces or justifies addition)
- [ ] For recurring problems: considers infrastructure approach

**Content Quality**
- [ ] TL;DR is clear and compelling (2-3 sentences)
- [ ] Problem is quantified with data
- [ ] Success criteria are measurable outcomes, not activities
- [ ] Baseline metrics are established
- [ ] Scope is explicit (in/out)

**Execution Readiness**
- [ ] Team and timeline are realistic
- [ ] Prototype phase approach is thoughtful for the problem type
- [ ] Risks are identified with mitigations
- [ ] Dependencies are named with owners
- [ ] Key info is in Vault, not just in linked docs
