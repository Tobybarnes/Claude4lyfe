# Common GSD Pitfalls

These 20 patterns were identified across 13+ projects and validated against OK1/OK2 review feedback from Vault. They are **universal** - reviewers flag them regardless of domain.

---

## 1. Communication Silos

**What it looks like:**
- "See the Google Doc for details" with no summary in Vault
- No Slack channel linked, or channel uses non-standard naming
- Stakeholders unaware of project status despite being listed as reviewers
- Updates happen in private DMs, never surfaced publicly

**Why reviewers flag it:**
Reviewers can't assess what they can't see. External docs create friction, go stale, and exclude people. If key information isn't in Vault, the "official record" diverges from reality.

**How to fix it:**
```
BAD:  "Full requirements in this Google Doc: [link]"

GOOD: "We're building X to solve Y. Key requirements:
       - Requirement 1
       - Requirement 2
       Full details: [link]"
```
Always include a summary in Vault. Link the Slack channel. Post updates where reviewers can find them.

---

## 2. Activity-Based Success Criteria

**What it looks like:**
- "Ship the new API"
- "Complete the migration"
- "Launch by Q2"
- "Audit all documentation"

**Why reviewers flag it:**
These describe what you'll *do*, not what *success* looks like. Shipping an API that nobody uses is not success. Reviewers need to know: how will we measure if this worked?

**How to fix it:**
```
BAD:  "Ship the checkout redesign"

GOOD: "Checkout conversion rate improves by 2% within 30 days of launch"
      "Baseline: 68% conversion. Target: 70%"
```
See `success-metrics-guide.md` for the full framework.

---

## 3. No Visible Progress

**What it looks like:**
- Status says "On Track" but 0 PRs in the last month
- Weekly updates are copy-paste of previous week
- "Making good progress" with no specifics
- No linked commits, demos, or artifacts

**Why reviewers flag it:**
Claims without evidence create trust deficits. If you say you're on track, show the work. Reviewers will check PR activity, Slack, and commits.

**How to fix it:**
```
BAD:  "On track. Making progress on the implementation."

GOOD: "On track. This week:
       - Merged PR #1234 (auth flow)
       - Merged PR #1235 (error handling)
       - Blocked on: Security review (ETA: Friday)

       Next week: Complete integration tests"
```
Link to PRs. Show what shipped. Be specific about blockers.

---

## 4. Dependency Bottlenecks Not Surfaced

**What it looks like:**
- Timeline doesn't account for review cycles or external team dependencies
- "Waiting on Platform team" mentioned casually, not as a blocker
- Approval processes (security, legal, compliance) discovered late
- No escalation path when blocked

**Why reviewers flag it:**
Dependencies that aren't explicitly managed become surprises. If you need Security review and they have a 2-week queue, that's not a risk - it's a schedule fact.

**How to fix it:**
```
BAD:  "Will coordinate with Security team"

GOOD: "Dependencies:
       - Security review (requested 11/1, estimated approval 11/15)
       - Platform team API changes (PR #5678, needs merge by 11/10)

       Escalation: If Security review delayed, [owner] will escalate to [person]"
```
Name the dependency. Give dates. Have an escalation plan.

---

## 5. Knowledge Concentration Risk

**What it looks like:**
- All PRs from one person
- Single point of contact for all questions
- No documentation of decisions or architecture
- "Ask [person]" is the only answer to questions

**Why reviewers flag it:**
If that person gets sick, takes vacation, or leaves, the project stops. This is a sustainability risk that should be addressed before it becomes a crisis.

**How to fix it:**
```
BAD:  "Marcus is handling the implementation"

GOOD: "Marcus is leading implementation, with Sam as backup.
       Key decisions documented in: [tech design link]
       Onboarding doc for new contributors: [link]"
```
Have a backup. Document decisions. Make the project survivable without any single person.

---

## 6. Decision Debt

**What it looks like:**
- "TBD" in key sections
- "We'll figure out error handling later"
- Open questions from prototype phase still unanswered in build
- Architecture diagrams with "?" annotations

**Why reviewers flag it:**
Unresolved decisions compound. Each "TBD" is a future surprise that could derail the timeline. Reviewers want to see decisions made, not deferred.

