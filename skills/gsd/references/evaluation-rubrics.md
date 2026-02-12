# GSD Evaluation Rubrics

This reference documents the scoring frameworks used by senior GSD reviewers to evaluate proposals and reviews.

---

## The Core Evaluation Framework

All evaluations use a dual-lens approach:

### Outcome Focus (60% of evaluation)

| Dimension | Weight | What It Measures |
|-----------|--------|------------------|
| **Decision Impact** | 24% | Would an executive change their thinking after reading this? |
| **Quality of Thinking** | 18% | Root cause analysis? Pattern connections? Second-order thinking? |
| **Shopify Values Alignment** | 12% | Merchant obsession? Simplicity? Long-term thinking? |
| **Trustworthiness** | 6% | Can stakeholders act on this without second-guessing? |

### Quality Hygiene (40% of evaluation)

| Dimension | Weight | What It Measures |
|-----------|--------|------------------|
| **Grounding in Evidence** | 14% | Are claims backed by specific data? |
| **Factual Accuracy** | 12% | No hallucinations or fabrications? |
| **Logical Coherence** | 10% | Does reasoning follow logically? |
| **Completeness** | 4% | Covers relevant aspects without major blind spots? |

---

## Overall Score Interpretation

| Score | Level | Description |
|-------|-------|-------------|
| 0.85-1.0 | **Exceptional** | Would change executive decisions, world-class thinking, strong Shopify values |
| 0.70-0.85 | **Strong** | Meaningful decision support, good analytical depth, clear focus |
| 0.55-0.70 | **Adequate** | Some useful insights, acceptable but not impressive |
| 0.40-0.55 | **Weak** | Limited decision value, shallow analysis |
| 0.0-0.40 | **Poor** | No decision value, restates obvious information |

---

## Clarity Rating Scale

| Score | Level | What It Means |
|-------|-------|---------------|
| 90-100% | **Crystal Clear** | Anyone could implement this. All terms defined, all metrics specified, clear boundaries. |
| 70-89% | **Mostly Clear** | Main ideas clear, most metrics provided, some edge case ambiguity. |
| 50-69% | **Somewhat Clear** | Core concept understandable, some metrics missing, significant undefined areas. |
| 30-49% | **Unclear** | Requires interpretation, many metrics missing, major ambiguities. |
| 0-29% | **Very Unclear** | Fundamental confusion about intent, no real metrics, pervasive ambiguity. |

---

## Severity Classification

When flagging issues, use these severity levels:

| Severity | Impact | Examples |
|----------|--------|----------|
| **High** | >50% impact on project success | Missing success criteria, no rollback plan, key dependency unaddressed |
| **Medium** | 20-50% impact | Vague timeline, incomplete stakeholder list, some metrics undefined |
| **Low** | <20% impact | Minor clarity issues, formatting, nice-to-have improvements |

---

## The Five Quality Tests

Before finalizing any GSD document, apply these tests:

### 1. The CEO Test
Would Tobi find this valuable? Does it show clear thinking?

### 2. The Action Test
What specific actions does this enable? If nothing changes, why write it?

### 3. The Insight Test
What did we learn that wasn't obvious? Does this add new understanding?

### 4. The Values Test
Does this think like Shopify's best people? Merchant-obsessed? Simple? Long-term?

### 5. The Evidence Test
Can every major claim be traced to specific data or evidence?

**Scoring implication:**
- If most answers are "no" → score below 0.6
- If all answers are "yes" → score above 0.75

---

## Domain-Specific Rubrics

### Proposal Clarity Dimensions

| Dimension | What to Evaluate |
|-----------|------------------|
| Weasel Words | Are vague terms used without specifics? |
| Measurability | Can success be objectively measured? |
| Scope Boundaries | Are in/out scope explicitly defined? |
| Assumptions | Are key assumptions stated and testable? |
| SMART Criteria | Specific, Measurable, Achievable, Relevant, Time-bound? |

### Risk Assessment Dimensions

| Dimension | What to Evaluate |
|-----------|------------------|
| Proactive Identification | Are risks identified before they manifest? |
| Categorization Breadth | Technical, resource, timeline, integration, operational? |
| Early Warning Detection | Are leading indicators defined? |
| Severity Calibration | Are risk levels appropriate to actual impact? |
| Mitigation Actionability | Can mitigations actually be executed? |

### Simplicity Dimensions

| Dimension | What to Evaluate |
|-----------|------------------|
| Antipattern Recognition | Are over-engineering patterns present? |
| Complexity Root Cause | Why is this complex? Is it necessary? |
| Simplification Strategy | What could be removed or simplified? |
| Tobi-style Questioning | Could this be 10x simpler? |

### Estimate Verification Dimensions

| Dimension | What to Evaluate |
|-----------|------------------|
| Scope Alignment | Do estimates match described scope? |
| Historical Accuracy | How do these compare to similar past projects? |
| Resource Reality | Are resources feasible given capacity? |
| Methodology Quality | Is estimation approach sound? |
| Risk Coverage | Do estimates account for uncertainty? |

---

## Evidence Requirements

Every finding must have citations:

```
✓ GOOD: "Proposal states 'improve system performance' without
         defining metrics or targets (line 47)"

✗ BAD:  "Performance goals are unclear"
```

```
✓ GOOD: "Success defined as 'user satisfaction' but no survey
         method specified in success criteria section"

✗ BAD:  "Success metrics need work"
```

```
✓ GOOD: "Proposal says 'integrate with various systems' but
         doesn't list which systems (paragraph 3)"

✗ BAD:  "Scope seems too broad"
```

### Citation Format

```json
{
    "reference": "EXACT verbatim text from the document",
    "source": "Section or line number",
    "context": "How this evidence supports the finding"
}
```

---

## Anti-Hallucination Rules

When reviewing, NEVER:
- Make claims without specific evidence from the document
- Infer information not explicitly stated
- Assume intent beyond what's written
- Fabricate metrics or data
- Generalize without citing specific examples

When reviewing, ALWAYS:
- Quote exact text when flagging issues
- Specify where in the document the issue appears
- Distinguish between "missing" and "unclear"
- Provide specific suggestions, not vague guidance

---

## Comparative Standards

### What "Good" Looks Like

**Good Problem Statement:**
> "Mobile checkout conversion is 54% vs 66% on desktop. Exit surveys show 'too many steps' as #1 complaint. Q4 is our highest-traffic quarter."

**Good Success Criteria:**
> "Mobile checkout conversion increases from 54% to 57% within 30 days of launch, measured via existing analytics dashboard."

**Good Risk Identification:**
> "Risk: Security review has 2-week queue. Mitigation: Requested review on Nov 1, expected approval Nov 15. Escalation path: If delayed, [owner] escalates to [person]."

### What "Bad" Looks Like

**Bad Problem Statement:**
> "Checkout experience needs improvement."

**Bad Success Criteria:**
> "Improved user satisfaction."

**Bad Risk Identification:**
> "Risk: Dependencies. Mitigation: Will coordinate."

---

## Using These Rubrics

When reviewing a GSD document:

1. **First pass**: Scan for clarity anti-patterns (weasel words, escape hatches)
2. **Second pass**: Evaluate against SMART criteria
3. **Third pass**: Check evidence for all claims
4. **Fourth pass**: Apply the five quality tests
5. **Final pass**: Assign severity to each finding

Remember: The goal is to help the author improve, not to reject. Provide specific, actionable feedback with exact quotes and concrete suggestions.
