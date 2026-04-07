# Architecture

How Operatives works under the hood.

## Nomenclature

Clear names, no ambiguity. Every term has one meaning.

| Term | What it is | Example |
|------|-----------|---------|
| **A Player Labs** | The company. Makes all three products. | aplayerlabs.com |
| **Playbooks** | Product #1. Builds software. Linear chain. | `aplayerlabs/playbooks` |
| **Operatives** | Product #2. Runs and steers agentic systems. This repo. | `aplayerlabs/operatives` |
| **Debriefs** | Product #3. Compounds knowledge. | `aplayerlabs/debriefs` |
| **Skill** | A slash command. The unit of interaction. | `/operation-design`, `/signal` |
| **Playfield** | The project folder. Shared concept across all three products. | Your repo, your workspace |
| **Operative** | An autonomous specialist. Deployed into a playfield. | A configured agent with orientation, values, and purpose |
| **Operation** | A recurring compounding cycle. Has the Five Jobs. | Weekly ad creative testing |
| **Mission** | A goal-focused task that completes. | Competitive landscape research |
| **OPERATIVES.md** | The state file. Shared surface between skills. | Lives in the playfield root |

### What we don't say

- ~~A Player Operatives~~ — the product is **Operatives**. The company is **A Player Labs**. Don't conflate them.
- ~~Brain~~ — replaced by **operative** (the agent) or **skill** (the slash command), depending on context.
- ~~Loop~~ — replaced by **operation** (if it recurs) or **mission** (if it completes).

## Overview

Operatives is a set of nine specialist skills, each implemented as a Claude Code slash command. They share state through one file in the playfield — OPERATIVES.md — and collectively help the user design, instrument, orient, and steer operative architecture for agentic systems.

Unlike Playbooks (a linear chain) or Debriefs (a data lifecycle), Operatives is a **toolkit**. The skills can be used in any order, revisited at any time, and combined however the architecture requires.

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

The autonomous agent itself. You deploy it into a playfield. It has orientation (role, process, heuristics, guardrails, output spec). It has values injected. It knows its significant purpose. This is what you "install" and what corporate trusts.

### Playfield

The bounded environment where the operative works. A repo. A workspace. A Slack channel. A database. The operative doesn't roam freely — it operates within a defined playfield. The playfield provides context, constraints, and the surface area for operations and missions.

This is the same concept as the playfield in Playbooks — the project folder structure that skills read from and write to.

### Operation

A recurring compounding cycle. It has the Five Jobs: physical output, boundary event, signal, leading indicator, closing mechanism. Operations spin. Each cycle feeds the next. The compound interest of agentic systems lives here. Cron jobs, flywheels, recurring analysis — these are operations.

### Mission

An autotelic, goal-focused task. It has a defined objective and completion criteria. Auto-research. Competitive analysis. A one-time deep investigation. Missions complete and deliver an outcome. They don't recur — though the findings from a mission might feed an operation.

### How they relate

An operative runs operations AND missions inside a playfield. Operations are the steady-state compounding engine. Missions are the directed strikes. Both happen within the playfield's boundaries.

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
| **Examples** | Weekly ad testing, daily P&L, continuous lead scoring | Competitive landscape research, architecture audit, one-time deep investigation |
| **Designed by** | /operation-design | (future: /mission-design) |

## The state file: OPERATIVES.md

Every skill reads and writes one file in the playfield root: **OPERATIVES.md**.

Each skill owns a section. Sections accumulate as the user designs their operative architecture. Skills add to OPERATIVES.md — they never overwrite other skills' sections.

```
## Significance        ← /significance
## Through Line        ← /throughline
## Operation Design    ← /operation-design
## Signal              ← /signal
## Orientation         ← /orient
## Values              ← /values
## Win Selection       ← /wins
```

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

- Not a software pipeline (that's Playbooks)
- Not a knowledge base (that's Debriefs)
- Not a project management system
- Not a task runner — operations are designed here, not executed. The operative architecture defines what runs, not how it runs
- Not prescriptive about tools — the operations you design here can be implemented with any technology

## The spine

The operative runs the mission. The human chooses what is worth building. Build something significant.
