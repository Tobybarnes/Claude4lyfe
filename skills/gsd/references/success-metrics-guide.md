# Writing Measurable Success Metrics

The #1 issue in GSD documents is **activity-based success criteria** - describing what you'll do instead of what success looks like. This guide fixes that.

---

## The Core Problem

**Activity-based** (bad):
- "Ship the API"
- "Complete the migration"
- "Launch the feature"

**Outcome-based** (good):
- "API adoption reaches 100 merchants within 30 days"
- "Migration reduces query latency from 200ms to 50ms"
- "Feature increases conversion by 2%"

Activities describe *work*. Outcomes describe *impact*. Reviewers need outcomes.

---

## The Three Levels of Success

### Level 1: Proof of Life
**Question**: Does it work as designed?

This is the minimum bar. The feature is functional and performs correctly.

```
Examples:
- "API responds within 100ms p99"
- "Feature loads without errors for 99.9% of requests"
- "Migration completes without data loss"
```

### Level 2: Proof of Adoption
**Question**: Are people using it?

The feature works AND users are engaging with it.

```
Examples:
- "50 merchants enabled the feature within 2 weeks"
- "API receives 1000 requests/day within 30 days"
- "80% of eligible users have migrated within 60 days"
```

### Level 3: Proof of Impact
**Question**: Did it achieve the intended business outcome?

The feature works, people use it, AND it delivers value.

```
Examples:
- "Checkout conversion increased by 2% (from 54% to 56%)"
- "Support tickets for X decreased by 30%"
- "Merchant churn in segment Y decreased by 15%"
```

**Best practice**: Include metrics at all three levels. Proof of Life is table stakes; Proof of Impact is what matters.

---

## The Baseline Problem

You can't measure improvement without a starting point.

**Bad**:
```
Success: Improve checkout conversion
```

**Good**:
```
Success: Improve checkout conversion
- Baseline: 54% (measured Oct 2024, last 30 days)
- Target: 57% (+3 points)
- Measurement: A/B test, 50% rollout, 30 days post-launch
```

### How to Establish a Baseline

1. **Use existing dashboards** - Link to the source
2. **Specify the time period** - "Last 30 days" or "Q3 2024"
3. **Note any caveats** - "Excludes mobile app, which has different patterns"
4. **Document how it was measured** - So future measurements are comparable

---

## Writing Good Metrics

### Structure
```
[Metric name]: [Baseline] → [Target]
- How measured: [method]
- When measured: [timeframe]
- Dashboard: [link]
```

### Example: Good Success Criteria Section

```
## Success Metrics

### Primary Metric
Mobile checkout conversion rate
- Baseline: 54% (Oct 2024, 30-day average)
- Target: 57% (+3 points)
- How measured: A/B test with 50% traffic allocation
- When measured: 30 days post-launch
- Dashboard: [link]

### Secondary Metrics
1. Checkout abandonment rate
   - Baseline: 32%
   - Target: 27% (-5 points)

2. Time to complete checkout
   - Baseline: 45 seconds (median)
   - Target: 30 seconds

### Guardrail Metrics (should not regress)
- Payment error rate: Currently 0.3%, must stay <0.5%
- Page load time: Currently 1.2s, must stay <1.5s
```

---

## Common Mistakes

### 1. Vanity Metrics
Metrics that look good but don't indicate success.

```
BAD:  "1000 API calls per day" (could be errors or spam)
GOOD: "1000 successful transactions per day from 50+ merchants"
```

### 2. Unmeasurable Metrics
If you can't measure it, it's not a metric.

```
BAD:  "Improve developer experience"
GOOD: "Reduce time to first successful API call from 2 hours to 30 minutes
       (measured via onboarding funnel analytics)"
```

### 3. Missing Timeframe
When will you measure success?

```
BAD:  "Conversion improves by 2%"
GOOD: "Conversion improves by 2% within 30 days of GA launch"
```

### 4. No Guardrails
What shouldn't regress?

