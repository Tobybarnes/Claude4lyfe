# Prototype → Build Review

This review validates that you've de-risked the biggest unknowns and are ready to commit to building.

---

## Purpose

The prototype phase is for **experimentation**. You should have:
- Explored multiple approaches
- Validated key assumptions
- Made critical decisions
- Thrown away prototype code (it's not production code)

The review asks: **Are we confident enough to invest in building this?**

---

## Required Elements

### 1. Prototype Learnings
What did you discover? What worked? What didn't?

```
BAD:  "We built a prototype and it works."

GOOD: "We explored 3 approaches:
       1. Client-side rendering: Fast, but SEO issues
       2. Server-side rendering: Good SEO, but slower initial load
       3. Hybrid approach: Best of both, moderate complexity

       Decision: Hybrid approach. See ADR-123 for full analysis.

       Key learning: Initial assumption about API latency was wrong.
       Actual latency is 200ms (estimated 50ms). This changes our caching strategy."
```

### 2. Proposed Solution
What are you building? Be specific.

```
BAD:  "We'll build the checkout redesign."

GOOD: "Solution: Single-page checkout with progressive disclosure
       - Mobile-first responsive design
       - Lazy-load payment methods after address entry
       - Client-side validation with server-side backup
       - A/B test framework for gradual rollout

       Architecture: [link to tech design]
       Figma: [link to designs]"
```

### 3. Tech Design (Signed Off)
The technical approach must be documented and reviewed.

- Architecture diagram
- Key technical decisions with rationale
- Integration points with other systems
- Data model changes (if any)
- Performance considerations

**Note**: Tech design should be signed off by relevant technical reviewers BEFORE this review.

### 4. Key Decisions Made
What decisions have been locked in? What's the rationale?

```
Decisions made during prototype:
1. Use GraphQL over REST (performance, flexibility) - ADR-124
2. Store in PostgreSQL, not Redis (durability requirements) - ADR-125
3. No support for legacy browsers (< 2% traffic) - Product decision

Open questions resolved:
- Q: Can we reuse existing auth flow? A: Yes, with minor modifications
- Q: Do we need new infrastructure? A: No, existing capacity sufficient
```

### 5. Staffing & Estimates
Who's building this? How long?

```
Team:
- Tech Lead: [name] (full-time)
- Engineers: [name], [name] (full-time)
- Designer: [name] (50%, shared with Project X)

Estimate:
- Build phase: 6 weeks
- Confidence: 80% (up from 60% at proposal)

Changes from proposal:
- Added 1 week for performance optimization (learned from prototype)
- Reduced design work (reusing existing components)
```

### 6. Dependencies & Risks
What could block you? What do you need from others?

```
Dependencies:
- Platform API v2 (available, tested in prototype)
- Design System components (PR open, merging this week)
- Analytics instrumentation (scheduled for Week 2)

Risks:
1. Performance under load (mitigation: load test in Week 3)
2. Designer availability during holidays (mitigation: front-load design work)
3. Integration with legacy system (mitigation: dedicated spike in Week 1)
```

### 7. Updated Success Metrics
Refine metrics based on prototype learnings.

```
Original target: 3% conversion lift
Updated target: 2.5% conversion lift (more realistic based on prototype data)

Added metric: Page load time <2s (discovered importance during prototype)
```

---

## Video Walkthrough

Include a **2-minute video** showing:
- The prototype in action
- Key learnings demonstrated
- The proposed solution approach

Low-fi is fine. Screen recording with voiceover works.

---

## Review Checklist

Before submitting for Prototype → Build review:

- [ ] Prototype learnings documented (what worked, what didn't)
- [ ] Multiple approaches explored and documented
- [ ] Proposed solution is specific and detailed
- [ ] Tech design exists and is signed off
- [ ] Key decisions documented with rationale
- [ ] Open questions from proposal are resolved
- [ ] Team and timeline are updated based on learnings
- [ ] Dependencies identified with owners and dates
- [ ] Risks identified with mitigations
- [ ] Success metrics refined based on prototype
- [ ] Video walkthrough included

---

## Common Rejection Reasons (OK1 Patterns)

1. **No real exploration** - Built one thing, called it a prototype
2. **Tech design not signed off** - Architecture not reviewed by relevant technical reviewers
3. **Key decisions still open** - Too much TBD for build phase
4. **Prototype code going to production** - Should be thrown away
5. **No learnings documented** - What did the prototype teach you?
6. **Estimates unchanged** - Prototype should inform estimates
7. **Figma not annotated** - Reviewers can't tell what to look at without guidance
8. **Links not accessible** - Designs or docs require permissions reviewer doesn't have
9. **"We validated the approach" without evidence** - How did you validate? With whom?
10. **Stakeholder alignment claimed but not documented** - Who agreed? When? What did they say?

---

## The "Hell Yes" Standard

Reviewers apply this standard: **Would approving this feel like a "hell yes"?**

The purpose of this review is to prevent **building the right thing the wrong way**. If there's doubt about the technical approach, more prototype time is better than build-phase surprises.

Questions reviewers ask themselves:
- If I approve, will this team succeed in build phase?
- Are the remaining unknowns acceptable, or should more be de-risked?
- Has the team learned enough to commit confidently?
