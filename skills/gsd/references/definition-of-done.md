# Definition of Done by Phase

A checklist of items that must be completed before a project can transition to the next phase. Use this to validate readiness and drive team alignment.

---

## Why Definition of Done Matters

- **Drives alignment** on what "done" actually means
- **Brings clarity** on goals for each phase
- **Validates completeness** before moving forward
- **Prevents rework** from incomplete transitions

---

## Proposal → Prototype

Before starting prototype:

### Vision & Scope
- [ ] Clear vision of what prototype will explore
- [ ] Problem statement is specific and quantified
- [ ] Success criteria are outcome-based, not activity-based
- [ ] Scope is tightly defined (achievable in <6 weeks)

### Documentation
- [ ] TL;DR is understandable by someone outside your domain
- [ ] Key challenges and decisions to resolve are documented
- [ ] Non-goals are explicitly stated

### Team & Resources
- [ ] Team is identified and available
- [ ] Required skills are present or plan to acquire them
- [ ] No blocking dependencies on other teams

### Review Readiness
- [ ] Proposal reviewed by multifecta (PM, UX, Eng, Data)
- [ ] All reviewer questions addressed
- [ ] OK1 and OK2 approved

---

## Prototype → Build

Before starting build:

### Learnings & Decisions
- [ ] Multiple approaches explored and documented
- [ ] Key decisions made with rationale recorded
- [ ] All areas of uncertainty have decisions documented
- [ ] Prototype learnings summarized (what worked, what didn't)

### Technical Readiness
- [ ] Tech design approved by relevant technical reviewers
- [ ] Architecture diagram complete
- [ ] Integration points with other systems defined
- [ ] Data model changes documented (if any)
- [ ] Performance considerations addressed

### Design Readiness
- [ ] UX designs complete and annotated in Figma
- [ ] Design review completed
- [ ] Accessibility requirements identified

### Estimates & Planning
- [ ] Estimates updated based on prototype learnings
- [ ] Confidence level stated (and improved from proposal)
- [ ] Milestones defined with dates
- [ ] Dependencies identified with owners and timelines

### Code Quality
- [ ] Prototype code is NOT being carried forward
- [ ] Clean slate for production implementation

### Review Readiness
- [ ] Video walkthrough included (≤3 min)
- [ ] All prototype questions resolved
- [ ] Reviewers can test/see the prototype

---

## Build → Release

Before starting release:

### Code Complete
- [ ] All planned functionality implemented
- [ ] Code reviewed and merged to main
- [ ] All tests passing (unit, integration, e2e)
- [ ] No critical bugs open

### Operational Readiness
- [ ] Logging implemented with correlation IDs
- [ ] Monitoring dashboard created
- [ ] Alerting configured (PagerDuty or equivalent)
- [ ] Runbook for on-call documented
- [ ] Load tested at expected traffic levels
- [ ] SLOs defined to prevent performance regression

### Rollout Readiness
- [ ] Feature flags configured
- [ ] Rollback plan documented with specific triggers
- [ ] Rollback procedure tested
- [ ] Rollback owner identified
- [ ] Gradual rollout plan defined (%, timeline)

### GTM Readiness (Merchant-Facing)
- [ ] Help docs written and reviewed
- [ ] Dev docs written (if applicable)
- [ ] Guru card created for Support
- [ ] Support team trained
- [ ] Merchant communications drafted
- [ ] PSN Care Package prepared

### Design & UX
- [ ] Final designs match implementation
- [ ] Accessibility review passed (WCAG 2.1 AA)
- [ ] Design sign-off received

### Metrics & Tracking
- [ ] Product metrics implemented
- [ ] Success dashboard live (not screenshots)
- [ ] Baseline metrics captured
- [ ] A/B test configured (if applicable)

### Review Readiness
- [ ] Demo video showing actual product (≤3 min)
- [ ] Test instructions clear and complete
- [ ] Reviewers can access test environment

---

## Release → Done

Before marking done:

### Outcomes Measured
- [ ] Primary metrics measured against baseline
- [ ] Success criteria evaluated (hit/miss/near)
- [ ] Analysis explains why targets were hit or missed
- [ ] Dashboard shows current state

### Learnings Captured
- [ ] Technical learnings documented
- [ ] Process learnings documented
- [ ] "What we'd do differently" captured
- [ ] Learnings shared with relevant teams

### Cleanup Complete
- [ ] Old/unused code removed
- [ ] Feature flags cleaned up (100% flags removed)
- [ ] Test fixtures added for future testing
- [ ] Bugs fixed or deliberately deferred with tickets

### Handoff Complete
- [ ] Ongoing maintenance ownership clear
- [ ] On-call team trained
- [ ] Documentation up to date
- [ ] Follow-up work has tickets with owners

### Debt Tracked
- [ ] Tech debt created has tickets
- [ ] Each debt item has an owner
- [ ] Each debt item has estimated timeline

### Quality Validated
- [ ] No P1/P2 bugs open
- [ ] Bug trend is stable or decreasing
- [ ] No critical incidents since launch

### Review Readiness
- [ ] Final demo video showing live product
- [ ] Before/after metrics comparison
- [ ] Retrospective completed

---

## Quick Reference by Phase

| Phase | Key Question | Must Have |
|-------|--------------|-----------|
| Prototype | Are we confident enough to build? | Learnings, decisions, tech design |
| Build | Is this ready for real users? | Tests, monitoring, rollback plan |
| Release | Did we achieve our goals? | Metrics, analysis, learnings |
| Done | Can we move on? | Cleanup, handoff, debt tracked |

---

## Common Shortcuts That Cause Problems

### Prototype → Build Shortcuts
- ❌ Carrying prototype code to production
- ❌ Skipping tech design review
- ❌ "We'll figure out the edge cases in build"
- ❌ Not updating estimates based on learnings

### Build → Release Shortcuts
- ❌ "We'll add monitoring after launch"
- ❌ Generic rollback plan ("disable flag if issues")
- ❌ No load testing ("it should be fine")
- ❌ Help docs "coming soon"

### Release → Done Shortcuts
- ❌ "We shipped, so we're done"
- ❌ Leaving feature flags at 100% forever
- ❌ Not measuring actual outcomes
- ❌ Tech debt without tickets

---

## Phase Transition Review Checklist

Use this when reviewing transition requests:

### For Prototype → Build Reviews
1. Were multiple approaches actually explored?
2. Is the tech design signed off by senior engineers?
3. Are estimates updated and realistic?
4. Is prototype code being thrown away?

### For Build → Release Reviews
1. Can I test this myself with the instructions provided?
2. Is the rollback plan specific enough to execute at 2am?
3. Is Support ready to handle merchant questions?
4. Are metrics actually being tracked (not "will be added")?

### For Release → Done Reviews
1. Do we have before/after data?
2. Did we hit our success criteria? If not, why?
3. Is there a clear owner for ongoing maintenance?
4. Is all tech debt tracked with tickets?

---

## The "Done" Standard

A project is truly Done when:

1. **Outcomes measured** — You know if you succeeded
2. **Learnings captured** — Future teams benefit from your experience
3. **Debt tracked** — Nothing falls through the cracks
4. **Bugs under control** — Quality is stable
5. **Handoff complete** — Someone else can maintain this

**Done doesn't mean perfect.** It means you achieved your intended outcomes and documented everything needed for ongoing success.
