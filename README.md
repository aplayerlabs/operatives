# Operatives

Deploy autonomous specialists that run your operations and execute your missions.

Operatives is a skill pack for [Claude Code](https://docs.anthropic.com/en/docs/claude-code) that helps you design, instrument, and steer the recurring systems that make agentic businesses compound. Define what's significant, design operations with precision, orient the agents that run them, inject your values, and choose which wins to compound.

The spine: *The operative runs the mission. The human chooses what is worth building. Build something significant.*

## Where Operatives fits

[A Player Labs](https://aplayerlabs.com) makes three skill packs. Each one does a different job. Together they form a flywheel:

```
Playbooks → Operatives → Debriefs → Playbooks
   build       run          learn       build better
```

**[Playbooks](https://github.com/aplayerlabs/playbooks)** builds the thing. Problem → plan → design → working app. A linear chain from zero to shipped.

**Operatives** runs the thing. Once the app exists, you need recurring systems that compound — ad testing cycles, lead scoring flywheels, weekly P&L analysis. You also need directed missions — competitive research, architecture audits, deep investigations. Operatives designs both.

**Debriefs** learns from the thing. What did the operatives discover? What patterns emerged? What should change? Debriefs compounds knowledge so the next cycle of Playbooks builds something smarter.

Each product works independently. Together they compound.

## When to use Operatives

You've built something (or you have something running). Now you need to answer:

- What recurring work should this system do every cycle?
- How do I know if it's working?
- What signal should I watch? Is it even the right signal?
- How do I make sure cycle N+1 is better than cycle N?
- Who (or what) runs this, and what are their guardrails?
- What am I optimising for — and is that still the right thing?

If you're asking these questions, type `/operatives`.

## How it's structured

**One toolkit. Nine skills. Two kinds of work.**

- **Skills** are the nine specialist slash commands. Unlike Playbooks (a linear chain), these are tools — use them in any order, revisit anytime.
- **Operations** are recurring compounding cycles. The flywheel. The cron job that gets smarter. Defined by the Five Jobs.
- **Missions** are goal-focused tasks that complete. Research, audits, investigations. Findings feed operations.
- The **playfield** is the project folder where every skill reads from and writes to.

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

## How it works

Every skill operates on the **playfield** — your project folder. Skills share state through one file:

- **OPERATIVES.md** — the operative architecture document. Each skill owns a section. Sections accumulate as you design your system.

```
## Significance      ← written by /significance
## Through Line      ← written by /throughline
## Operation Design  ← written by /operation-design
## Signal            ← written by /signal
## Orientation       ← written by /orient
## Values            ← written by /values
## Win Selection     ← written by /wins
```

OPERATIVES.md is the source of truth for your operative architecture. It's the handoff mechanism between skills and the persistent record of your design decisions.

## The sequence

These skills are tools, not a pipeline. Use them in whatever order your architecture needs. That said, there's a natural flow:

1. **Start with significance.** Everything traces back to what you're building and why it matters. Skip this and the machine compounds in the wrong direction.
2. **Design your operations.** The atomic unit — one recurring job, defined to irreducible precision.
3. **Instrument the signals.** What data lives at the boundary event? How do you capture it? How does decision memory compound?
4. **Orient your agents.** The expert leaves the room. The expertise stays.
5. **Inject your values.** The machine can optimise anything. You choose what's worth optimising for.
6. **Select your wins.** The operations are running. Which results do you compound? Which do you release?
7. **Check the through line.** At any point, verify that what you're doing traces back to what you're building.

## Architecture

See [ARCHITECTURE.md](ARCHITECTURE.md) for the full taxonomy, how skills connect, and the OPERATIVES.md contract.

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
