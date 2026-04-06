# Architecture

How A Player Loops works under the hood.

## Overview

A Player Loops is a set of specialist AI brains, each implemented as a Claude Code skill (slash command). They share state through one file in the project directory — LOOPS.md — and collectively help the user design, instrument, orient, and steer loop architecture for agentic systems.

Unlike A Player Brains (a linear pipeline) or A Player Intel (a data lifecycle), A Player Loops is a **toolkit**. The brains can be used in any order, revisited at any time, and combined however the architecture requires.

```
/loops (router)
   │
   ├── /significance    Foundation — what you're building and why
   ├── /throughline      Alignment — does this point toward purpose?
   │
   ├── /loop-design     Design — the atomic loop, defined precisely
   ├── /signal           Data — what to measure, how to capture, how to compound
   │
   ├── /orient           Agents — the 5-component orientation
   ├── /values           Human layer — what's worth optimising for
   │
   └── /wins             Operation — which results to compound
```

## The state file: LOOPS.md

Every brain reads and writes one file in the project root: **LOOPS.md**.

Each brain owns a section. Sections accumulate as the user designs their loop architecture. Brains add to LOOPS.md — they never overwrite other brains' sections.

```
## Significance        ← /significance
## Through Line        ← /throughline
## Loop Design         ← /loop-design
## Signal              ← /signal
## Orientation         ← /orient
## Values              ← /values
## Win Selection       ← /wins
```

### Ownership rules

- Each brain writes ONLY to its own section
- No brain deletes or modifies another brain's section
- The /loops router reads everything, writes nothing
- /update operates on the installation directory, never on LOOPS.md

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

The specific fields vary by brain — each brain's CLAUDE.md defines its exact contract.

## How brains connect

### Information flow

Brains reference each other's sections but don't require them:

| Brain | Reads from | Writes to |
|-------|-----------|-----------|
| /significance | — | ## Significance |
| /throughline | ## Significance (required) | ## Through Line |
| /loop-design | ## Significance (optional) | ## Loop Design |
| /signal | ## Loop Design (recommended) | ## Signal |
| /orient | ## Loop Design, ## Signal (optional) | ## Orientation |
| /values | ## Significance, ## Orientation (optional) | ## Values |
| /wins | ## Significance, ## Values, ## Loop Design (optional) | ## Win Selection |

### Dependency model

**Hard dependencies** (brain refuses to proceed without):
- /throughline requires ## Significance — can't check alignment without a purpose
- /signal recommends ## Loop Design — needs a boundary event to instrument

**Soft dependencies** (brain works without but produces better output with):
- /loop-design benefits from ## Significance for alignment context
- /orient benefits from ## Loop Design and ## Signal for agent context
- /values benefits from ## Significance and ## Orientation for injection context
- /wins benefits from ## Significance, ## Values, and ## Loop Design for full evaluation

**No dependencies:**
- /significance stands alone — it creates the foundation
- /loops reads everything, requires nothing
- /update operates independently of project state

## Brain design patterns

### Session start protocol (every brain)

1. Check for LOOPS.md (create if missing)
2. Read own section (offer refine/restart/add if populated)
3. Read dependency sections for context
4. Orient the user (one sentence state, one sentence next step)

### Re-entry protocol (every brain)

When a brain's section is already populated:
1. Acknowledge the existing work
2. Offer: **refine** (iterate), **restart** (clear and redo), **add** (new item), or **skip**
3. Default to refine — never silently overwrite

### Auto-wrap trigger (long-session brains)

When context window runs low:
1. Save all work to LOOPS.md
2. Note where the session stopped
3. Generate continuation prompt

## The loop hierarchy

A Player Loops implements a fractal model — the same structure at every level:

### Single loop (atomic unit)
Defined by five jobs:
1. Name the physical output (one noun)
2. Find the boundary event (where one cycle ends)
3. Stress test the signal (contamination check)
4. Confirm it's leading, not lagging
5. Close the loop (mechanism for cycle N → cycle N+1)

### Loop of loops (department level)
Multiple single loops, each spinning independently, sharing compounding (not just data) through designed injection points. Defined via /loop-design DECOMPOSE mode.

### Loop of loop of loops (organism level)
The business as the largest loop — multiple departments, multiple cadences, all contained within the single organism turning toward its significant purpose.

The same design constraints apply at every level. The human's role changes with the altitude.

## Key concepts

### Information asymmetry compounds
The firms that win have always had better signal. In the agentic age, that asymmetry makes your loops get smarter faster than your competitors' loops. The gap compounds.

### Decision memory (stigmergy)
Each cycle's verdict, captured correctly, makes the next hypothesis categorically better. The accumulated decision memory — thousands of cycles of hypothesis, experiment, verdict — is the moat no competitor can fast-follow.

### Values are system inputs
A value that isn't injected into a decision point doesn't exist in the system's behavior. Values must be present at the moment of choice, not in a document on a shelf.

### Win selection is steering
In a recursive system, you steer by choosing which wins to compound. Every selection is a vote for a direction. The machine accelerates whatever you select.

## What this is not

- Not a software pipeline (that's A Player Brains)
- Not a knowledge base (that's A Player Intel)
- Not a project management system
- Not an automation framework — this is the thinking and design layer, not the implementation layer
- Not prescriptive about tools — the loops you design here can be implemented with any technology

## The spine

The machine runs the loop. The human chooses what is worth building. Build something significant.
