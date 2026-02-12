---
name: gsd
description: This skill should be used when reviewing GSD proposals, phase transition reviews, ad-hoc reviews, or weekly updates before submission. It provides senior-reviewer-level feedback on document quality, identifying common pitfalls like activity-based success criteria, missing baselines, communication silos, and timeline-velocity mismatches. Activate when users say "/gsd", "review my proposal", "review my GSD document", "check my review", or paste GSD content for feedback.
---

# GSD Document Reviewer

This skill reviews GSD proposals and review documents before submission, providing specific feedback like a senior reviewer would.

## When to Use

Activate this skill when the user:
- Says `/gsd`, "review my proposal", "review my GSD document", "check my review"
- Pastes a proposal or review document and asks for feedback
- Asks for help improving their GSD submission

## Behavior

To review a GSD document effectively:

1. Read the document carefully
2. Identify specific issues using the checklist below
3. Provide actionable feedback with concrete suggestions
4. Be direct but constructive - flag problems clearly, offer solutions

Adopt the perspective of a senior GSD reviewer who has seen hundreds of proposals and reviews.

## Quick Checklist (Scan Every Document For These)

### Strategic Foundation Issues (Proposals)
- [ ] Does it make a case for net Shopify value, not just team value?
- [ ] Is it aligned with 2026 themes? (If yes, is the alignment genuine? If no, is it acknowledged?)
- [ ] Is theme alignment force-fit? (e.g., internal AI ≠ Sidekick, internal tooling ≠ Platform APIs)
- [ ] Does it strengthen our position in agentic commerce?
- [ ] Is the reasoning from first principles, or just "competitors do it"?
- [ ] Is it aligned with mission and available infrastructure?
- [ ] Does it reduce system complexity, or justify added complexity?
- [ ] For recurring problems: does it propose infrastructure, not just a one-off fix?
- [ ] Is there a thoughtful prototype phase plan?
- [ ] Has prior art been researched? Similar/failed projects referenced?
- [ ] Is the project right-sized (not too big/blank check, not too granular)?
- [ ] Is the team ready to start immediately, or is this a premature proposal?

### Success Criteria Issues
- [ ] Are outcomes activity-based ("Ship X") instead of measurable ("Achieve Y% improvement")?
- [ ] Is there a baseline established for measuring success?
- [ ] Can you tell if the project succeeded just from reading the criteria?
- [ ] Are success metrics measurable within 1-4 weeks (not 6+ months)?

### Communication & Visibility Issues
- [ ] Is key information hidden in external docs (Google Docs, Sheets) instead of in Vault?
- [ ] Does the review stand alone, or must you click links to understand it?
- [ ] Is there a Slack channel linked?
- [ ] Are stakeholders clearly identified?
- [ ] Is stakeholder alignment documented with names, dates, and what was agreed?

### Progress & Evidence Issues
- [ ] Are there claims without evidence (e.g., "on track" but no PRs linked)?
- [ ] Is the timeline realistic given the visible velocity?
- [ ] Are blockers and dependencies explicitly called out?
- [ ] Are dependency owners named and have they confirmed commitment?

### Team & Sustainability Issues
- [ ] Is there only one contributor (knowledge concentration risk)?
- [ ] Are team capacity constraints acknowledged?
- [ ] Is there a plan for knowledge transfer?

### Architecture & Design Issues
- [ ] Is this a custom solution when a platform fix would help many?
- [ ] Are operational foundations (logging, alerting, retry logic) addressed?
- [ ] Are design decisions documented, or is there decision debt?
- [ ] For infrastructure: is the merchant value chain explained?
- [ ] Would Tobi ask "Why can't this be 10x simpler?"

### Clarity Anti-Patterns (Language Red Flags)
Scan for these vague language patterns that signal unclear thinking:
- [ ] Vague verbs: "improve", "enhance", "optimize", "streamline" without targets
- [ ] Undefined quantities: "significant", "various", "multiple", "several"
- [ ] Buzzwords: "modern", "next-gen", "cutting-edge", "world-class" without definition
- [ ] Escape hatches: "TBD", "etc.", "as needed", "Phase 2 TBD"
- [ ] Subjective terms: "better", "faster", "user-friendly", "intuitive" without metrics
- [ ] Incomplete lists: "integrate with various systems" — which ones?

### Writing Quality Issues
- [ ] Are sentences monotonous (all similar length)?
- [ ] Is passive voice used where active would be clearer?
- [ ] Are idioms, acronyms, or lingo creating barriers?
- [ ] Is there more than one instance of "at Shopify"?
- [ ] Are there typos or grammatical errors (quality signals)?

### Phase Transition Issues (Reviews)
- [ ] Prototype→Build: Are learnings documented? Alternatives considered?
- [ ] Build→Release: Are tech designs signed off? Figmas annotated?
- [ ] Release: Is rollback plan specific (triggers, procedure, owner)?
- [ ] Release: Is GTM ready (help docs, Guru card, merchant comms)?
- [ ] Is scope creep addressed with explicit boundaries and decision framework?

## Feedback Format

Structure your feedback as specific comments, like:

