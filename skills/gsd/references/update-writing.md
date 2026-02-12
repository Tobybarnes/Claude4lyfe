# Writing Good Weekly Updates

Weekly updates are your project's heartbeat. Good updates build trust; vague updates create doubt.

---

## The Core Structure

Every update should answer three questions:

### 1. What progress did we make?
Concrete accomplishments, not activities.

### 2. What are we concerned about?
Blockers, risks, or things that need attention.

### 3. What's next?
Specific plans for the coming week.

---

## Format Template

```
## Week of [Date]

### Progress
- [Concrete accomplishment with evidence]
- [Concrete accomplishment with evidence]
- [Concrete accomplishment with evidence]

### Concerns
- [Blocker/risk with owner and mitigation]
- [Blocker/risk with owner and mitigation]

### Next Week
- [Specific goal]
- [Specific goal]
```

---

## Good vs. Bad Updates

### Progress Section

```
BAD:  "Made good progress on the implementation."

GOOD: "Merged auth flow implementation (PR #1234).
       Started API integration (PR #1235, in review).
       Fixed 3 bugs found in QA testing."
```

**Why it matters**: "Good progress" means nothing. PRs and specifics show real work.

```
BAD:  "Continued working on the feature."

GOOD: "Completed 4 of 7 milestones:
       - [x] Database schema
       - [x] API endpoints
       - [x] Basic UI
       - [x] Authentication
       - [ ] Error handling (in progress)
       - [ ] Tests
       - [ ] Documentation"
```

**Why it matters**: Progress against milestones shows trajectory.

### Concerns Section

```
BAD:  "Some concerns about timeline."

GOOD: "Timeline risk: Design review delayed by 1 week.
       Impact: May push release by 3 days.
       Mitigation: Parallelizing other work to absorb delay.
       Owner: [name] following up with Design team."
```

**Why it matters**: Vague concerns can't be addressed. Specific concerns get help.

```
BAD:  "Blocked on another team."

GOOD: "Blocked: Waiting on Platform API PR #5678 (submitted Oct 1).
       Impact: Cannot proceed with integration until merged.
       Action: Escalated to [manager] on Oct 5.
       Fallback: If not merged by Oct 10, will implement workaround."
```

**Why it matters**: Blockers need owners, dates, and escalation paths.

### Next Week Section

```
BAD:  "Continue implementation work."

GOOD: "Next week:
       - Complete error handling (PR by Wednesday)
       - Start integration tests
       - Design review on Thursday
       - Target: 5 of 7 milestones complete"
```

**Why it matters**: Specific goals can be tracked. Vague plans can't.

---

## What "Visible Progress" Means

Reviewers and stakeholders look for evidence:

### Strong Evidence
- Merged PRs with links
- Demo videos or screenshots
- Metrics showing improvement
- Completed milestones
- Resolved blockers

### Weak Evidence
- "Working on X"
- "Making progress"
- "In discussions with team"
- "Continuing implementation"

### No Evidence
- No update at all
- Copy-paste of previous week
- Status: "On Track" with no details

---

## Update Frequency

| Project Phase | Frequency | Detail Level |
|---------------|-----------|--------------|
| Proposal | As needed | Light |
| Prototype | Weekly | Medium |
| Build | Weekly | High |
| Release | 2x/week | High |
| Done | Final summary | Complete |

Long-running projects should update weekly regardless of phase.

---

## Common Mistakes

### 1. The Copy-Paste Update
Same text every week with minor changes. Shows nothing is happening.

**Fix**: If you're making progress, the update should be different each week.

### 2. The Novel
2000 words of detail nobody will read.

**Fix**: Keep it scannable. Use bullet points. Link to details.

### 3. The All-Clear
"Everything is fine, no concerns."

**Fix**: Every project has risks. If you don't mention any, you're not looking.

### 4. The Activity Report
"Had 3 meetings. Reviewed 5 PRs. Sent 10 emails."

**Fix**: Activities aren't progress. What did those activities accomplish?

### 5. The Surprise
"We're now 4 weeks behind schedule."

**Fix**: Surface risks early. Weekly updates should prevent surprises.

---

## Update Checklist

Before posting your weekly update:

- [ ] Progress has specific evidence (PRs, milestones, metrics)
- [ ] Concerns have owners and mitigation plans
- [ ] Next week has specific, trackable goals
- [ ] No copy-paste from previous week
- [ ] Scannable in 60 seconds
- [ ] Links to PRs, dashboards, designs where relevant
- [ ] Status accurately reflects reality

---

## When You're Blocked

Don't hide it. Surface it clearly.

```
## Status: BLOCKED

### Blocker
Platform API PR #5678 (submitted Oct 1, now Week 3)
- Owner: Platform team
- Impact: Cannot proceed with integration
- Escalated: Yes, to [manager] on Oct 10

### What We've Done While Blocked
- Completed all non-integration work
- Documented integration plan
- Prepared test suite

### What We Need
Help getting PR prioritized. Release at risk if not merged by Oct 15.
```

Being blocked isn't failure. Hiding blockers is.

---

## Async Best Practices

Updates should work for people in different timezones:

1. **Post in Vault** - Not just Slack (Slack messages get buried)
2. **Include links** - Don't make people search
3. **Be self-contained** - Reader shouldn't need context
4. **Tag stakeholders** - So they see it
5. **Consistent timing** - Same day each week (Fridays work well)
