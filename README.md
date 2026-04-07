# Operatives

Design autonomous specialists. Produce deployment-ready specs. Run them on any runtime.

Operatives is the agent factory. You bring the business problem. The skills walk you through designing a complete operative — purpose, operations, signals, orientation, values, guardrails. The output is OPERATIVES.md: a portable deployment manifest that any runtime can read.

The spine: *The operative runs the mission. The human chooses what is worth building. Build something significant.*

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

## Where Operatives fits

[A Player Labs](https://aplayerlabs.com) builds the flywheel for agentic businesses. Three stages, one compounding cycle:

```
     BUILD ──→ RUN ──→ LEARN
  (Playbooks) (Operatives) (Debriefs)
       ↑                       │
       └───────────────────────┘
              build better
```

**[Playbooks](https://github.com/aplayerlabs/playbooks)** builds the thing. Problem → plan → design → working app.

**Operatives** runs the thing. Recurring operations that compound. Directed missions that complete. The output is a deployment-ready spec — not code, not a dashboard, a manifest any runtime can read.

**Debriefs** learns from what ran. What did the operatives discover? What patterns emerged? What should change?

Each stage works independently. Together they compound.

## When to use Operatives

You've built something (or you have something running). Now you need:

- Recurring systems that get smarter every cycle
- Autonomous agents with guardrails corporate can trust
- Signal design that tells you if it's working — not vanity metrics
- A portable spec you can deploy to any infrastructure

If you're asking "how do I make this run itself and compound?" — type `/operatives`.

## How it's structured

**One factory. Nine skills. One output: the spec.**

- **Skills** are the nine specialist slash commands. Use them in any order, revisit anytime.
- **OPERATIVES.md** is the deployment manifest. Each skill writes a section. The complete document is everything a runtime needs to instantiate and run an operative.
- **Operations** are recurring compounding cycles. The flywheel. Defined by the Five Jobs.
- **Missions** are goal-focused tasks that complete. Research, audits, investigations.
- The **playfield** is the bounded environment where the operative works.

## The skills

```
/operatives         Start here. Reads your state and tells you what to do next.

Foundation:
/significance       Define your significant purpose — the filter for everything downstream
/throughline        Check if a win or decision points toward your purpose or away

Design:
/operation-design   Design a single operation — the 5 Jobs (output, boundary, signal, close)
/signal             Identify what data matters, design instrumentation, build decision memory

Orientation:
/orient             Build 5-component agent orientation (role, process, heuristics, guardrails, output)
/values             Inject values into the system with enough precision for the machine to honour them

Steering:
/wins               Evaluate which wins to compound and which point the wrong way
```

Type `/update` to get the latest skills.

## Install

```bash
git clone https://github.com/aplayerlabs/operatives.git ~/.claude/skills/operatives
cd ~/.claude/skills/operatives && ./setup
```

Then open Claude Code and type `/operatives`.

## The output: OPERATIVES.md

Every skill writes to one file. When complete, OPERATIVES.md contains:

```
## Significance      ← why this operative exists
## Through Line      ← alignment checks
## Operation Design  ← the recurring cycles, defined to irreducible precision
## Signal            ← what to measure, how to capture, how to compound
## Orientation       ← role, process, heuristics, guardrails, output spec
## Values            ← what the operative optimises for
## Win Selection     ← which results to compound
```

This is the deployment manifest. It defines everything a runtime needs: what the operative does, when it fires, what signal it reads, what guardrails it respects, what it optimises for, and how each cycle feeds the next.

Load it into OpenClaw. Parse it into a Redis queue. Wire it to a cron job. The spec is the interface. The runtime is yours to choose.

## The sequence

These skills are tools, not a pipeline. That said, there's a natural flow:

1. **Start with significance.** Everything traces back to what you're building and why.
2. **Design your operations.** The atomic unit — one recurring job, defined to irreducible precision.
3. **Instrument the signals.** What data lives at the boundary event? How does decision memory compound?
4. **Orient the operative.** The expert leaves the room. The expertise stays.
5. **Inject your values.** The machine can optimise anything. You choose what's worth optimising for.
6. **Select your wins.** The operations are running. Which results do you compound?
7. **Check the through line.** Verify what you're doing traces back to what you're building.

## Architecture

See [ARCHITECTURE.md](ARCHITECTURE.md) for the full taxonomy, how skills connect, and the OPERATIVES.md spec format.

## Update

```
/update
```

Or manually:

```bash
cd ~/.claude/skills/operatives && git pull && ./setup
```

## License

MIT. See [LICENSE](LICENSE). Built by [A Player Labs](https://aplayerlabs.com).
