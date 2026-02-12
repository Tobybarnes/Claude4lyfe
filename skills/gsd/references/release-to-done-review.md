# Release → Done Review

This review validates that you've achieved your intended outcomes and captured learnings.

---

## Purpose

The release phase is for **shipping value and measuring impact**. You should have:
- Rolled out to your target audience
- Measured success against your baseline
- Polished rough edges
- Documented learnings

The review asks: **Did we achieve what we set out to do?**

---

## Required Elements

### 1. Success Metrics: Before & After
Show the results against your targets.

```
BAD:  "We improved conversion."

GOOD: "Primary Metric: Mobile Checkout Conversion

       | Metric      | Baseline | Target | Actual | Status |
       |-------------|----------|--------|--------|--------|
       | Conversion  | 54%      | 56%    | 55.8%  | Near   |
       | Abandonment | 32%      | 27%    | 26%    | Beat   |
       | Load time   | 1.8s     | 1.5s   | 1.3s   | Beat   |

       Analysis:
       - Conversion improved 1.8 points (target: 2 points)
       - Larger impact on mobile than desktop (as expected)
       - Underperformed in APAC region (investigating)

       Dashboard: [link]"
```

### 2. What We Learned
Key insights from the project.

```
Technical learnings:
- GraphQL batching reduced API calls by 60% (unexpected win)
- Mobile Safari has unique scroll behavior (caused 2 bugs)
- Load testing caught a race condition we'd have missed

Process learnings:
- Early designer involvement saved 2 weeks of rework
- Weekly stakeholder updates prevented surprises
- Should have load tested earlier (found issues in Week 4)

What we'd do differently:
- Start with mobile-first design (we retrofitted)
- Involve Support team earlier (they found edge cases)
- Set up monitoring before feature flags (not after)
```

### 3. What's Left
What didn't ship? What's the plan?

```
Shipped:
- [x] Core feature (100% rollout)
- [x] Mobile optimization
- [x] A/B testing framework

Not shipped (deprioritized):
- [ ] Tablet-specific layout (low traffic, not worth it)
- [ ] Animation polish (nice-to-have, moved to backlog)

Follow-up work:
- APAC performance investigation (assigned to [name], ETA: 2 weeks)
- Tech debt cleanup (PR open, merging next sprint)
- Documentation update (scheduled for next week)
```

### 4. Tech Debt Status
What debt was created? What's the plan?

```
Tech debt created:
1. Feature flag cleanup (remove after 30 days)
   - Owner: [name]
   - Ticket: JIRA-1234
   - ETA: Jan 15

2. Legacy adapter (temporary bridge to old system)
   - Owner: [name]
   - Ticket: JIRA-1235
   - ETA: Q2 (blocked on migration)

3. Test coverage gaps (80% → target 90%)
   - Owner: [name]
   - Ticket: JIRA-1236
   - ETA: Next sprint

Tech debt resolved:
- Removed deprecated API endpoint
- Cleaned up unused feature flags from 2023
```

### 5. Bug Trend
Is quality improving or degrading?

```
Bug status:
- Bugs found during release: 12
- Bugs fixed: 10
- Bugs remaining: 2 (P3, not blocking)

Trend: Decreasing (8 bugs/week → 2 bugs/week)

Open issues:
1. [P3] Tooltip flicker on hover (cosmetic)
2. [P3] Slow load on 3G networks (edge case)
```

### 6. Final Demo
A **2-minute video** showing the shipped product.

```
Video should show:
1. The live product (not staging)
2. Real user flows
3. Impact highlights
4. What's different from before
```

---

## Review Checklist

Before submitting for Release → Done review:

- [ ] Success metrics show before/after comparison
- [ ] All primary metrics measured against baseline
- [ ] Analysis explains why targets were hit/missed
- [ ] Key learnings documented (technical and process)
- [ ] What we'd do differently is captured
- [ ] Remaining work is documented with owners
- [ ] Tech debt has tickets and owners
- [ ] Bug trend is documented
- [ ] No P1/P2 bugs open
- [ ] Final demo video included
- [ ] Dashboard linked showing current metrics

---

## Outcomes vs. Activities

This review is about **outcomes**, not activities.

```
BAD:  "We completed all milestones and shipped on time."

GOOD: "We set out to improve mobile conversion by 2 points.
       We achieved 1.8 points, reaching 55.8% conversion.
       This represents ~$X additional GMV per month.

       We learned that APAC performance needs separate optimization,
       which we'll address in Q2."
```

---

## Common Rejection Reasons

1. **No before/after metrics** - Can't assess success without data
2. **Metrics not measured yet** - Wait until you have results
3. **No learnings captured** - What did you learn?
4. **Tech debt untracked** - Where are the tickets?
5. **P1/P2 bugs open** - Not ready to close
6. **No analysis** - Why did you hit/miss targets?
7. **Follow-up work unassigned** - Who owns what's left?

---

## What "Done" Means

A project is Done when:

1. **Outcomes measured** - You know if you succeeded
2. **Learnings captured** - Future teams benefit
3. **Debt tracked** - Nothing falls through cracks
4. **Bugs under control** - Quality is stable
5. **Handoff complete** - Ongoing work has owners

Done doesn't mean perfect. It means you achieved your intended outcomes and documented everything needed for ongoing maintenance.
