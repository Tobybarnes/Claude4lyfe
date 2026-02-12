# GSD Review Dimensions

This reference documents the evaluation dimensions used by senior GSD reviewers. Use this to understand what reviewers actually look for.

---

## The Core Insight

**Unclear proposals waste months. Clear proposals ship.**

Reviewers look for specific evidence of clear thinking, not aspirational language. Vague language is a red flag for vague thinking.

---

## The Evaluation Dimensions

### Proposal Quality

| Dimension | What Reviewers Evaluate |
|-----------|-------------------------|
| **Proposal Clarity** | Can a stranger understand exactly what's being built? |
| **Proposal Feasibility** | Is this technically and operationally achievable? |
| **Success Metric Clarity** | Are success criteria specific and measurable? |
| **Estimate Verification** | Do estimates match scope and historical patterns? |
| **Risk Assessment** | Are risks identified with mitigation strategies? |
| **Milestone Likelihood** | What's the probability of hitting milestones? |
| **Stakeholder Alignment** | Is communication and alignment demonstrated? |
| **Dependency Health** | Are dependencies mapped and managed? |
| **Simplicity** | Is complexity justified or excessive? |
| **Documentation Quality** | Is knowledge captured and accessible? |

### Strategic Alignment

| Dimension | What Reviewers Evaluate |
|-----------|-------------------------|
| **Product Principles** | Does it align with Shopify's product principles? |
| **Leadership Perspective** | Would this pass senior leadership scrutiny? |
| **Historical Patterns** | Does this match historically rejected patterns? |
| **Similar Proposals** | Are there similar past proposals to learn from? |

### Impact & Cost

| Dimension | What Reviewers Evaluate |
|-----------|-------------------------|
| **Customer Impact** | What's the merchant/buyer impact? |
| **Opportunity Cost** | What are we NOT doing by doing this? |
| **Technical Debt** | What debt is created or resolved? |
| **Velocity** | Does team velocity support the plan? |

### Operational

| Dimension | What Reviewers Evaluate |
|-----------|-------------------------|
| **Dependency Analysis** | What external dependencies exist? |
| **Review Cycle Patterns** | What do past review cycles reveal? |
| **Documentation Needs** | What documentation is missing? |
| **Compliance** | Are compliance requirements met? |
| **Prioritization** | Is prioritization sound? |

---

## Clarity Assessment Framework

### The SMART Test

Every proposal element should be:
- **Specific**: Can a stranger understand exactly what's being built?
- **Measurable**: Are there concrete criteria for success?
- **Achievable**: Realistic given resources and constraints?
- **Relevant**: Aligned with business objectives?
- **Time-bound**: Clear milestones and deadlines?

### Clarity Rating Scale

| Score | Level | Description |
|-------|-------|-------------|
| 90-100% | Crystal Clear | Anyone could implement this. All terms defined, all metrics specified. |
| 70-89% | Mostly Clear | Main ideas clear, most metrics provided, some ambiguity in edge cases. |
| 50-69% | Somewhat Clear | Core concept understandable, some metrics missing, significant undefined areas. |
| 30-49% | Unclear | Requires interpretation, many metrics missing, major ambiguities. |
| 0-29% | Very Unclear | Fundamental confusion about intent, no real metrics, pervasive ambiguity. |

### Clarity Anti-Patterns (Instant Red Flags)

**Vague Improvement Language:**
- "improve", "enhance", "optimize", "streamline" — without specific targets
- "better", "faster", "easier", "user-friendly", "intuitive" — without metrics

**Undefined Quantities:**
- "significant", "substantial", "considerable"
- "various", "multiple", "several" — name them specifically

**Buzzword Bingo:**
- "modern", "next-gen", "cutting-edge", "world-class" — without definition

**Escape Hatches:**
- "TBD", "etc.", "as needed", "as appropriate"
- "Phase 2 TBD" — what's actually committed?

**Incomplete Lists:**
- "integrate with various systems" — which ones specifically?
- "support multiple formats" — name them

---

## Feasibility Assessment Framework

### Feasibility Dimensions

| Dimension | Scale |
|-----------|-------|
| Technical Complexity | Low → Moderate → High → Extreme |
| Resource Availability | Abundant → Sufficient → Constrained → Scarce → Insufficient |
| Timeline Realism | Conservative → Realistic → Aggressive → Optimistic → Unrealistic |

### Feasibility Blockers (Showstoppers)

- Technology stack not yet proven at scale
- Requires expertise team doesn't have (and no plan to acquire)
- Timeline doesn't account for regulatory/approval processes
- Single point of failure in critical dependency
- Competing priorities actively pulling team away

### Feasibility Enablers (Strengths)

- Similar system already built by another team (can learn from)
- Can leverage existing infrastructure
- Team has deep expertise in this domain
- Proven technology stack
- Strong past performance on similar work

---

## Risk Assessment Framework

### Risk Categories

1. **Technical Risks**: Architecture decisions, dependencies, integration complexity, performance
2. **Resource Risks**: Team turnover, skill gaps, competing priorities, insufficient staffing
3. **Timeline Risks**: Missed milestones, scope expansion, underestimated complexity
4. **Integration Risks**: Cross-team coordination, API uncertainties, conflicting requirements
5. **Operational Risks**: Monitoring gaps, missing runbooks, unclear maintenance ownership

### Early Warning Patterns

