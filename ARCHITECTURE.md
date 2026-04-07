# Architecture

How Operatives works under the hood.

## Nomenclature

Clear names, no ambiguity. Every term has one meaning. See [GLOSSARY.md](GLOSSARY.md) for the full canonical list.

| Term | What it is |
|------|-----------|
| **A Player Labs** | The company |
| **Operatives** | This product. The agent factory. |
| **Skill** | A slash command. The unit of interaction. |
| **Playfield** | The project folder. The bounded environment. |
| **Operative** | An autonomous specialist. The thing you design and deploy. |
| **Operation** | A recurring compounding cycle. Has the Five Jobs. |
| **Mission** | A goal-focused task that completes. |
| **OPERATIVES.md** | The deployment manifest. The spec. |

### What we don't say

- ~~A Player Operatives~~ — the product is **Operatives**. The company is **A Player Labs**.
- ~~Brain~~ — replaced by **operative** (the agent) or **skill** (the slash command).
- ~~Loop~~ — replaced by **operation** (if it recurs) or **mission** (if it completes).

## Overview

Operatives is an agent factory. Nine specialist skills, each a Claude Code slash command, collectively walk the user through designing a complete autonomous specialist. The output is OPERATIVES.md — a portable, runtime-agnostic deployment manifest.

The skills are the design tool. The spec is the product. The runtime is the client's choice.

```
RAW MATERIALS          FACTORY                    DEPLOYED OPERATIVE
(business problem) →   (skill pack designs it) →  (spec runs on any runtime)
                       
                       /significance
                       /operation-design
                       /signal                →   OPERATIVES.md
                       /orient                    (the deployment manifest)
                       /values                         │
                                              ┌────────┼────────┐
                                              ▼        ▼        ▼
                                           OpenClaw  Redis    Cron
                                           (client A) (client B) (client C)
```

