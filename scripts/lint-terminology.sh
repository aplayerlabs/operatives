#!/usr/bin/env bash
set -euo pipefail

# Terminology lint — catches deprecated terms before they ship.
# Derives from GLOSSARY.md. Run locally or via CI.

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)"
REPO_DIR="$(dirname "$SCRIPT_DIR")"

# Files to check (everything except .git, node_modules, this script, GLOSSARY.md, and lint CI)
FILES=$(find "$REPO_DIR" \
  -type f \( -name "*.md" -o -name "setup" -o -name "*.sh" \) \
  -not -path "*/.git/*" \
  -not -path "*/node_modules/*" \
  -not -name "GLOSSARY.md" \
  -not -name "lint-terminology.sh" \
  -not -name "lint-terminology.yml" \
  | sort)

# Strip the "What we don't say" section from ARCHITECTURE.md before checking.
# That section intentionally references deprecated terms with strikethrough.
ARCH_FILE="$REPO_DIR/ARCHITECTURE.md"
ARCH_CLEAN=$(mktemp)
if [ -f "$ARCH_FILE" ]; then
  sed '/^### What we don.t say/,/^##[^#]/{ /^##[^#]/!d; }' "$ARCH_FILE" > "$ARCH_CLEAN"
  FILES=$(echo "$FILES" | grep -v "ARCHITECTURE.md")
  FILES="$FILES $ARCH_CLEAN"
fi

trap 'rm -f "$ARCH_CLEAN"' EXIT

ERRORS=0
WARNINGS=0

echo ""
echo "  Terminology Lint"
echo "  ================"
echo ""

# --- Deprecated terms (hard failures) ---

check_term() {
  local pattern="$1"
  local label="$2"
  local replacement="$3"

  local matches
  matches=$(grep -rn "$pattern" $FILES 2>/dev/null || true)

  if [ -n "$matches" ]; then
    echo "  FAIL  \"$label\" → use \"$replacement\" instead"
    echo "$matches" | while read -r line; do
      echo "         $line"
    done
    echo ""
    ERRORS=$((ERRORS + 1))
  fi
}

# Product name conflation
check_term "A Player Operatives" "A Player Operatives" "Operatives"
check_term "A Player Loops" "A Player Loops" "Operatives"

# Old repo/package names
check_term "aplayerloops" "aplayerloops" "operatives"
check_term "aplayeroperatives" "aplayeroperatives" "operatives"

# Old state file
check_term "LOOPS\.md" "LOOPS.md" "OPERATIVES.md"

# Old folder
check_term "brains/" "brains/" "operatives/"

# Old skill name (but not inside "operation-design" which contains "operation")
check_term "loop-design" "loop-design" "operation-design"

# --- Word-boundary checks (grep -w) ---

check_word() {
  local pattern="$1"
  local label="$2"
  local replacement="$3"

  local matches
  matches=$(grep -wnE "$pattern" $FILES 2>/dev/null || true)

  if [ -n "$matches" ]; then
    echo "  FAIL  \"$label\" → use \"$replacement\" instead"
    echo "$matches" | while read -r line; do
      echo "         $line"
    done
    echo ""
    ERRORS=$((ERRORS + 1))
  fi
}

# "loop" as domain concept (word boundary, case insensitive)
# Exclude "for loop", "while loop", "event loop" (programming constructs)
LOOP_MATCHES=$(grep -wniE "\bloop(s)?\b" $FILES 2>/dev/null \
  | grep -viE "(for loop|while loop|event loop|run loop|busy loop)" || true)

if [ -n "$LOOP_MATCHES" ]; then
  echo "  FAIL  \"loop/loops\" → use \"operation\" (recurring) or \"mission\" (goal-focused)"
  echo "$LOOP_MATCHES" | while read -r line; do
    echo "         $line"
  done
  echo ""
  ERRORS=$((ERRORS + 1))
fi

# "brain" as unit (word boundary)
BRAIN_MATCHES=$(grep -wniE "\bbrain(s)?\b" $FILES 2>/dev/null || true)

if [ -n "$BRAIN_MATCHES" ]; then
  echo "  FAIL  \"brain/brains\" → use \"operative\" (agent) or \"skill\" (slash command)"
  echo "$BRAIN_MATCHES" | while read -r line; do
    echo "         $line"
  done
  echo ""
  ERRORS=$((ERRORS + 1))
fi

# --- Authority line consistency check ---

echo "  Checking CLAUDE.md authority lines..."

for claude_file in $(find "$REPO_DIR/operatives" -name "CLAUDE.md" | sort); do
  rel=$(echo "$claude_file" | sed "s|$REPO_DIR/||")
  skill_name=$(basename "$(dirname "$claude_file")")

  # Check for the standard authority pattern
  if ! grep -q "operating contract for /$skill_name" "$claude_file" 2>/dev/null; then
    echo "  WARN  $rel — authority line doesn't match template (expected: \"operating contract for /$skill_name\")"
    WARNINGS=$((WARNINGS + 1))
  fi

  if ! grep -q "within Operatives" "$claude_file" 2>/dev/null; then
    echo "  WARN  $rel — authority line missing \"within Operatives\" (may say old product name)"
    WARNINGS=$((WARNINGS + 1))
  fi
done

echo ""

# --- Summary ---

echo "  ---"
if [ "$ERRORS" -eq 0 ] && [ "$WARNINGS" -eq 0 ]; then
  echo "  PASS  All terminology checks passed."
else
  [ "$ERRORS" -gt 0 ] && echo "  ERRORS:   $ERRORS deprecated term(s) found"
  [ "$WARNINGS" -gt 0 ] && echo "  WARNINGS: $WARNINGS authority line issue(s)"
fi
echo ""

exit "$ERRORS"
