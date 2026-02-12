# Feasibility Assessment

This reference helps evaluate whether a proposal is actually achievable, not just theoretically possible.

---

## The Core Question

**Can we REALLY do this?** Or is this theoretically possible but practically impossible?

---

## Feasibility Dimensions

### 1. Technical Feasibility

| Question | What to Check |
|----------|---------------|
| Is this proven technology? | Has anyone done this before at Shopify or elsewhere? |
| Does the architecture work? | Is it sound, or are there fundamental issues? |
| Are there technical blockers? | Unresolved technical questions on the critical path? |
| What's the integration complexity? | How many systems need to talk to each other? |

### 2. Resource Feasibility

| Question | What to Check |
|----------|---------------|
| Does the team have the skills? | Required expertise present or acquirable? |
| Is there enough capacity? | Team not overcommitted elsewhere? |
| Are key people available? | Dependencies on specific individuals? |
| Can missing expertise be acquired? | Realistic hiring/training timeline? |

### 3. Timeline Feasibility

| Question | What to Check |
|----------|---------------|
| Is there buffer for surprises? | Hofstadter's Law applies to all estimates |
| Are dependencies on the critical path? | External teams that could block? |
| Is the timeline realistic? | Based on actual velocity, not wishful thinking? |
| What happens if something slips? | Is there slack in the schedule? |

### 4. Operational Feasibility

| Question | What to Check |
|----------|---------------|
| Can we deploy without breaking things? | Rollout plan makes sense? |
| Is there a rollback plan? | Can we undo if something goes wrong? |
| Who maintains this after launch? | Clear ownership? |
| Is production readiness addressed? | Monitoring, alerting, runbooks? |

### 5. Organizational Feasibility

| Question | What to Check |
|----------|---------------|
| Does this align with priorities? | Leadership support exists? |
| Do other teams support this? | Dependencies are acknowledged? |
| Are there political blockers? | Competing agendas? |
| Is decision-making clear? | Who decides what? |

---

## Red Flags (Often Infeasible)

### Boiling the Ocean
Trying to solve everything at once.
```
RED FLAG: "We'll rebuild the entire checkout flow, add new payment methods,
          redesign the mobile experience, AND improve performance"
```

### Dependency Hell
Requires perfect coordination of many teams.
```
RED FLAG: "This depends on Platform, Payments, Identity, and Data teams
          all delivering their parts in the same quarter"
```

### Unicorn Hunting
Requires skills that don't exist in the organization.
```
RED FLAG: "We'll need ML expertise for the recommendation engine"
          [Team has zero ML experience]
```

### Timeline Fantasy
Ignores reality of how long things take.
```
RED FLAG: "4 weeks to rebuild what took 18 months originally"
```

### Technology Tourism
Unproven technology on the critical path.
```
RED FLAG: "We'll use this new framework that just hit v0.1"
```

### Second System Syndrome
Complete rewrite with all features plus more.
```
RED FLAG: "Replace the current system with something that does everything
          it does, plus these 10 new features"
```

### Committee Design
Too many stakeholders with conflicting goals.
```
RED FLAG: "We need sign-off from 8 different teams before we can proceed"
```

---

## Green Flags (Often Feasible)

### Proven Playbook
Similar work done successfully before.
```
GREEN FLAG: "We'll follow the same approach that worked for Project X,
            adapting for our specific needs"
```

### Incremental Approach
Value delivered in small chunks.
```
GREEN FLAG: "Phase 1 delivers value in 4 weeks. Phases 2-3 build on it."
```

### Team Expertise
Deep domain experience exists.
```
GREEN FLAG: "This team has built 3 similar systems in the past 2 years"
```

### Clear Ownership
Single team, clear mandate.
```
GREEN FLAG: "Our team owns this end-to-end with no external dependencies"
```

### Boring Technology
Well-understood, proven tools.
```
GREEN FLAG: "We'll use our standard stack: Ruby, React, PostgreSQL"
```

### Executive Alignment
Clear support from leadership.
```
GREEN FLAG: "This is the #1 priority for the product area this quarter"
```

---

## Feasibility Quick Assessment

For each dimension, rate 1-5:

| Dimension | Score (1-5) | Notes |
|-----------|-------------|-------|
| Technical | | |
| Resource | | |
| Timeline | | |
| Operational | | |
| Organizational | | |

**Interpretation:**
- **Average 4-5**: Highly feasible, low risk
- **Average 3-4**: Feasible with some risk, needs attention
- **Average 2-3**: Questionable, significant concerns
- **Average 1-2**: Likely infeasible, needs major rework

**Any single dimension at 1-2 is a blocker** that must be addressed before proceeding.

---

## Common Feasibility Mistakes

### Overconfidence Bias
"We've done something similar" when you haven't really.

### Planning Fallacy
Underestimating time because you're optimistic.

### Scope Creep Blindness
Not seeing how scope has grown beyond original plan.

### Dependency Minimization
"They'll definitely deliver on time" when they never have.

### Skill Overestimation
"We can figure out ML" when no one has done it before.

---

## Questions to Ask

Before approving any proposal, ask:

1. **What's the hardest part?** If they say "nothing, it's straightforward," probe harder.
2. **What could go wrong?** If they can't list risks, they haven't thought it through.
3. **Have you done this before?** If not, estimates should have more buffer.
4. **Who depends on you, and who do you depend on?** Unacknowledged dependencies are the #1 schedule killer.
5. **What happens if the timeline slips?** If there's no answer, there's no plan.

---

## Feasibility vs. Desirability

A proposal can be:
- **Desirable but infeasible**: Great idea, can't do it (yet)
- **Feasible but undesirable**: We could do it, but why?
- **Desirable AND feasible**: The sweet spot

**Only approve proposals that are BOTH desirable AND feasible.**
