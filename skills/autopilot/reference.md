# Autopilot -- Static Knowledge Base

Last updated: 2026-03-05

---

## 0. Project Status Dashboard (from Vault)

### Main Project: Sell for Me: Build Autopilot (48856)
- **Phase:** Prototype (since 2026-01-16) — Build review (65062) awaiting OK1
- **Status:** OFF TRACK
- **Priority:** P1
- **Progress:** Week 7 of 15 (47%)
- **GA Target:** April 15, 2026
- **Blocker:** 3P Ads and Recommendation Service both off track — Google API blockers and ML model readiness threaten timeline
- **Missed milestones:** Build (Feb 23) and Internal (Mar 2) not yet completed

### Subprojects

| Project | ID | Phase | Status | Champion | GA Target |
|---|---|---|---|---|---|
| **Sidekick Integration** | 49375 | Build | AT RISK (Alignment blocker) | Vitalik Danchenko | Apr 15 |
| **Messaging Integration** | 49027 | Build | On Track | Clare Curtis | Apr 15 |
| **Recommendation Service** | 49056 | Prototype | On Track (build review 65118 awaiting OK1) | Greg Yang | Apr 10 |
| **Shop Campaigns Integration** | 49028 | Build | On Track | Chris Barnes | Apr 15 |

---

## 1. Architecture Overview

Autopilot is an AI-powered system that automates marketing for Shopify merchants. A merchant turns on "autopilot" in the Growth tab, sets a budget and guardrails, and the system automatically runs marketing tactics across channels.

### Five Pillars

| Pillar | What It Does | Where It Lives |
|---|---|---|
| **Recommender** (mm-compass) | Generates growth plans/tactics, distributes budget across channels | Separate service; Ruby orchestration + Python ML inference |
| **Growth Agent in Core** | Playbook data model, GraphQL APIs, Kafka producers/consumers, guardrails | `components/growth/` in world monorepo |
| **Channel Connectors** | Platform-specific integration (Google Ads, Meta Ads, Shop Campaigns, Messaging, OpenAI) | Each channel is a separate service; communicate via Kafka + Protobuf |
| **Admin Web (Growth tab)** | Dashboard UI: playbook config, channels, budget, guardrails, timeline, save bar, floating Sidekick input | `areas/clients/admin-web/app/sections/Growth/` |
| **Sidekick Integration** | AI assistant reads growth data (GraphQL) and writes actions (activity tools/intents) | `sidekick-server` repo; component evals with promptfoo |

### Data Flow

```
Recommender generates tactics
  -> Kafka message to Core (growth_agent_requests topic)
    -> Core stores desired state in playbook tables
      -> Kafka to Channel Connector (growth_agent_requests topic)
        -> Channel executes (e.g., creates Google PMax campaign)
          -> Kafka response back to Core (growth_agent_channel_responses topic)
            -> Core updates playbook state
              -> Admin Web reads via GraphQL
                -> Merchant sees results in Growth tab
```

Channels can also send unprovoked signals (health, alerts, state changes) via `growth_agent_channel_signals` topic.

### Key File Paths

- Core component: `components/growth/`
- Admin frontend: `areas/clients/admin-web/app/sections/Growth/`
- Protobuf schemas: `protocols/proto/shopify/growth_agent/growth_agent.proto`
- Feature flags: "Growth section" (flag 20826), "Growth agent tools" (flag 21380)
- Autopilot prototype: https://autopilot.quick.shopify.io/growth

---

## 2. Data Model

### Core Tables

| Table | Purpose | Key Columns |
|---|---|---|
| `playbooks` | Top-level autopilot configuration per shop | shop_id, status (active/paused/errored) |
| `playbook_versions` | Versioned snapshots of playbook config | playbook_id, guardrails (JSON), budget |
| `playbook_actions` | Individual actions/events taken by the agent | playbook_id, action_type, arguments, timestamps |
| `growth_agent_channels` | Channel connection state per shop | shop_id, channel_type, connection_status |

### Playbook Lifecycle

A playbook can be in these states: Created (not yet active), Active, Paused, Errored. Open question (Feb 9): whether a "created but not active" state is needed.

All playbooks begin as recommendations from the recommender. The merchant accepts/modifies the recommendation, which creates or updates a playbook.