These signals predict problems BEFORE crisis:

| Signal | What It Predicts |
|--------|------------------|
| Decreasing PR velocity (3→2→1/week) | Capacity crunch coming |
| Growing PR review times (2d→5d→10d) | Quality bottleneck forming |
| Increasing "fix" commits | Technical debt explosion |
| Vague updates replacing specifics | Scope confusion |
| Multiple approaches tried and abandoned | Architectural issues |
| Defensive or apologetic tone | Hidden problems |

### Risk Cascade Thinking

Don't just identify risks—trace consequences:

```
IF key engineer leaves
→ THEN 3 PRs orphaned
→ CONSEQUENCE: 4-week knowledge transfer delay

IF API team misses Dec 15 deadline
→ THEN integration testing pushed to Jan
→ CONSEQUENCE: Misses Q1 launch window
```

---

## Estimate Verification Framework

### What Gets Flagged

- Scope/timeline/capacity mismatch
- Team's own estimates indicate they're understaffed
- Historical data shows similar projects needed more resources
- Complexity underestimated based on past patterns

### What Does NOT Get Flagged

- Small teams (don't flag by size alone)
- Only flag if there's evidence of actual mismatch

### Delay Pattern Analysis

When estimates seem off, check for these historical patterns:

| Pattern | Description |
|---------|-------------|
| Platform/Dependency Wait | Dependencies weren't ready |
| Scope/Priority Shifts | Business direction changed mid-flight |
| Resource Contention | Team members reassigned |
| Cross-team Coordination | Waiting on other teams |
| Technical Underestimation | Complexity higher than anticipated |
| Integration Challenges | System integration harder than expected |

---

## Tobi's Product Principles

### What Tobi Looks For

| Principle | Question | Red Flags |
|-----------|----------|-----------|
| **Build for the Long Term** | "How does this compound over time?" | Quick fixes, technical debt, short-term thinking |
| **Simplicity over Features** | "Can this be 10x simpler?" | Feature creep, unnecessary abstractions, over-engineering |
| **Make Commerce Better for Everyone** | Does this democratize commerce? | Solutions only for enterprise, increasing barriers |
| **Merchant Obsession** | "Have we talked to 100 merchants?" | Internal problems disguised as merchant problems |
| **Act Like an Owner** | "Would you build this if it was your money?" | Empire building, resource waste, low ROI |

### Tobi's Pet Peeves (Showstoppers)

- Over-engineering simple problems
- Building frameworks instead of solutions
- Complexity without proportional value
- Feature-factory mentality
- Not thinking from first principles
- Premature optimization
- Solutions looking for problems

### Tobi's Common Questions

- "Why can't this be 10x simpler?"
- "How does this help merchants win?"
- "Is this a platform capability or just a feature?"
- "What's the real problem we're solving?"
- "Have we tried the simple approach first?"
- "What's the smallest thing we can ship?"

---

## Simplicity Assessment

### Complexity Rating

| Level | Description |
|-------|-------------|
| Simple | Straightforward, minimal abstractions |
| Appropriate | Right level of complexity for the problem |
| Complex | More moving parts than necessary |
| Over-engineered | Unnecessary complexity without proportional value |

### Main Complexity Drivers

- **Premature abstraction**: Building for cases that don't exist yet
- **Framework building**: Building frameworks instead of solutions
- **Over-configuration**: Making everything configurable when it doesn't need to be
- **Premature optimization**: Optimizing before proving the approach works

---

## Success Metrics Framework

### What Makes Good Success Criteria

- Specific metrics with actual numbers
- Clear baselines for comparison (current state)
- Target values (goal state)
- Measurement methods defined
- Timeline for achievement specified
- Covers both immediate deliverables AND long-term impact

### Success Anti-Patterns

```
BAD:  "Improve performance"
      → No metrics, no targets

BAD:  "User satisfaction"
      → No survey methodology defined

BAD:  "Make system better"
      → No before/after metrics

BAD:  "50% improvement"
      → No measurement plan, no baseline

BAD:  "Professional quality"
      → Subjective, unmeasurable
```

### Success Dimension Coverage

Good proposals cover multiple dimensions:

| Dimension | Example Metrics |
|-----------|-----------------|
| Business Impact | Revenue, cost, efficiency |
| User Value | Satisfaction, adoption, engagement |
| Technical Success | Performance, reliability, quality |
| Strategic Alignment | Mission advancement, theme support |

---

## Documentation Quality Signals

### What Gets Evaluated

- Completeness and accuracy
- Knowledge distribution (not siloed)
- Onboarding difficulty for new team members
- Critical gaps in documentation
- Whether team knowledge is too centralized

### Red Flags

- "Ask [person]" is the only answer to questions
- No onboarding documentation
- Design decisions not recorded
- Only one person understands the system

---

## Using This Reference

When reviewing a GSD document, mentally run through these dimensions:

1. **Clarity**: Would a stranger understand this?
2. **Feasibility**: Can this team actually do this?
3. **Success**: How will we know if it worked?
4. **Risks**: What could go wrong and what's the plan?
5. **Dependencies**: What external factors matter?
6. **Simplicity**: Is complexity justified?
7. **Alignment**: Does this advance our mission and themes?

Flag specific issues with specific quotes. Don't just say "unclear"—say "Line 47 says 'integrate with various systems' but doesn't name which systems."
