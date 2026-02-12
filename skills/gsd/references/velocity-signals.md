# Velocity & Progress Signals

This reference helps evaluate whether a project is actually moving and identify early warning signs of trouble.

---

## The Core Questions

- Is the team actually making progress?
- Is velocity improving, stable, or declining?
- What's blocking progress?
- Will they hit the milestone?

---

## Key Velocity Metrics

### PR Cycle Time
Time from PR creation to merge.

| Cycle Time | Assessment |
|------------|------------|
| 1-2 days | Healthy, team is moving |
| 3-5 days | Acceptable, watch for trends |
| 1-2 weeks | Concerning, review bottleneck likely |
| 2+ weeks | Critical, project is stuck |

### Iteration Velocity
Features/fixes delivered per time period.

| Trend | Assessment |
|-------|------------|
| Increasing | Team is ramping up, positive |
| Stable | Sustainable pace, healthy |
| Decreasing | Warning sign, investigate |
| Erratic | Inconsistent, needs attention |

### Blocker Resolution
How quickly issues get addressed.

| Resolution Time | Assessment |
|-----------------|------------|
| <24 hours | Excellent, team is responsive |
| 1-3 days | Good, blockers don't linger |
| 1 week | Concerning, blockers accumulating |
| 2+ weeks | Critical, project at risk |

---

## Early Warning Signals

These patterns often predict problems BEFORE they become crises:

### Communication Signals

| Signal | What It Means | Action |
|--------|---------------|--------|
| Updates become vague | Team losing clarity or hiding problems | Ask for specifics |
| Update frequency drops | Team overwhelmed or disengaged | Check in directly |
| Defensive tone appears | Team feeling pressured or criticized | Address root cause |
| Jargon increases | Communication breakdown | Request plain language |
| "Making progress" without specifics | No real progress | Ask for concrete evidence |

### Technical Signals

| Signal | What It Means | Action |
|--------|---------------|--------|
| Multiple approaches tried and abandoned | Architecture uncertainty | Need tech design review |
| Increasing "fix" commits | Technical debt accumulating | Plan cleanup time |
| PRs getting larger | Changes not being broken down | Encourage smaller PRs |
| Test coverage declining | Quality pressure | Protect quality time |
| Reverted commits | Instability | Investigate root cause |

### Team Signals

| Signal | What It Means | Action |
|--------|---------------|--------|
| Key contributors less active | Burnout, reassignment, or blocked | Check in personally |
| New people not ramping | Onboarding problems | Improve documentation |
| Meetings increasing | Coordination overhead growing | Simplify structure |
| Context switching visible | Too many concurrent priorities | Focus the team |
| Overtime mentions | Unsustainable pace | Adjust scope or timeline |

---

## Bottleneck Patterns

### Code Review Bottleneck
**Symptom**: PRs waiting days for review
**Causes**:
- Too few reviewers
- Reviewers overloaded
- Large, complex PRs
- Unclear review criteria

**Solutions**:
- Add more reviewers
- Set review SLAs
- Break PRs smaller
- Pair programming

### External Dependency Bottleneck
**Symptom**: "Waiting on X team" patterns
**Causes**:
- Unacknowledged dependencies
- Other team's priorities differ
- No escalation path
- Poor communication

**Solutions**:
- Surface dependencies early
- Get commitments in writing
- Establish escalation path
- Over-communicate

### Decision Bottleneck
**Symptom**: Work paused pending decisions
**Causes**:
- Unclear decision makers
- Risk aversion
- Missing information
- Conflicting stakeholders

**Solutions**:
- Clarify RACI
- Time-box decisions
- Provide recommendations
- Escalate when stuck

### Context Switching Bottleneck
**Symptom**: Work spread across too many things
**Causes**:
- Multiple priorities
- Interrupt-driven culture
- Poor focus
- Understaffing

**Solutions**:
- Reduce WIP
- Protect focus time
- Batch similar work
- Say no to new requests

---

## Progress Evidence

### Strong Evidence of Progress
- PRs merged with clear descriptions
- Tests added and passing
- Documentation updated
- Metrics improving
- Demos of working software
- User feedback incorporated

### Weak Evidence of Progress
- "Working on it" without specifics
- Meetings held
- Documents written (but no code)
- "Almost done" for weeks
- Activity without outcomes

---

## Milestone Likelihood Assessment

| Score | Likelihood | Evidence |
|-------|------------|----------|
| 0.8-1.0 | Very Likely | On track with buffer, dependencies resolved, team confident |
| 0.6-0.8 | Likely | Progressing, manageable risks, some buffer |
| 0.4-0.6 | Uncertain | Behind plan, significant blockers but solvable |
| 0.2-0.4 | Unlikely | Well behind, major blockers, would need heroics |
| 0.0-0.2 | Very Unlikely | Critical blockers, stalled, needs intervention |

### Likelihood Factors

**Increases Likelihood:**
- Ahead of schedule
- Dependencies cleared
- Team has done similar work
- Buffer in timeline
- Clear scope

**Decreases Likelihood:**
- Behind schedule
- Unresolved dependencies
- Novel technology/approach
- No buffer
- Scope creeping

---

## Velocity Recovery Strategies

When velocity is declining:

### Short-term (This Week)
1. Clear immediate blockers
2. Cancel non-essential meetings
3. Protect focus time
4. Get help on stuck items

### Medium-term (This Month)
1. Address systemic blockers
2. Reduce WIP
3. Improve tooling/automation
4. Add capacity if available

### Long-term (This Quarter)
1. Fix process issues
2. Invest in developer experience
3. Build team expertise
4. Pay down tech debt

---

## Questions to Ask

When evaluating velocity:

1. **How many PRs merged this week vs. last week?**
   - Looking for trend, not just absolute number

2. **What's the oldest open PR?**
   - Old PRs signal bottlenecks

3. **What was the biggest blocker?**
   - Understanding blockers reveals systemic issues

4. **Is the team context-switching?**
   - Multiple projects = reduced velocity

5. **What would help the team move faster?**
   - Often they know but haven't been asked

---

## Red Flag Summary

Immediate attention needed if:

- [ ] PR cycle time > 1 week
- [ ] Updates vague for 2+ weeks
- [ ] Key contributor inactive
- [ ] Same blocker mentioned 3+ times
- [ ] Velocity declining for 3+ weeks
- [ ] "Almost done" for 2+ weeks
- [ ] No shipped code in 2+ weeks