### Guardrails JSON Structure

Stored in `playbook_versions.guardrails` as a JSON-encoded string:

```json
{
  "guardrails": {
    "limits": {
      "target_roas": 5,
      "email_frequency_cap": 20
    },
    "permissions": [
      {
        "type": "CUSTOMER_MANAGEMENT",
        "value": "custom",
        "actions": [
          {"name": "TAGS", "value": "allow"},
          {"name": "SEGMENTS", "value": "ask"},
          {"name": "COMMUNICATION", "value": "never"}
        ]
      }
    ]
  }
}
```

Limits and permissions are modeled as frozen records (see Hovo's PR #419004 for implementation).

### Kafka Topics & Protobuf

Three Kafka topics using Protobuf serialization:
- `growth_agent_requests` -- Growth Agent sending requests to channels (e.g., "create a PMax campaign")
- `growth_agent_channel_responses` -- Channels responding to requests (e.g., "campaign created successfully")
- `growth_agent_channel_signals` -- Channels sending unprovoked messages (health checks, alerts, state changes, drift)

Protobuf schema: `protocols/proto/shopify/growth_agent/growth_agent.proto` (merged Feb 11). Available via the `proto` gem. Uses `oneof` for typed payloads per channel, supporting versioning.

Consuming the proto gem in other repos:
1. `bundle update proto`
2. Ensure `shopify/growth_agent` namespace is in compiled protobuf packages
3. Compile protobuf files

### Timeline

Custom implementation (not extending the events primitive, due to issues with that system). Timeline messages may need translation support; the approach is to store `verb` + `arguments` in the database and use Rails i18n for rendering.

---

## 3. Sidekick Integration Deep-Dive

This is Eagle's primary focus area.

### Read Path (Sidekick -> Growth Data)

Sidekick uses its GraphQL tool to query growth APIs:
- Playbook state (budget, status, channels, guardrails)
- Playbook actions / timeline
- Channel connection status
- Recommendations from the agent

**Current problem**: Sidekick was explicitly told not to provide sales data and has no built-in knowledge of Growth capabilities. It defaults to ignoring GraphQL queries about growth. Vitalik documented this in a one-pager exploring approaches:
- Dedicated growth tools (higher control, more coupling)
- Making Growth APIs available in Sidekick's GraphQL tool index (lower coupling, less control)
- Matt Koenig (Sidekick PM) gave some suggestions before committing to dedicated tools

This is a foundational blocker for the Sidekick pillar.

**Key doc**: Vitalik's one-pager: https://docs.google.com/document/d/1CPyXqEhnu3J6nePCXOABgWeu8V11mz180M1d0DaqD6Q

### Write Path (Sidekick -> Modify Growth State)

Sidekick uses **activity tools** (intents) to modify playbook state:
- Change budget
- Update guardrails (target ROAS, email frequency cap)
- Toggle channels on/off
- Accept/reject recommendations

Jaime Cepeda is designing the activity tools schema (issue #39333). He documented use cases at: https://github.com/shop/world-next/issues/38598#issuecomment-3810987836

### Floating Sidekick Input Bar

A persistent input field at the bottom of the Growth tab (`SidekickFieldNext` from `@shopify/polaris-internal/experimental`).

**Resolution (Feb 11)**: Kevin gave green light. Autopilot is the "test bed" for this pattern before it rolls out across admin. Matt Koenig aligned. Team owns the risk it may be replaced when admin-next ships.

Key reference implementations:
- `SidekickHomeChat` (best reference): `admin-web/app/sections/Home/components/SidekickHomeChat/SidekickHomeChat.tsx`
- Detailed scope doc: `tmp-floating-sidekick-scope.md` in workspace root

UX pattern agreed (Feb 11, Jaime/Gita/Kazden):
- Inline bar is the primary entry point for declarative interaction
- Any request requiring back-and-forth, additional context, or merchant confirmation opens the full sidebar
- Agent shows preview (highlighted in blue) for recommendations in the chat
- Future: creating playbooks via Sidekick

### Context Bundle

When a merchant types in the floating bar, the message must carry growth context so Sidekick can reason about state (issue #38589). Work:
- Assemble context from Growth section state (playbook config, channels, guardrails, budget)
- Pass via `context` parameter on `sidekick.launch()`

### Route Manifest

Growth section's `route.manifest.ts` needs `terms` and `tasks` annotations for Sidekick navigation. Reference: Billing page's route manifest. Vitalik raised this Feb 3.

### Evals

- Promptfoo-based component evals in sidekick repo (Tim Urian set up the branch)
- Gita built a crowdsourcing tool for growth agent questions: https://gtx-crowdsourcing.quick.shopify.io/
- Question bank: https://docs.google.com/spreadsheets/d/1t0xIrJrzAMGzcclwLJVD3mSfZDpB8k1Vhcfbg_OWXF8
- Vitalik shipped two growth-related tools to sidekick-server (Feb 2)
- Tim working on weekly insights generation prototype
- Flywheel (LLM judge) being explored for production eval

### Staffing

Vitalik estimates 3 engineers needed for Sidekick, but work is heavily dependent on Admin/Core progress (context bundle, activity tool handlers, etc.). Sidekick weekly plan: https://docs.google.com/spreadsheets/d/1M0fFIzuiae3sEMHk04CiUeuuFfMOQZ4S2MYfnB-sH1s

---

## 4. Key Decisions Registry

| # | Decision | Date | Who | Rationale |
|---|---|---|---|---|
| 1 | Sidekick reads via GraphQL, writes via activity tools (intents) | Feb 5 | Matt Koenig, Sidekick team alignment | Uniform with rest of admin; form filling/slot filling stays consistent |
| 2 | No playbook inheritance; Autopilot defaults seed new playbooks, then frozen | Feb 4 | Francesco Sardo | Simplicity; avoids cascading changes when defaults update |
| 3 | Protobuf for Kafka schemas | Feb 6 | Phil Messenger, Chris Barnes | Standard Shopify pattern now; `growth_agent.proto` merged |
| 4 | Three Kafka topics: requests, channel_responses, channel_signals | Feb 4 | Chris Barnes | Generic envelope with typed payloads via `oneof`; replaces earlier inbound/outbound naming |
| 5 | Custom timeline, not extending events primitive | Feb 9 | Hovo | Events primitive had known issues; custom solution gives more control |
| 6 | Guardrails as JSON in playbook_versions with frozen records | Feb 9 | Hovo | Flexible schema; limits + permissions modeled as frozen records |
| 7 | Floating Sidekick bar approved as testbed pattern | Feb 11 | Kevin (green light), Matt Koenig (aligned) | Autopilot tests the pattern before admin-wide rollout; risk of rewrite when admin-next ships |
| 8 | Channel Connector Protocol: generic envelope with typed payloads | Feb 9 | Chris Barnes | Lets channels define their own message structures within a standard wrapper |
| 9 | Inline bar prioritized over sidebar; sidebar for complex interactions | Feb 11 | Jaime, Gita, Kazden | Inline is the declarative entry point; sidebar for back-and-forth |
| 10 | No A/B at launch; trust metrics for success; goldilocks audience | Feb 10 | Tom Lowe + MM SLT | Focus on merchants with 1-1000 non-paid orders; iterate post-launch |

---

## 5. Active Challenges

### A. Sidekick Cannot Access Growth Data (HIGH)
- **Owner**: Vitalik Danchenko
- **Status**: Active investigation; one-pager written; meeting with Sidekick team happened Feb 10
- **Problem**: Sidekick has no knowledge of Growth capabilities and was told to ignore sales data
- **Impact**: Foundational blocker for the entire Sidekick pillar
- **Doc**: https://docs.google.com/document/d/1CPyXqEhnu3J6nePCXOABgWeu8V11mz180M1d0DaqD6Q

### B. Channel Connection Architecture (MEDIUM)
- **Owner**: Chris Barnes
- **Status**: Two options debated; no decision logged
- **Options**: Agent-owned vs channel-owned connection state; both involve immediate availability feedback but differ in who records connection state
- **Doc**: https://github.com/shop/world/pull/414551

### C. Drift Detection Design (MEDIUM)
- **Owner**: Phil Messenger
- **Status**: Design doc written; not implemented
- **Key insight**: Two types of drift -- parameterized (reconcilable by recommender) vs channel-internal (not reconcilable at core level)
- **Doc**: Tab in Aim doc: https://docs.google.com/document/d/1g6mn6kOSwp0HW3-r2rHsFixfmlOvHcm7pgWJq1z1wI8/edit?tab=t.xziq2hq6m4nv

### D. Auth/RBAC for Autopilot (HIGH)
- **Owner**: Unowned
- **Status**: Questions raised by Soheil (Feb 5); no decision logged
- **Questions**: Who can enable Autopilot? What access does it get? Marketing scope historically did not involve spending money.
- **Impact**: One-way-door decision affecting both UX and Sidekick

### E. Error Handling Between Channels and Core (MEDIUM)
- **Owner**: Martin Bouchard raised it; Phil favors core-decides
- **Status**: No formal decision
- **Question**: Should channels resolve errors (retries, DLQ) or return to core for the agent to decide?
- **Sub-question**: Raw platform errors vs abstracted errors (coupling concern)

### F. Duplicate Automation with Existing Apps (LOW-MEDIUM)
- **Owner**: Hussien Khayoon (Messaging team) raised it
- **Status**: Unresolved
- **Example**: Merchant has Klaviyo running abandoned cart; enabling Messaging causes duplicate emails
- **Question**: Growth Agent checks at recommendation stage vs Messaging-side filter?

### G. Subscription/Pricing Tiers (EARLY)
- **Owner**: Craig Coles, Francesco Sardo
- **Status**: Early ideation from SLT demo feedback
- **Idea**: Tiered pricing for Autopilot capabilities (similar to Anthropic pricing UI); what happens when merchant hits upper bounds of current tier

---

## 6. Team Map

### Leadership
| Person | Role | Notes |
|---|---|---|
| Phil Messenger (`philmes`) | Technical/Architecture Lead | On vacation Feb 16-20; NYC for MM Eng SLT burst week after |
| Travis Allan | Product Manager | Sets scope and milestones |
| Francesco Sardo | Engineering Lead | Organized the burst; drives day-to-day coordination |
| Natasha Lacasse | Program updates | Handles naming/project admin |

### Core / Admin (UX Pillar)
| Person | GitHub | Role | Eagle's Direct? |
|---|---|---|---|
| Craig Coles | `craigcolesshopify` | Core/Admin tech lead, Kafka | No |
| Hovo Khachikyan | `hovo` | Data model, GraphQL APIs, guardrails | **Yes** |
| Sam Dupras | `duprasa` | Frontend, mutations, Google connect, docs unification | **Yes** |
| Virak Ngauv | `vngauv` | Frontend, timeline, budget hookup, save bar | **Yes** |
| Renxia Wang | `rrxxww` | Channels, frontend | **Yes** |
| Mathieu Wrzesien | `MatWrz` | Playbook actions table | No |

### Sidekick Pillar
| Person | GitHub | Role |
|---|---|---|
| Vitalik Danchenko | `vitalikdanchenko` | Sidekick integration lead; GraphQL/tools investigation |
| Tim Urian | `timdef` | Evals, promptfoo, weekly insights prototype |
| Jaime Cepeda | `jecepeda` | Activity tools schema, Sidekick-Admin interaction design |
| Gita Ravindran | -- | PM deep dives, crowdsourcing questions, Sidekick domain knowledge |
| Joseph McLoughlin | -- | Architecture, context bundle design |

### UX Design
| Person | Role |
|---|---|
| Kazden Cattapan | UX design lead; maintains prototype |
| Salma Amzil | UX design; pending actions, guardrails UI |

### Channel Connectors / ANC
| Person | GitHub | Role |
|---|---|---|
| Chris Barnes | `chrismbarnes` | Channel Connector Protocol, Kafka schema |
| Gavin Hinchley | -- | Shop Campaigns integration, Protobuf guide |
| Daniel Bain | -- | Shop Campaigns, Kafka/Protobuf |
| Martin Bouchard | -- | Google Ads integration, error handling |
| Ryan Ferguson | -- | Google Ads, drift detection |
| Wuang Qin | -- | ANC execution engine |

### Other Key People
| Person | Role |
|---|---|
| Matt Koenig | Sidekick PM (external to project); aligned on read/write patterns |
| Tom Lowe | Analytics, instrumentation, success measurement |
| Emma Shanahan | Geo/language availability questions |
| Soheil H | Auth/RBAC questions |
| Greg Yang | Recommender team |
| Andrew Arnold | Recommender team |
| Yingwei Lin | Recommender, OpenAI integration |

---

## 7. Glossary

| Term | Definition |
|---|---|
| **Autopilot** | The mode a merchant turns on in the Growth tab to let the AI agent manage their marketing. The current name for the project (was Growth Agent, then Sell for Me). |
| **Growth Tab** | The new section in Shopify Admin where Autopilot lives. Feature-flagged ("Growth section", flag 20826). |
| **Playbook** | Top-level configuration for an autopilot run. Contains budget, channels, guardrails. Can be active, paused, or errored. |
| **Tactic** | A specific marketing action recommended by the recommender (e.g., "create a Google PMax campaign with $50/day budget"). |
| **Guardrails** | Merchant-defined constraints on what the agent can do. Two types: **limits** (numeric caps like target ROAS, email frequency) and **permissions** (allow/ask/never for categories like customer tags, segments, communication). |
| **Context Bundle** | A structured payload of shop attributes and growth state passed to the recommender and to Sidekick for reasoning. |
| **Channel Connector Protocol** | The standardized Kafka + Protobuf contract for communication between Core and channel services. Generic envelope with typed payloads via `oneof`. |
| **PMax (Performance Max)** | Google's automated, goal-oriented campaign type. The only Google campaign type Autopilot creates. Requires budget, merchant center ID, bidding strategy, and target (tROAS/tCPA). |
| **MCC (My Client Center)** | Google's centralized agency account for managing multiple client Google Ads accounts. Shopify uses it to simplify onboarding, manage billing, and control signal sharing. |
| **Brownfield Conflicts** | Issues when the AI agent automates marketing for merchants who already have manual marketing setups (auction competition, duplicate catalogs, signal double-counting). |
| **Desired State** | The target configuration the agent wants to achieve on a platform (e.g., "Google PMax campaign with $50/day budget and 3x tROAS"). |
| **Observed State** | The actual current configuration on the platform, as reported by the channel. |
| **Drift Detection** | Detecting differences between desired and observed state. Two types: **parameterized drift** (reconcilable at the tactic level, e.g., budget changed) and **channel-internal drift** (not reconcilable at core, e.g., asset group modified). |
| **Brief DSL** | A structured language for expressing merchant goals, budgets, and tactic preferences. |
| **Policy DSL** | A Ruby-based language for defining safety guardrails and constraints as code. |
| **Hedwig** | Sidekick-specific background job processor for internal orchestration, chained research, and scheduled tasks. |
| **Activity Tools** | The mechanism Sidekick uses to write data back to admin (modify playbook, change budget, toggle channels). Uses the intents/slot-filling pattern. |
| **Intents** | Sidekick's way of recognizing what the merchant wants to do and mapping it to a structured action (e.g., "increase budget to $100" -> budget update intent). |
| **Route Manifest** | The `route.manifest.ts` file for each admin section. Needs `terms` and `tasks` annotations so Sidekick can navigate to the Growth page. |
| **SidekickFieldNext** | The input field widget from `@shopify/polaris-internal/experimental` used for the floating Sidekick bar. |
| **Frozen Records** | Immutable value objects used to model guardrail limits and permissions in the data layer. |
| **ANC** | Ads & New Channels team -- owns Google/Meta channel integrations. |

---

## 8. Key Documents & Links

### Must-Read (for Eagle's focus areas)

| Document | URL | What |
|---|---|---|
| Aim Doc / Handbook | https://docs.google.com/document/d/1g6mn6kOSwp0HW3-r2rHsFixfmlOvHcm7pgWJq1z1wI8 | Source of truth; has tabs for scope, tech designs, drift, glossary |
| Vitalik's Sidekick One-Pager | https://docs.google.com/document/d/1CPyXqEhnu3J6nePCXOABgWeu8V11mz180M1d0DaqD6Q | Approaches for Sidekick accessing growth data |
| Sidekick Weekly Plan | https://docs.google.com/spreadsheets/d/1M0fFIzuiae3sEMHk04CiUeuuFfMOQZ4S2MYfnB-sH1s | Sidekick work breakdown and dependencies |
| Sidekick Team Meeting Notes (Feb 10) | https://docs.google.com/document/d/1IHwwjszEFjta_TzMd23C4H_-SiJjabnLKUKqv3z67s4 | Alignment with Matt Koenig on read/write patterns |
| Craig's Admin/Admin-Web Plan | https://docs.google.com/document/d/1lYmcfiZO4QDt1tugMhY8J7Hbf9GHhOubZ7OxweTIK14 | UX pillar roadmap |
| Success Measurement Deck | https://docs.google.com/presentation/d/1LuWm2HBe7wvef1f4pQZSzmMHxRATabXsU92UpPQTytA | How we know if Autopilot is working at launch |
| Floating Sidekick Scope (local) | `tmp-floating-sidekick-scope.md` in workspace root | Detailed scope for the floating Sidekick input bar |

### Reference

| Document | URL | What |
|---|---|---|
| Channel Connector Protocol PR | https://app.graphite.com/github/pr/shop/world/417521 | Protobuf schema definitions |
| Gita's GTX Question Bank | https://docs.google.com/spreadsheets/d/1t0xIrJrzAMGzcclwLJVD3mSfZDpB8k1Vhcfbg_OWXF8 | Eval questions for growth agent |
| GraphQL Alignment Doc | https://docs.google.com/document/d/1FiDt2yEM0p5T4P8_p4cShsw8OyZJnBAsAyzqGpMSRac | API contract alignment |
| Burst Gemini Notes (Recommender) | https://docs.google.com/document/d/1oUhBry2yAhVZyf6EYuiEayHZiwJQlmpkdQ9UAsRT9yg | Notes from recommender team discussion |
| Demo Expectations Doc | https://docs.google.com/document/d/1sShhbeHnCc9_hP45CSkcnrCYYbNpkSR8Nhz-Et6V8Sw | Weekly demo priorities |
| Open Decision (Inline Bar) | https://vault.shopify.io/gsd/decisions/10335 | Vault decision log for floating Sidekick bar |
| Autopilot Prototype | https://autopilot.quick.shopify.io/growth | Interactive UX prototype |
| Sidekick Integration Docs | https://sidekick.docs.shopify.io/integration/ | Official Sidekick integration guide |
| Intents Demo (Burst) | https://drive.google.com/file/d/1argybO05PJVfu3FJmsplQXV0H5XqnEMF/view | Clare Curtis intents demo from burst |
| Sidekick Integration Video (7min) | https://share.descript.com/view/PRNxEIGEmJv | How to integrate with Sidekick |
| Jaime's Sidekick Demo | https://share.descript.com/view/8yVDDUZK5Dy | First interactive Sidekick + Growth demo |
| Vault Project | https://vault.shopify.io/gsd/projects/48856 | Official project page |
| GitHub Board | https://github.com/orgs/Shopify/projects/13660/views/1 | Issue tracking board |
| Burst Info | https://vault.shopify.io/irl/bursts/2885-Growth-Agent-Integrations | Burst logistics and info |
| Crowdsourcing Tool | https://gtx-crowdsourcing.quick.shopify.io/ | Submit growth agent eval questions |
| Sidekick Burst Working Doc | https://docs.google.com/document/d/17OqPvDnoZ0IDJB6WnN-VAgQbTg7LhQ3Az1l1-m1TRCs | Sidekick burst questions and demo capabilities |

---

## 9. Timeline & Milestones

### Vault Milestones (source of truth)

| Date | Milestone | Status |
|---|---|---|
| Jan 16 | Start date | Completed |
| Feb 23 | Build phase transition | OVERDUE — review 65062 awaiting OK1 |
| Mar 2 | Internal release | OVERDUE |
| Apr 15 | **General Availability** | Target |
| Apr 29 | End date / Editions launch | Target |

### Historical Context

| Date | Event |
|---|---|
| Feb 4-6 | Burst week (Toronto, in-person). Mikhail review: "Is this Figma?" |
| Feb 9-13 | Ship burst stack to production; solidify data models |
| End of Feb | "Get Tom more sales" milestone |
| Mar 29 - Apr 4 | Proposed e2e bug bash burst |
| Apr 8 | Editions quiet period begins |
