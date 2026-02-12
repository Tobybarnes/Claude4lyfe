# Build → Release Review

This review validates that you've built the right thing and are ready to ship to users.

---

## Purpose

The build phase is for **building production-quality software**. You should have:
- Implemented the solution from prototype review
- Written tests and documentation
- Validated with internal users
- Prepared for production deployment

The review asks: **Is this ready for real users?**

---

## Required Elements

### 1. Demo Video
A **2-minute video** showing the launch-ready build.

- Show the actual product, not slides
- Demonstrate key user flows
- Highlight what's new/different
- Low-fi is fine (screen recording with voiceover)

```
Video should cover:
1. The problem being solved (10 sec)
2. The solution in action (90 sec)
3. Key differentiators (20 sec)
```

### 2. Test Instructions
How can reviewers try it themselves?

```
BAD:  "It's behind a feature flag."

GOOD: "To test:
       1. Go to [staging URL]
       2. Log in with test account: test@shopify.com / password123
       3. Enable flag: Settings → Labs → New Checkout
       4. Navigate to /checkout and complete a test purchase

       Test scenarios:
       - Happy path: Credit card purchase
       - Edge case: Address validation error
       - Edge case: Payment failure recovery"
```

### 3. Success Dashboard
Link to the dashboard tracking your metrics.

```
BAD:  [Screenshot of dashboard]

GOOD: "Live dashboard: [link]

       Metrics tracked:
       - Primary: Conversion rate (baseline: 54%)
       - Secondary: Time to checkout, abandonment rate
       - Guardrails: Error rate, page load time

       Alert configured: PagerDuty if error rate >1%"
```

**Important**: Link to the actual dashboard, not screenshots. Screenshots go stale.

### 4. Post-Launch Targets
What does success look like after launch?

```
Launch targets:
- Week 1: 10% rollout, monitor for errors
- Week 2: 50% rollout if no issues
- Week 3: 100% rollout
- Day 30: Measure primary metric against baseline

Success criteria:
- Conversion: 54% → 56% (+2 points)
- Error rate: <0.5%
- No P1 incidents
```

### 5. Operational Readiness
Is the system production-ready?

```
Operational checklist:
- [x] Logging: Structured logs with correlation IDs
- [x] Monitoring: Grafana dashboard [link]
- [x] Alerting: PagerDuty integration configured
- [x] Runbook: On-call documentation [link]
- [x] Rollback plan: Feature flag disable in <5 min
- [x] Load tested: 2x expected traffic
```

### 6. Figma Links (User-Facing Only)
For user-facing features, include final designs.

```
Design artifacts:
- Final designs: [Figma link]
- Design review: Approved by [designer] on [date]
- Accessibility review: Passed WCAG 2.1 AA
```

### 7. Known Issues
What's not perfect? What will you fix later?

```
Known issues (shipping with):
1. Minor: Tooltip doesn't appear on mobile Safari (fix in v1.1)
2. Minor: Animation jank on low-end Android (acceptable, monitoring)

NOT shipping with (blocked):
- None

Tech debt created:
- Temporary flag logic (remove after 100% rollout)
- Legacy API adapter (deprecate in Q2)
```

### 8. Go-to-Market Readiness (Required for Merchant-Facing)
**This is not optional.** Launching without support readiness creates incidents.

```
BAD:  "GTM: Will do after launch"

GOOD: "GTM readiness:
       - [x] Help docs: [link] (reviewed by Content team)
       - [x] Dev docs: [link] (reviewed by DX team)
       - [x] Guru card: [link] (Support team trained on [date])
       - [x] PSN Care Package: [link]
       - [x] Changelog: [draft link] (scheduled for launch)
       - [x] Merchant comms: [email link] (scheduled for day 2)

       Support training: Completed [date], 15 agents trained
       Escalation path documented: [runbook link]"
```

### 9. Rollback Plan (Specific, Not Generic)
Generic rollback plans fail in incidents. Be specific.

```
BAD:  "Rollback: Disable feature flag if issues"

GOOD: "Rollback plan:

       Triggers (any → immediate rollback):
       - Error rate > 1% (current baseline: 0.1%)
       - Latency p99 > 500ms (current baseline: 200ms)
       - 3+ merchant complaints within 1 hour
       - Any P1 incident filed

       Procedure:
       1. Disable flag [flag-name] via [system/URL]
       2. Notify #checkout-oncall
       3. Page on-call if after hours: [PagerDuty service]

       Rollback owner: [name]
       Estimated rollback time: <5 min
       Data rollback: Not needed (no schema changes)"
```

### 10. Incident Response Plan
```
Incident response:
- On-call: [team] rotation
- Primary contact: [name] (hours: [timezone])
- Escalation: [name] → [name] → [name]
- War room: #incident-checkout
- Runbook: [link]
```

---

## Review Checklist

Before submitting for Build → Release review:

**Core Requirements**
- [ ] Demo video included (2 min, shows actual product)
- [ ] Test instructions are clear and complete
- [ ] Success dashboard linked (not screenshots)
- [ ] Post-launch targets defined with timeline

**Operational Readiness**
- [ ] Logging, monitoring, alerting configured
- [ ] Runbook for on-call exists
- [ ] Load tested (at expected traffic levels)

**Rollback & Safety**
- [ ] Rollback plan has specific triggers (not just "if issues arise")
- [ ] Rollback procedure is documented step-by-step
- [ ] Rollback owner is named
- [ ] Rollback time is estimated

**GTM Readiness (Merchant-Facing)**
- [ ] Help docs written and reviewed
- [ ] Dev docs written (if applicable)
- [ ] Guru card for Support (if applicable)
- [ ] Support team trained
- [ ] Merchant communications scheduled

**Quality**
- [ ] All tests passing
- [ ] Code reviewed and merged to main
- [ ] Figma links included (user-facing features)
- [ ] Known issues documented and acceptable
- [ ] On-call team identified

---

## Common Rejection Reasons (OK1 Patterns)

1. **No test instructions** - Reviewers can't try it themselves
2. **Dashboard is a screenshot** - Need live link that won't go stale
3. **Rollback plan is generic** - "Disable flag if issues" isn't a plan
4. **Missing rollback triggers** - When exactly do you roll back?
5. **Operational gaps** - Missing alerting, logging, or runbook
6. **Too many known issues** - Not ready for users
7. **No success metrics** - How will we know if it worked?
8. **GTM not ready** - Help docs, Guru card, support training missing
9. **Tests not passing** - Build is not green
10. **Links not accessible** - Test store, staging, or docs require permissions

---

## The "Hell Yes" Standard

The purpose of this review is to prevent **unshipping** (having to roll back).

Reviewers ask:
- If something goes wrong at 2am, can on-call handle it?
- Will merchants have the support they need?
- Is the rollback plan actually executable under pressure?