**How to fix it:**
```
BAD:  "Error handling approach: TBD"

GOOD: "Error handling: Retry with exponential backoff (3 attempts, max 30s).
       Decision made: 10/15, see ADR-123
       Alternative considered: Circuit breaker (rejected due to complexity)"
```
Make decisions. Document the rationale. Link to ADRs or decision logs.

---

## 7. Platform vs. Custom Solution

**What it looks like:**
- Building a reconciliation system for one merchant
- Creating a custom dashboard when existing tools could work
- "This is specific to our use case" without exploring platform options
- Solving a problem that affects 100 merchants by building for 1

**Why reviewers flag it:**
Custom solutions don't scale. If the underlying problem affects many users, the platform should solve it. Reviewers ask: "Why isn't this a platform capability?"

**How to fix it:**
```
BAD:  "Building custom webhook reconciliation for Merchant X"

GOOD: "Problem: Webhook delivery is 99.9% reliable, but Merchant X needs 100%.
       Options considered:
       1. Platform-level delivery guarantees (ideal, but 6-month roadmap)
       2. Custom reconciliation for this merchant (shipping now)

       Recommendation: Ship custom solution now, contribute learnings to platform team
       for eventual productization"
```
Show you considered platform options. Explain why custom is the right choice *now*.

---

## 8. Missing Operational Foundations

**What it looks like:**
- Feature complete but no alerting
- "We'll add logging later"
- No retry logic for external calls
- No runbook for on-call
- "Happy path works" but error handling is TBD

**Why reviewers flag it:**
Features without operational foundations create incidents. Production readiness isn't optional - it's required for release.

**How to fix it:**
```
BAD:  "Implementation complete, ready for release"

GOOD: "Implementation complete. Operational readiness:
       - [x] Alerting: PagerDuty alerts for error rate >1%
       - [x] Logging: Structured logs with correlation IDs
       - [x] Retry logic: 3 attempts with exponential backoff
       - [x] Runbook: [link to on-call doc]
       - [x] Dashboard: [link to Grafana]"
```
Operational readiness is a checklist, not a hope.

---

## 9. Timeline Doesn't Match Velocity

**What it looks like:**
- "4 weeks remaining" but 1 PR merged in the last month
- End date unchanged despite blockers
- Scope creep without timeline adjustment
- "We'll catch up" without a plan

**Why reviewers flag it:**
Math doesn't lie. If you've merged 2 PRs in 4 weeks and need 10 more, claiming "on track" isn't credible. Reviewers will do the velocity check.

**How to fix it:**
```
BAD:  "End date: Dec 15 (on track)"
       [1 PR merged in last 30 days, 8 PRs remaining]

GOOD: "End date: Dec 15 (at risk)
       Current velocity: 1 PR/week
       Required velocity: 2 PRs/week

       Mitigation: Adding second contributor (Sam) starting Monday.
       If velocity doesn't improve by Dec 1, will propose scope reduction."
```
Be honest about velocity. Have a mitigation plan. Propose scope or date adjustments early.

---

## 10. No Learning Transfer

**What it looks like:**
- Same mistakes from previous project repeated
- "We learned a lot" but no documentation
- No retrospective or post-mortem
- Next team starting from scratch on similar problem

**Why reviewers flag it:**
Institutional knowledge that isn't captured is lost. If you learned something, write it down. If a previous project solved a similar problem, reference it.

**How to fix it:**
```
BAD:  "Project complete. Learned a lot about webhook reliability."

GOOD: "Project complete. Key learnings documented:
       - Tech decisions: [ADR link]
       - What worked: [retro link]
       - What we'd do differently: [retro link]

       Recommendation for future teams: Start with delivery guarantees, not reconciliation"
```
Document learnings. Link to retros. Make the next team's life easier.

---

## 11. Review Doesn't Stand Alone