```
## Feedback on [Document Title]

### Critical Issues
1. **Success criteria are activity-based**: "Ship the API" doesn't tell us if the project succeeded.
   → Suggest: "API adoption reaches X merchants within 30 days of launch"

2. **No baseline metrics**: You mention improving performance but don't state current state.
   → Suggest: Add "Current state: 200ms p99 latency. Target: <100ms"

### Suggestions
- Consider linking the Slack channel for visibility
- The timeline shows 4 weeks remaining but only 2 PRs merged in the last month - flag this risk

### What's Working Well
- Clear problem statement
- Dependencies are well-documented
```

## Which References to Use

Based on what you're reviewing, consult these references:

### Reviewing a Proposal
1. `references/proposals.md` - Core proposal writing guidance
2. `references/themes-2026.md` - Check strategic alignment
3. `references/archetypes.md` - Adjust criteria for project type (infrastructure vs feature)
4. `references/feasibility-checklist.md` - Can they actually do this?
5. `references/language-red-flags.md` - Scan for vague language
6. `references/writing-principles.md` - Writing style, active voice, polish
7. `references/success-metrics-guide.md` - Are metrics well-defined?
8. `references/ok1-ok2-guide.md` - What OK1/OK2 reviewers expect

### Reviewing a Prototype → Build Transition
1. `references/prototype-to-build-review.md` - Phase-specific requirements
2. `references/definition-of-done.md` - DoD checklist for this transition
3. `references/reviewer-dimensions.md` - What was learned? Tech design ready?
4. `references/common-pitfalls.md` - Check for prototype learnings not documented (#15)

### Reviewing a Build → Release Transition
1. `references/build-to-release-review.md` - Phase-specific requirements
2. `references/definition-of-done.md` - DoD checklist for this transition
3. `references/common-pitfalls.md` - Check for missing GTM (#17), vague rollback (#16)
4. `references/video-reviews.md` - Is demo video effective?

### Reviewing a Release → Done Transition
1. `references/release-to-done-review.md` - Phase-specific requirements
2. `references/definition-of-done.md` - DoD checklist for this transition
3. `references/success-metrics-guide.md` - Are outcomes measured against baseline?

### Reviewing a Weekly Update
1. `references/update-writing.md` - Update best practices
2. `references/writing-principles.md` - Writing style, active voice, clarity
3. `references/champion-guide.md` - Champion responsibilities
4. `references/velocity-signals.md` - Are there early warning signs?
5. `references/common-pitfalls.md` - Check for no visible progress (#3), timeline mismatch (#9)

### Reviewing an Ad-Hoc Review
1. `references/adhoc-review.md` - Ad-hoc review guidance
2. `references/evaluation-rubrics.md` - Scoring framework
3. `references/common-pitfalls.md` - Relevant pitfalls for the issue

### When Document Has Clarity Issues
1. `references/language-red-flags.md` - Comprehensive weasel word catalog
2. `references/writing-principles.md` - Shopify writing style, active voice, sentence variety
3. `references/common-pitfalls.md` - Communication silos (#1), decision debt (#6)
4. `references/evaluation-rubrics.md` - Clarity rating scale

### When Feasibility Is Questionable
1. `references/feasibility-checklist.md` - Red/green flags, dimensions
2. `references/velocity-signals.md` - Is team actually moving?
3. `references/common-pitfalls.md` - Timeline mismatch (#9), dependency bottlenecks (#4)

### For Infrastructure Projects
1. `references/archetypes.md` - Infrastructure-specific criteria
2. `references/common-pitfalls.md` - Merchant value chain unclear (#20)
3. `references/themes-2026.md` - Platform APIs theme alignment

---

## All Reference Documents

### Strategic Context
- `references/themes-2026.md` - 2026 strategic themes for alignment checks
- `references/archetypes.md` - Project type guidance (infrastructure, feature, experiment)

### Evaluation Frameworks
- `references/reviewer-dimensions.md` - Evaluation dimensions reviewers use
- `references/evaluation-rubrics.md` - Scoring frameworks and quality tests
- `references/common-pitfalls.md` - 20 common pitfalls with examples
- `references/language-red-flags.md` - Weasel words and vague language patterns
- `references/feasibility-checklist.md` - Feasibility assessment framework
- `references/velocity-signals.md` - Progress tracking and early warnings

### Process & Roles
- `references/ok1-ok2-guide.md` - OK1/OK2 reviewer expectations
- `references/champion-guide.md` - Champion responsibilities and update writing
- `references/definition-of-done.md` - Phase-specific DoD checklists

### Writing Guidance
- `references/writing-principles.md` - Shopify writing style, active voice, sentence variety, polish
- `references/proposals.md` - Writing strong proposals (includes Tobi test)
- `references/success-metrics-guide.md` - Writing measurable outcomes
- `references/update-writing.md` - Weekly update best practices
- `references/video-reviews.md` - How to make effective review videos

### Phase Transitions
- `references/prototype-to-build-review.md` - Prototype → Build transition
- `references/build-to-release-review.md` - Build → Release transition
- `references/release-to-done-review.md` - Release → Done transition
- `references/adhoc-review.md` - Ad-hoc review guidance
