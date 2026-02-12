# Champion Responsibilities

This reference documents what's expected of project champions and how to write effective updates.

---

## What is a Champion?

The champion is the **accountable owner** of a project. They ensure the project moves forward, communicates status, and delivers outcomes.

---

## Core Responsibilities

### 1. Single Project Focus
- Champion **only one project at a time**
- Full attention on making this project successful
- If championing multiple projects, something is wrong

### 2. Weekly Vault Updates
- Post updates **at least every 10 days**
- Projects without updates for 22+ days are marked "At Risk"
- Updates are for stakeholders, not just your team

### 3. Weekly Project Syncs
- Host regular syncs for contributors and stakeholders
- Keep meetings focused and action-oriented
- Document decisions and next steps

### 4. Goal Setting & Review
- Set weekly goals for the project
- Review performance against those goals
- Adjust approach based on results

### 5. Proactive Timeline Management
- Re-evaluate dates and timelines continuously
- Surface risks early, not when it's too late
- Propose scope/date tradeoffs before forced to

---

## Writing Effective Updates

### What to Include

| Section | What to Write |
|---------|---------------|
| **Timeline Impact** | Is the timeline affected? If so, why and by how much? |
| **Success Metrics Status** | How are metrics tracking against targets? |
| **Milestones Achieved** | What was completed since last update? |
| **Key Learnings** | What did we discover or learn? |
| **Current Risks** | What could derail us? What needs attention? |
| **Next Steps** | What's happening next week? |

### Update Structure Template

```
## Status: [On Track / At Risk / Blocked]

### Progress Since Last Update
- [Milestone or achievement]
- [Milestone or achievement]
- Key learning: [What we discovered]

### Metrics
- Primary metric: [Current] vs [Target] — [On track / Behind / Ahead]

### Risks & Blockers
- [Risk]: [Mitigation]
- [Blocker]: [Action to unblock]

### Next Week
- [ ] [Specific goal]
- [ ] [Specific goal]
```

### Good vs. Bad Updates

**Bad Update:**
```
Making progress on the checkout work. Team is busy.
Had some meetings. Things are going well.
```

**Good Update:**
```
## Status: On Track

### Progress Since Last Update
- Merged checkout redesign PR (#1234)
- Completed A/B test framework integration
- Key learning: Mobile Safari needs special handling for scroll

### Metrics
- Conversion: 54.2% vs 57% target — Behind, but expected to improve with full rollout

### Risks & Blockers
- Risk: Design team capacity in Dec. Mitigation: Front-loading design work this week.
- Blocker: None

### Next Week
- [ ] Complete mobile Safari fixes
- [ ] Start 10% rollout Monday
- [ ] Set up conversion monitoring dashboard
```

---

## Update Don'ts

### Don't List PRs
```
BAD: "Merged PR #1234, #1235, #1236, #1237, reviewed PR #1238..."
```
This is low-value to stakeholders. They don't care about PR numbers.

### Don't Use Jargon
```
BAD: "Updated the CQRS pattern in the BFF layer for better DX"
GOOD: "Improved the API architecture to make development faster"
```
Write for people outside your domain.

### Don't Wait for Complete Information
```
BAD: [No update because waiting to have "everything ready"]
GOOD: [Partial update with what you know, noting what's pending]
```
Some update is better than no update.

### Don't Be Vague About Risks
```
BAD: "Some risks exist"
GOOD: "Risk: Security review has 2-week queue. Mitigation: Submitted early."
```
Specific risks with specific mitigations.

---

## When to Escalate

Escalate when:
- Timeline will slip significantly (>1 week)
- A blocker can't be resolved at your level
- Scope changes require re-review
- Success is at risk due to factors outside your control
- You need executive support to unblock dependencies

**How to escalate:**
1. State the problem clearly
2. Explain what you've tried
3. Propose options
4. State what you need

---

## Champion Selection

The champion should be from the discipline that can address the **greatest risk**:

| Risk Type | Champion Discipline |
|-----------|---------------------|
| Technical complexity | Engineering |
| User experience | Design |
| Business/market | Product |
| Data/analytics | Data Science |

---

## Handoff When Championing Ends

Before handing off or closing:
- Document current state
- List pending decisions
- Identify remaining work with owners
- Ensure knowledge transfer is complete
- Update Vault with final status

---

## Champion Checklist

Weekly:
- [ ] Posted Vault update (within 10 days)
- [ ] Hosted project sync
- [ ] Reviewed progress against goals
- [ ] Updated timeline if needed
- [ ] Surfaced risks to stakeholders

At phase transitions:
- [ ] Prepared review materials
- [ ] Updated success metrics
- [ ] Documented decisions made
- [ ] Confirmed team alignment

At project close:
- [ ] Final metrics captured
- [ ] Learnings documented
- [ ] Tech debt tracked
- [ ] Handoff complete