**What it looks like:**
- "We aligned on Option 2" (reviewer doesn't know what Option 2 is)
- "See Figma for designs" with no summary of what the designs show
- Key context only accessible by clicking through multiple links
- "As discussed in the meeting..." with no meeting notes linked

**Why reviewers flag it:**
Reviewers scan many documents. If understanding yours requires clicking 5 links and reading 3 Google Docs, they'll miss context or deprioritize your review.

**How to fix it:**
```
BAD:  "We aligned with UX on the approach (see Figma)"

GOOD: "We aligned with UX on a single-page checkout flow:
       - All fields visible on one scrollable page
       - Progress indicator at top
       - Mobile-first responsive design
       Full designs: [Figma link]"
```
Summarize key decisions inline. Links are for deep-dives, not essential context.

---

## 12. Duplicate Work / Prior Art Not Researched

**What it looks like:**
- Building something similar to an existing (or failed) project
- No reference to previous attempts at solving this problem
- "We're the first to tackle this" (you're probably not)
- Ignoring lessons from related work in other teams

**Why reviewers flag it:**
Shopify has 10+ years of projects. Someone probably tried something similar. Reviewers will check Vault for similar projects. Not referencing prior art signals lack of research.

**How to fix it:**
```
BAD:  "We're building a new webhook reliability system"

GOOD: "We're building a new webhook reliability system.
       Related prior work:
       - Project X (2022): Attempted reconciliation approach, abandoned due to scale issues
       - Project Y (2023): Platform-level retries, handles 90% of cases

       Our approach builds on Y's foundation and addresses the remaining 10%"
```
Search Vault for similar projects. Reference them. Explain how yours differs.

---

## 13. Wrong Project Sizing

**What it looks like:**
- Project is massive ("rebuild the entire checkout") with a single proposal
- OR project is too granular (separate proposals for closely coupled features)
- Reviewers asked to "give a blank check" for large scope
- Related work split into separate proposals that couldn't logically be approved independently

**Why reviewers flag it:**
Too big = can't evaluate the risk. Too granular = overhead exceeds value. Right-sized projects have clear scope that can be assessed holistically.

**How to fix it:**
```
BAD:  "Proposal: Rebuild checkout (12-month project)"

GOOD: "Proposal: Checkout Phase 1 - One-page mobile flow (8 weeks)

       This is part of a larger checkout modernization effort.
       Phase 1 is independently valuable: improves mobile conversion.
       Future phases: [linked roadmap]"
```
Break large efforts into phases with independent value. Combine tightly coupled work.

---

## 14. Premature Proposals

**What it looks like:**
- Proposal submitted but team can't start for 3 months
- Resources not identified or committed
- "We'll figure out staffing" in the team section
- Proposal reads like a backlog item, not active work

**Why reviewers flag it:**
Proposals are for work that can be resourced **immediately**. Vault isn't a backlog. If you can't start now, don't propose now.

**How to fix it:**
```
BAD:  "Team: TBD (will staff after Q1 planning)"

GOOD: "Team:
       - Lead: Alex (confirmed, starting Nov 1)
       - Engineer: Sam (confirmed, 80% allocation)
       - UX: Jordan (confirmed, 20% allocation through prototype)

       Ready to begin: Nov 1"
```
Only propose when you can start. Identify specific people, not roles.

---

## 15. Prototype Learnings Not Documented

**What it looks like:**
- Prototype → Build review says "ready to build" but not *what was learned*
- No mention of alternatives considered
- "We validated the approach" without explaining how
- Open questions from proposal still unanswered

**Why reviewers flag it:**
Prototype's purpose is learning, not building. If you can't articulate what you learned, you didn't prototype—you just started building early.

**How to fix it:**
```
BAD:  "Prototype complete. Ready for build phase."

GOOD: "Prototype learnings:
       - Approach A (client-side calculation): Abandoned - too slow on low-end devices
       - Approach B (server-side with caching): Validated - 50ms p99 latency
       - Unexpected finding: Need to handle currency edge cases (added to scope)

       Key questions answered:
       - Can we hit latency targets? Yes, with caching
       - Will merchants adopt? 8/10 beta merchants positive

       Remaining risks for build phase: [list]"
```
Document what you tried, what worked, what didn't, and why.

---

## 16. Vague Rollback/Contingency Plans

**What it looks like:**
- "We'll roll back if there are issues"
- No specific triggers defined
- No rollback procedure documented
- "Feature flag enabled" but no criteria for when to disable

**Why reviewers flag it:**
Generic rollback plans aren't plans—they're hopes. Incidents don't wait for you to figure out what "issues" means.

**How to fix it:**
```
BAD:  "Rollback plan: Disable feature flag if issues arise"

GOOD: "Rollback plan:
       Triggers (any of these → immediate rollback):
       - Error rate > 1% (baseline: 0.1%)
       - Latency p99 > 500ms (baseline: 200ms)
       - More than 3 merchant complaints in 1 hour

       Procedure:
       1. Disable feature flag [flag-name] in [system]
       2. Notify #checkout-oncall
       3. Page on-call if after hours

       Rollback owner: [person]
       Estimated rollback time: <5 minutes"
```
Define specific triggers. Document the procedure. Assign an owner.

---

## 17. Missing GTM and Support Readiness

**What it looks like:**
- Release review with no help docs
- Support team unaware of upcoming feature
- No Guru card for support agents
- Marketing communications not planned
- Merchants will discover feature without guidance

**Why reviewers flag it:**
Launching without support readiness creates incidents, confused merchants, and support ticket spikes. These aren't optional—they're release requirements.

**How to fix it:**
```
BAD:  "Release checklist:
       - [x] Code complete
       - [x] Tests passing
       - [ ] Docs (will do after launch)"

GOOD: "Release checklist:
       - [x] Code complete
       - [x] Tests passing
       - [x] Help docs: [link] (reviewed by Content team)
       - [x] Dev docs: [link] (reviewed by DX team)
       - [x] Guru card: [link] (Support team trained)
       - [x] PSN Care Package: [link]
       - [x] Merchant comms: [link] (scheduled for launch day)"
```
GTM readiness is part of "done," not an afterthought.

---

## 18. Stakeholder Alignment Assumed, Not Confirmed

**What it looks like:**
- "We've aligned with the Platform team" (but no evidence)
- Stakeholders listed but never actually consulted
- "UX approved" without a name or date
- Cross-functional dependencies discovered at review time

**Why reviewers flag it:**
Saying "aligned" isn't the same as being aligned. Reviewers will ask: "Did they actually agree? When? What did they say?"

**How to fix it:**
```
BAD:  "Stakeholder alignment: Complete"

GOOD: "Stakeholder alignment:
       - Platform team: Aligned (meeting 10/15, attendees: Alex, Sam)
         → Agreed to prioritize API changes for Nov release
       - Security: Aligned (async review, approved 10/18)
         → No concerns, proceed as designed
       - Support: Pending (meeting scheduled 10/22)
         → Need to confirm training timeline"
```
Name the people. Date the conversations. Summarize what was agreed.

---

## 19. Scope Creep Acknowledged Without Boundaries

**What it looks like:**
- "Scope creep is a risk" in the risks section
- No explicit scope boundaries defined
- No decision framework for handling requests
- "We'll evaluate new requests as they come" (reactive, not proactive)

**Why reviewers flag it:**
Acknowledging scope creep isn't preventing it. Without explicit boundaries and a framework for saying "no," you'll creep.

**How to fix it:**
```
BAD:  "Risk: Scope creep
       Mitigation: We'll be careful about new requests"

GOOD: "Risk: Scope creep

       Explicit scope boundaries:
       - IN: Mobile checkout only
       - OUT: Desktop, tablet, native apps
       - OUT: New payment methods (separate project)

       Decision framework for new requests:
       - If < 2 days effort AND no dependencies: Team lead can approve
       - If > 2 days effort: Requires proposal amendment and re-review
       - If affects timeline: Escalate to PM for scope/date tradeoff"
```
Define what's out. Create a framework for evaluating requests.

---

## 20. Merchant Value Chain Unclear

**What it looks like:**
- Infrastructure project with no connection to merchant outcomes
- "This improves developer productivity" (but so what?)
- Technical metrics without business context
- "Internal tooling" without explaining who benefits downstream

**Why reviewers flag it:**
Ultimately, Shopify exists for merchants. If your project doesn't connect to merchant value (even indirectly), reviewers will question the priority.

**How to fix it:**
```
BAD:  "This project reduces CI build time from 20 minutes to 10 minutes"

GOOD: "This project reduces CI build time from 20 minutes to 10 minutes.

       Merchant value chain:
       - Faster CI → Faster deploys → Bug fixes reach merchants sooner
       - Current: Critical fixes take 2+ hours to deploy
       - After: Critical fixes deploy in <1 hour

       Estimated impact: 40% reduction in merchant-facing incident duration"
```
Connect technical improvements to merchant outcomes, even if indirect.
