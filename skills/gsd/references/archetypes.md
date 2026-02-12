# GSD Project Archetypes

Different project types have different review requirements. This reference explains how guidance varies by archetype.

---

## What Are Archetypes?

Archetypes are templates that define:
- Which phases a project goes through
- Which reviewers are relevant for each phase
- What criteria apply to the project type

Choosing the right archetype ensures you get relevant reviews and skip unnecessary stages.

---

## Available Archetypes

| Archetype | Phases | Primary Focus |
|-----------|--------|---------------|
| **rnd/project** | Prototype → Build → Release → Done | Standard product development |
| **rnd/experiment** | Prototype → Done | Rapid experimentation |
| **Infrastructure** | Varies (may skip Release) | Platform/systems work |
| **Data Infrastructure** | Streamlined | Data platform work |
| **Data Feature** | Streamlined | Data-focused features |
| **Migration** | All phases | Moving from old to new |

---

## Standard Project (rnd/project)

The default archetype for most R&D work.

### Phases
1. **Prototype** — Explore and de-risk
2. **Build** — Implement production solution
3. **Release** — Ship to users, measure impact
4. **Done** — Validate outcomes, document learnings

### Review Focus
- Full R&D review at each transition
- Merchant feedback emphasized
- Product principles analysis
- Success metrics required

### When to Use
- Building new features for merchants
- Significant product changes
- Work that ships to external users

---

## Experiment (rnd/experiment)

Simplified archetype for rapid experimentation.

### Phases
1. **Prototype** — Explore the idea
2. **Done** — Document learnings

**Skips Build and Release phases.**

### Review Focus
- Learning-focused, not shipping-focused
- Lower bar for production readiness
- Emphasis on what was learned

### When to Use
- Validating hypotheses quickly
- Exploratory research
- Work that may not ship
- Time-boxed investigations

### Key Difference
- Success = learning, not shipping
- Code may be thrown away entirely
- No external release required

---

## Infrastructure Projects

For platform, systems, and internal tooling work.

### Phases
- May skip Release phase (no external "release")
- Technical review emphasis
- Simplified GTM requirements

### Review Focus
- **Merchant feedback de-emphasized** — Reviewers focus on technical impact, not merchant feedback
- Technical feasibility emphasized
- Operational readiness critical
- Platform thinking valued

### Review Criteria Adjustments

| Standard Criteria | Infrastructure Adjustment |
|-------------------|---------------------------|
| Merchant impact | Technical impact on other teams |
| User adoption metrics | Internal adoption/usage |
| GTM readiness | Documentation and onboarding |
| Support training | On-call readiness |

### Success Metrics Guidance
Connect technical improvements to merchant value chain:

```
BAD:  "Reduce CI build time by 50%"

GOOD: "Reduce CI build time from 20min to 10min.
       → Faster deploys → Bug fixes reach merchants sooner
       → Estimated: 40% reduction in incident duration"
```

### When to Use
- Platform capabilities
- Developer tooling
- Internal systems
- CI/CD improvements
- Observability/monitoring

---

## Data Projects

### Data Infrastructure
For data platform and pipeline work.

**Streamlined reviews:**
- Removes unnecessary stages
- Restricts to data-relevant reviewers
- Skips merchant-facing requirements

### Data Feature
For data-focused product features.

**Review focus:**
- Data quality and accuracy
- Privacy and compliance
- Query performance
- Dashboard/reporting quality

### Success Metrics for Data Projects

| Metric Type | Examples |
|-------------|----------|
| Data Quality | Accuracy %, freshness, completeness |
| Performance | Query latency, pipeline runtime |
| Adoption | # teams using, # queries/day |
| Impact | Decisions enabled, time saved |

---

## Migration Projects

For moving from old systems to new.

### Phases
All standard phases, with emphasis on:
- Rollback capabilities
- Gradual migration path
- Backward compatibility
- Data integrity validation

### Specific Requirements

**Prototype Phase:**
- Migration strategy documented
- Risk assessment for data loss
- Rollback approach validated

**Build Phase:**
- Shadow mode testing
- Data validation framework
- Cutover plan detailed

**Release Phase:**
- Gradual migration (%, cohorts)
- Monitoring for discrepancies
- Fast rollback capability
- Communication to affected users

**Done Criteria:**
- Old system fully deprecated
- No data loss confirmed
- Performance maintained or improved
- All users migrated

### Migration-Specific Checklist
- [ ] What's the rollback strategy if migration fails?
- [ ] How will data integrity be validated?
- [ ] What's the communication plan for affected users?
- [ ] What's the deprecation timeline for the old system?
- [ ] How will stragglers be handled?

---

## Archetype-Specific Review Questions

### For Standard Projects
- How does this help merchants win?
- What's the adoption target?
- How will success be measured?

### For Experiments
- What hypothesis are we testing?
- What did we learn?
- Should this become a full project?

### For Infrastructure
- What teams/systems benefit?
- What's the operational impact?
- How does this connect to merchant value?

### For Data Projects
- What decisions does this enable?
- How is data quality ensured?
- What's the privacy/compliance posture?

### For Migrations
- What's the rollback plan?
- How is data integrity validated?
- What's the deprecation timeline?

---

## Choosing the Right Archetype

```
Is this exploratory work that may not ship?
  → YES → rnd/experiment
  → NO ↓

Is this platform/systems work with no external release?
  → YES → Infrastructure
  → NO ↓

Is this data platform or data-focused?
  → YES → Data Infrastructure or Data Feature
  → NO ↓

Is this moving from old to new system?
  → YES → Migration
  → NO ↓

→ rnd/project (standard)
```

---

## Reviewer Implications

Different archetypes get different reviewers:

| Archetype | OK1 | OK2 |
|-----------|-----|-----|
| Standard | Team's review plan | Product + project type |
| Infrastructure | Technical leads | Platform experts |
| Data | Data team leads | Data platform experts |
| Experiment | Lighter review | Learning-focused |

### What This Means for Proposals

**Standard projects:**
- Expect questions about merchant impact
- Prepare user research and feedback
- Have adoption metrics ready

**Infrastructure projects:**
- Expect questions about technical impact
- Prepare internal adoption plans
- Connect to merchant value chain

**Experiments:**
- Expect questions about learnings
- Prepare hypothesis and validation approach
- Have "next steps" recommendation ready

---

## Common Mistakes by Archetype

### Standard Projects
- Using activity-based success criteria
- Skipping merchant feedback
- Underestimating GTM requirements

### Infrastructure Projects
- Not connecting to merchant value
- Skipping operational readiness
- Underestimating adoption effort

### Experiments
- Treating as full project (over-investing)
- Not documenting learnings
- No clear next steps

### Migrations
- Underestimating rollback complexity
- Rushing deprecation
- Not validating data integrity

---

## Summary

| If your project is... | Use archetype... | Key focus... |
|-----------------------|------------------|--------------|
| Building for merchants | rnd/project | Merchant impact, adoption |
| Exploring an idea | rnd/experiment | Learnings, hypothesis |
| Building platform | Infrastructure | Technical impact, ops |
| Data work | Data Infrastructure/Feature | Quality, decisions enabled |
| Replacing old system | Migration | Rollback, data integrity |

Choose the right archetype to get relevant reviews and appropriate criteria for your work.
