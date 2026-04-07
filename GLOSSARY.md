# Glossary

Single source of truth for terminology in this repo. All docs, CLAUDE.md files, and scripts derive from this file. If it's not here, don't use it.

## The Company

| Term | Usage |
|------|-------|
| **A Player Labs** | The company. Always "A Player Labs", never abbreviated to "APL" in user-facing text. |

## The Products

Three stages of A Player OS. Each stands alone as a name. Never prefix with "A Player".

| Term | Stage | What it does | Repo |
|------|-------|-------------|------|
| **Playbooks** | Build | Builds software. Linear skill chain. | `aplayerlabs/playbooks` |
| **Operatives** | Run | The agent factory. Designs operatives, produces deployment-ready specs. This repo. | `aplayerlabs/operatives` |
| **Debriefs** | Learn | Compounds knowledge from what ran. | `aplayerlabs/debriefs` |

A Player OS: **Build → Run → Learn → Build better.** Assets sit at the center — the shared state all three stages act on.

## Core Terms

| Term | Definition | Scope |
|------|-----------|-------|
| **Skill** | A slash command. The unit of interaction. Each skill has a SKILL.md (metadata) and CLAUDE.md (operating contract). | All three products |
| **Playfield** | The project folder where skills read from and write to. The bounded environment. | All three products |
| **Assets** | The shared state at the center of A Player OS. Design tokens, operative specs, code, decision history, component libraries — everything that persists between cycles. No stage owns them. All stages shape them. | All three products |
| **Operative** | An autonomous specialist. Deployed into a playfield with orientation, values, and purpose. The thing you design using this skill pack. | Operatives |
| **Operation** | A recurring compounding cycle. Defined by the Five Jobs: physical output, boundary event, signal, leading indicator, closing mechanism. | Operatives |
| **Mission** | An autotelic, goal-focused task that completes. Has objective and completion criteria. Findings feed operations. | Operatives |
| **OPERATIVES.md** | The deployment manifest. The spec. Lives in the playfield root. Each skill owns a section. When complete, contains everything a runtime needs to instantiate and run an operative. | Operatives |
| **The Five Jobs** | The method for defining an operation: (1) name the output, (2) find the boundary, (3) stress test the signal, (4) confirm it's leading, (5) close the cycle. | Operatives |

## Hierarchy

| Level | Term | Description |
|-------|------|-------------|
| Atomic | **Single operation** | One recurring compounding cycle |
| Department | **Operation network** | Multiple connected operations sharing compounding |
| Organism | **Operative network** | The full system — multiple operatives across playfields |

## The Skills in This Repo

| Slash Command | Role |
|---------------|------|
| `/operatives` | Front door router. Reads state, points the way. |
| `/significance` | Define your significant purpose. |
| `/throughline` | Check alignment with purpose. |
| `/operation-design` | Design a single operation (the Five Jobs). |
| `/signal` | Design instrumentation and decision memory. |
| `/orient` | Build 5-component agent orientation. |
| `/values` | Inject values into the system. |
| `/wins` | Evaluate which wins to compound. |
| `/update` | Pull the latest from GitHub. |

## CLAUDE.md Authority Line Template

Every skill's CLAUDE.md starts with this pattern:

```
# CLAUDE.md — /[skill-name]

> **Authority**: This file is the operating contract for /[skill-name].
> It defines how this skill operates within Operatives.
```

## Deprecated Terms

These terms MUST NOT appear in any file (except this glossary and the lint script). The lint script checks for these on every push.

| Deprecated | Replacement | Notes |
|-----------|-------------|-------|
| A Player Operatives | **Operatives** | Product name stands alone |
| A Player Loops | **Operatives** | Old product name |
| aplayerloops | **operatives** | Old repo/package name |
| aplayeroperatives | **operatives** | Intermediate mistake — never shipped |
| loop (as domain concept) | **operation** or **mission** | Operation if it recurs, mission if it completes |
| Loop Architecture | **Operative Architecture** | System-level design |
| loop-design | **operation-design** | Skill name |
| brain (as unit) | **operative** or **skill** | Operative = the agent, skill = the slash command |
| brains (as folder) | **operatives** | Folder name |
| LOOPS.md | **OPERATIVES.md** | State file |

**Exception**: "loop" as a programming construct (for loop, while loop) is fine. The lint script ignores these.