```
BAD:  [Only lists improvements]
GOOD: "Guardrails: Error rate must stay <1%, latency must stay <200ms"
```

### 5. Too Many Primary Metrics
If everything is primary, nothing is.

```
BAD:  5 "primary" metrics
GOOD: 1 primary metric, 2-3 secondary, 2-3 guardrails
```

---

## Metrics by Project Type

### Product/Feature Launch
- Primary: Adoption rate, conversion impact
- Secondary: Engagement frequency, feature usage
- Guardrails: Error rates, performance, existing feature metrics

### Infrastructure/Platform
- Primary: Latency, reliability, throughput
- Secondary: Cost efficiency, developer adoption
- Guardrails: Error rates, availability

### Migration
- Primary: Completion percentage, timeline adherence
- Secondary: Performance comparison (old vs new)
- Guardrails: Data integrity, zero downtime

### Developer Experience
- Primary: Time to first success, completion rate
- Secondary: Support ticket volume, documentation engagement
- Guardrails: API error rates, existing integration health

---

## The Four-Step Framework

### Step 1: Set Goals in Three Categories

| Category | Question | Example |
|----------|----------|---------|
| **Adoption & Engagement** | Is it being used? | % merchants using feature after 30 days |
| **Usability** | Can users complete flows? | % users completing checkout in one session |
| **Effectiveness** | Does it solve the problem? | Reduction in support tickets |

### Step 2: Define Good Metrics

A good metric is:

| Property | Meaning | Example |
|----------|---------|---------|
| **Comparative** | Can compare across time, groups, competitors | Use ratios/rates/percentages |
| **Actionable** | Will you do something different based on changes? | Conversion rate (actionable) vs. total pageviews (not actionable) |
| **Specific** | Clear about segment and time period | "% of Plus merchants using feature within 30 days" |

**Good vs Bad Metrics:**

| Good Metric | Bad Metric |
|-------------|------------|
| % merchants using feature 30 days after launch | Number of merchants that install |
| % users that complete task within session | Number of users that start the task |
| Conversion rate by cohort | Total conversions |
| Error rate as % of requests | Number of errors |

### Step 3: Set Targets

A good target includes:

| Component | Why It Matters | Example |
|-----------|----------------|---------|
| **Target range** | What's good vs. acceptable? | Target: 57%, Acceptable: 55% |
| **Timeline** | When will you measure? | 30 days post-launch |
| **Segment** | Which users? | Plus merchants, mobile web |

### Step 4: Include Rationale

Document:
- Why you're measuring what you're measuring
- Why you set the specific targets
- What would change your approach if metrics miss

---

## Timeframe Guidance

**Most success metrics should be measurable within 1-4 weeks.**

| Timeframe | When Appropriate |
|-----------|------------------|
| 1-2 weeks | Adoption metrics, usability metrics |
| 2-4 weeks | Engagement metrics, early impact |
| 1-3 months | Full impact metrics (requires justification) |
| 3-6 months | Rare cases only (retention, long-term impact) |

**If your metric takes 6 months to measure:**
- Can you find leading indicators that show signal sooner?
- Are there intermediate milestones to track?
- Is there a proxy metric that correlates?

---

## Estimated Actuals vs. Percentages

**Use actual numbers with context, not just percentages:**

```
BAD:  "30% adoption rate"

GOOD: "~25K merchants using feature (30% of eligible population)"
```

Actual numbers are easier to understand and contextualize.

---

## Quick Checklist

Before submitting, verify your success metrics:

- [ ] At least one metric at each level (Life, Adoption, Impact)
- [ ] Baselines established with source and timeframe
- [ ] Targets are specific numbers, not "improve" or "increase"
- [ ] Measurement method is defined
- [ ] Timeframe for measurement is specified (most within 1-4 weeks)
- [ ] Dashboard or data source is linked
- [ ] Guardrail metrics are included
- [ ] Only 1 primary metric (2-3 secondary max)
- [ ] Rationale documented for targets
- [ ] Metrics are comparative, actionable, and specific
