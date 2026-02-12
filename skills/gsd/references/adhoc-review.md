# Ad-Hoc Reviews

Ad-hoc reviews happen **within a phase** for alignment and feedback, without transitioning to the next phase.

---

## When to Use Ad-Hoc Reviews

### 1. Long-Running Projects
Projects longer than 6 weeks should have periodic check-ins.

```
Guidance:
- Every 6 weeks, open an ad-hoc review
- Share progress, blockers, and updated timeline
- Get feedback before you're too deep to course-correct
```

### 2. Significant Decisions
When you need alignment on a major decision before proceeding.

```
Examples:
- Architecture change that affects other teams
- Scope change (adding or removing features)
- Timeline change (significant delay)
- Resource change (team composition shift)
```

### 3. Risk Escalation
When a blocker needs visibility and help.

```
Examples:
- Dependency blocked for >2 weeks
- Technical risk discovered that changes the approach
- Resource conflict that needs resolution
- External factor (legal, compliance, security) requiring attention
```

### 4. Stakeholder Alignment
When you need to confirm direction with reviewers.

```
Examples:
- Multiple valid approaches, need to pick one
- Trade-off decision (speed vs. quality, scope vs. timeline)
- Uncertainty about success criteria
```

---

## Ad-Hoc vs. Phase Transition Reviews

| Aspect | Ad-Hoc | Phase Transition |
|--------|--------|------------------|
| **Purpose** | Alignment, feedback | Approval to advance |
| **Phase change** | No | Yes |
| **When** | Anytime within a phase | At phase boundary |
| **Frequency** | As needed | Once per transition |
| **Required elements** | Flexible | Structured checklist |

---

## What to Include

Ad-hoc reviews are lighter than phase transitions. Include what's relevant:

### Standard Elements
```
1. Context
   - Why are you opening this review?
   - What do you need from reviewers?

2. Current Status
   - Progress since last review/update
   - Key accomplishments
   - Blockers or concerns

3. The Ask
   - What decision or feedback do you need?
   - What are the options (if applicable)?
   - Your recommendation (if you have one)
```

### Example: Decision Review
```
## Ad-Hoc Review: Architecture Decision

**Context**: We need to choose between two caching approaches.
The prototype phase uncovered performance issues that require a decision
before we can proceed.

**Options**:
1. Redis cluster (faster, more complex, $X/month)
2. In-memory caching (simpler, limited scale, $0)

**Trade-offs**:
| Factor | Redis | In-Memory |
|--------|-------|-----------|
| Latency | 5ms | 1ms |
| Scale | Unlimited | Single node |
| Cost | $500/mo | $0 |
| Complexity | High | Low |

**Recommendation**: Redis. We expect to exceed single-node capacity
within 6 months based on growth projections.

**Ask**: Please review and approve, or suggest alternative approach.
```

### Example: Progress Check-In
```
## Ad-Hoc Review: 6-Week Check-In

**Context**: Project is in Week 6 of 12. Sharing progress and updated plan.

**Progress**:
- Completed: Auth flow, API integration, basic UI
- In progress: Performance optimization, edge cases
- Blocked: Design review (scheduled for Friday)

**Timeline Update**:
- Original end date: March 15
- Current projection: March 22 (+1 week)
- Reason: Discovered additional edge cases during testing

**Risks**:
- Design availability (mitigation: front-loaded remaining design work)

**Ask**: Acknowledge updated timeline. Flag any concerns.
```

### Example: Risk Escalation
```
## Ad-Hoc Review: Dependency Blocker

**Context**: We've been blocked on Platform API changes for 3 weeks.
Need help escalating.

**Situation**:
- Requested API change on Feb 1 (PR #1234)
- Platform team acknowledged but hasn't prioritized
- Our release is blocked until this merges

**Impact**:
- 3 weeks of delay so far
- Risk of missing Q1 deadline

**Options Considered**:
1. Continue waiting (not viable)
2. Build workaround (2 weeks, creates tech debt)
3. Escalate to Platform leadership

**Ask**: Can [reviewer] help escalate with Platform team?
We need the PR merged by Feb 20 to stay on track.
```

---

## Best Practices

### DO
- Be clear about what you need from reviewers
- Keep it focused (one topic per review when possible)
- Include your recommendation
- Make the ask specific and actionable

### DON'T
- Use ad-hoc reviews to avoid phase transitions
- Open reviews without a clear purpose
- Wait too long when you're blocked
- Include unnecessary detail

---

## Review Checklist

Before opening an ad-hoc review:

- [ ] Clear reason for the review (why now?)
- [ ] Specific ask (what do you need?)
- [ ] Relevant context (enough to understand, not more)
- [ ] Your recommendation (if applicable)
- [ ] Appropriate reviewers selected

---

## Approval Levels in Ad-Hoc Reviews

Ad-hoc reviews use the same approval structure:
- **ok_inform**: FYI only, no approval needed
- **ok1**: First-level approval
- **ok2**: Senior approval (for significant decisions)

Choose reviewers based on what you need:
- Information sharing → ok_inform only
- Team-level decision → ok1
- Cross-team or significant impact → ok1 + ok2