Operatives is the **run** stage of the [A Player Labs](https://aplayerlabs.com) flywheel: Playbooks builds, Operatives runs, Debriefs learns, then you build better. Unlike Playbooks (a linear chain) or Debriefs (a data lifecycle), Operatives is a **toolkit** — skills can be used in any order, revisited at any time, and combined however the architecture requires.

```
/operatives (router)
   │
   ├── /significance    Foundation — what you're building and why
   ├── /throughline      Alignment — does this point toward purpose?
   │
   ├── /operation-design Design — the atomic operation, defined precisely
   ├── /signal           Data — what to measure, how to capture, how to compound
   │
   ├── /orient           Agents — the 5-component orientation
   ├── /values           Human layer — what's worth optimising for
   │
   └── /wins             Steering — which results to compound
```

## The Operative Taxonomy

Four levels. Each has a precise name.

### Operative

The autonomous specialist itself. Deployed into a playfield with orientation, values, and significant purpose. This is what the factory produces. This is what corporate installs with confidence — because every dimension is defined, stress-tested, and documented in the spec.

### Playfield

The bounded environment where the operative works. A repo. A workspace. A Slack channel. A database. The operative doesn't roam freely — it operates within a defined playfield. Constraints are features. Boundaries create focus.

This is the same concept as the playfield in Playbooks — the project folder structure that skills read from and write to.

### Operation

A recurring compounding cycle. It has the Five Jobs: physical output, boundary event, signal, leading indicator, closing mechanism. Operations spin. Each cycle feeds the next. The compound interest of agentic systems lives here.

### Mission

An autotelic, goal-focused task. It has a defined objective and completion criteria. Missions complete and deliver an outcome. They don't recur — though findings from a mission might feed an operation.

### How they relate

An operative runs operations AND missions inside a playfield. Operations are the steady-state compounding engine. Missions are the directed strikes.

```
┌─────────────────────────────────────┐
│           PLAYFIELD (repo)          │
│                                     │
│   ┌─── OPERATIVE ───┐              │
│   │                  │              │
│   │  Operations:     │              │
│   │  ○ → ○ → ○ → ○  │  (cycles)   │
│   │  ○ → ○ → ○ → ○  │              │
│   │                  │              │
│   │  Missions:       │              │
│   │  ● ──────→ ✓    │  (complete)  │
│   │  ● ──────→ ✓    │              │
│   └──────────────────┘              │
└─────────────────────────────────────┘
```

| | Operation | Mission |
|---|-----------|---------|
| **Nature** | Recurring cycle | Goal-focused task |
| **Ends when** | Never — it cycles | Goal is achieved |
| **Defined by** | The Five Jobs | Objective + completion criteria |
| **Compounds via** | Closing mechanism (cycle N → N+1) | Findings feed operations |
| **Examples** | Weekly ad testing, daily P&L, continuous lead scoring | Competitive landscape research, architecture audit, deep investigation |
| **Designed by** | /operation-design | (future: /mission-design) |

## The spec: OPERATIVES.md

OPERATIVES.md is the deployment manifest. Each skill owns a section. When all sections are complete, the document contains everything a runtime needs to instantiate and run an operative.

```
## Significance        ← why this operative exists
## Through Line        ← alignment checks
## Operation Design    ← the recurring cycles, defined to irreducible precision
## Signal              ← what to measure, how to capture, how to compound
## Orientation         ← role, process, heuristics, guardrails, output spec
## Values              ← what the operative optimises for
## Win Selection       ← which results to compound
```

### What the spec gives a runtime

A runtime that reads OPERATIVES.md knows:

| Spec Section | Runtime gets |
|-------------|-------------|
| Significance | The operative's purpose — what it's optimising toward |
| Operation Design | What to execute, when to fire (cadence), boundary conditions |
| Signal | What to measure, how to evaluate each cycle, contamination guards |
| Orientation | Role definition, heuristics, guardrails, output format |
| Values | Decision criteria — what to optimise for when there's a choice |
| Win Selection | Which results to compound, which to release |

The spec is portable. Load it into OpenClaw, parse it into a Redis queue, wire it to a cron — the runtime is the client's choice. The spec is the interface.

### Ownership rules

- Each skill writes ONLY to its own section
- No skill deletes or modifies another skill's section
- The /operatives router reads everything, writes nothing
- /update operates on the installation directory, never on OPERATIVES.md

### Section structure

Each section follows a consistent pattern:

```markdown
## [Section Name]

### [Item Name]
**Key field:** value
**Key field:** value

#### Sub-section
- Detail
- Detail
```

The specific fields vary by skill — each skill's CLAUDE.md defines its exact contract.

## How skills connect

### Information flow

Skills reference each other's sections but don't require them:

| Skill | Reads from | Writes to |
|-------|-----------|-----------|
| /significance | — | ## Significance |
| /throughline | ## Significance (required) | ## Through Line |
| /operation-design | ## Significance (optional) | ## Operation Design |
| /signal | ## Operation Design (recommended) | ## Signal |
| /orient | ## Operation Design, ## Signal (optional) | ## Orientation |
| /values | ## Significance, ## Orientation (optional) | ## Values |
| /wins | ## Significance, ## Values, ## Operation Design (optional) | ## Win Selection |

### Dependency model

**Hard dependencies** (skill refuses to proceed without):
- /throughline requires ## Significance — can't check alignment without a purpose
- /signal recommends ## Operation Design — needs a boundary event to instrument

**Soft dependencies** (skill works without but produces better output with):
- /operation-design benefits from ## Significance for alignment context
- /orient benefits from ## Operation Design and ## Signal for agent context
- /values benefits from ## Significance and ## Orientation for injection context
- /wins benefits from ## Significance, ## Values, and ## Operation Design for full evaluation

**No dependencies:**
- /significance stands alone — it creates the foundation
- /operatives reads everything, requires nothing
- /update operates independently of project state

## Skill design patterns

### Session start protocol (every skill)

1. Check for OPERATIVES.md (create if missing)
2. Read own section (offer refine/restart/add if populated)
3. Read dependency sections for context
4. Orient the user (one sentence state, one sentence next step)

### Re-entry protocol (every skill)

When a skill's section is already populated:
1. Acknowledge the existing work
2. Offer: **refine** (iterate), **restart** (clear and redo), **add** (new item), or **skip**
3. Default to refine — never silently overwrite

### Auto-wrap trigger (long-session skills)

When context window runs low:
1. Save all work to OPERATIVES.md
2. Note where the session stopped
3. Generate continuation prompt

## The hierarchy

Operatives implements a fractal model — the same structure at every level:

### Single operation (atomic unit)
Defined by five jobs:
1. Name the physical output (one noun)
2. Find the boundary event (where one cycle ends)
3. Stress test the signal (contamination check)
4. Confirm it's leading, not lagging
5. Close the cycle (mechanism for cycle N → cycle N+1)

### Operation network (department level)
Multiple single operations, each spinning independently, sharing compounding (not just data) through designed injection points. Defined via /operation-design DECOMPOSE mode.

### Operative network (organism level)
The business as the largest operative — multiple departments, multiple cadences, multiple playfields, all contained within the single organism turning toward its significant purpose.

The same design constraints apply at every level. The human's role changes with the altitude.

## Key concepts

### The spec is the product
The skills are the design tool. OPERATIVES.md is the product. A complete spec contains everything a runtime needs — purpose, operations, signals, orientation, values, guardrails. Design once, deploy anywhere.

### Information asymmetry compounds
The firms that win have always had better signal. In the agentic age, that asymmetry makes your operations get smarter faster than your competitors' operations. The gap compounds.

### Decision memory (stigmergy)
Each cycle's verdict, captured correctly, makes the next hypothesis categorically better. The accumulated decision memory — thousands of cycles of hypothesis, experiment, verdict — is the moat no competitor can fast-follow.

### Values are system inputs
A value that isn't injected into a decision point doesn't exist in the system's behavior. Values must be present at the moment of choice, not in a document on a shelf.

### Win selection is steering
In a recursive system, you steer by choosing which wins to compound. Every selection is a vote for a direction. The machine accelerates whatever you select.

### Playfields bound the work
An operative without a playfield is an agent without a job site. The playfield defines what's in scope — which files, which systems, which data. Constraints are features. Boundaries create focus.

## What this is not

- Not a runtime — this is the factory that produces the spec. The runtime is yours to choose.
- Not a software pipeline (that's Playbooks)
- Not a knowledge base (that's Debriefs)
- Not a project management system
- Not prescriptive about infrastructure — the specs you produce here can run on any stack

## The spine

The operative runs the mission. The human chooses what is worth building. Build something significant.
