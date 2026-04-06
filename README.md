# A Player Loops

Compound your thinking with loop architecture for agentic systems.

A Player Loops is a skill pack for [Claude Code](https://docs.anthropic.com/en/docs/claude-code) that helps you design, instrument, and steer recursive loops — the building blocks of any agentic flywheel. Define what's significant, design loops with precision, orient agents, inject values, and choose which wins to compound.

The spine: *The machine runs the loop. The human chooses what is worth building. Build something significant.*

## Who this is for

Business leaders and system designers building agentic systems — anyone who needs a clear mental model of how humans work on top of agentic flywheels. You know the tools exist. You need to know where to stand, what to do with your hands, and how to know if it's working.

## The brains

```
/loops              Start here. Reads your state and tells you what to do next.

Foundation:
/significance       Define your significant purpose — the filter for everything downstream
/throughline        Check if a win or decision points toward your purpose or away

Design:
/loop-design        Design a single loop — the 5 Jobs (output, boundary, signal, close)
/signal             Identify what data matters, design instrumentation, build decision memory

Orientation:
/orient             Build 5-component agent orientation (role, process, heuristics, guardrails, output)
/values             Inject values into the system with enough precision for the machine to honour them

Operation:
/wins               Evaluate which wins to compound and which point the wrong way
```

Type `/update` to get the latest brains.

## Install

```bash
git clone https://github.com/aplayerlabs/aplayerloops.git ~/.claude/skills/aplayerloops
cd ~/.claude/skills/aplayerloops && ./setup
```

Then open Claude Code and type `/loops`.

## How it works

Every brain reads and writes one file in your project:

- **LOOPS.md** — the loop architecture document. Each brain owns a section. Sections accumulate as you design your system.

```
## Significance      ← written by /significance
## Through Line      ← written by /throughline
## Loop Design       ← written by /loop-design
## Signal            ← written by /signal
## Orientation       ← written by /orient
## Values            ← written by /values
## Win Selection     ← written by /wins
```

LOOPS.md is the source of truth for your loop architecture. It's the handoff mechanism between brains and the persistent record of your design decisions.

## The sequence

These brains are tools, not a pipeline. Use them in whatever order your architecture needs. That said, there's a natural flow:

1. **Start with significance.** Everything traces back to what you're building and why it matters. Skip this and the machine compounds in the wrong direction.
2. **Design your loops.** The atomic unit — one recursive job, defined to irreducible precision.
3. **Instrument the signals.** What data lives at the boundary event? How do you capture it? How does decision memory compound?
4. **Orient your agents.** The expert leaves the room. The expertise stays.
5. **Inject your values.** The machine can optimise anything. You choose what's worth optimising for.
6. **Select your wins.** The loops are running. Which results do you compound? Which do you release?
7. **Check the through line.** At any point, verify that what you're doing traces back to what you're building.

## Three skill packs, three domains

- **[A Player Brains](https://github.com/aplayerlabs/aplayerbrains)** builds software (brain chain from problem to deployed app)
- **[A Player Intel](https://github.com/aplayerlabs/aplayerintel)** compounds knowledge (save, compile, query a wiki)
- **A Player Loops** compounds thinking (loop architecture for agentic systems)

Same install pattern, same skill structure, different domains.

## Architecture

See [ARCHITECTURE.md](ARCHITECTURE.md) for how the brains connect and the LOOPS.md contract.

## Update

```
/update
```

Or manually:

```bash
cd ~/.claude/skills/aplayerloops && git pull && ./setup
```

## License

MIT. See [LICENSE](LICENSE). Built by [A Player Labs](https://aplayerlabs.com).
