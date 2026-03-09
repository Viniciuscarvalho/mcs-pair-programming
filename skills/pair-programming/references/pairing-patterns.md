# Pairing Patterns Reference

Detailed workflows and decision trees for each pairing style.

---

## Driver-Navigator Patterns

### Pattern: Bug Hunt
```
Developer: "There's a bug in the payment flow"
Navigator (Claude):
  1. Ask: "What's the expected vs actual behavior?"
  2. Suggest: "Let's trace the data flow from the entry point"
  3. Watch: as developer navigates code, flag suspicious patterns
  4. Note: "That guard clause on line 42 doesn't handle the empty array case"
  5. Verify: after fix, suggest edge cases to test
```

### Pattern: Feature Build
```
Developer: "I need to add a caching layer"
Navigator (Claude):
  1. Clarify: "What's the cache invalidation strategy?"
  2. Reference: check CLAUDE.md for preferred caching patterns
  3. Plan: outline the approach before any code is written
  4. Watch: flag deviations from the plan, suggest tests
  5. Review: run the pair review checklist before committing
```

### Pattern: Refactor
```
Developer: "This class is too complex, needs refactoring"
Navigator (Claude):
  1. Analyze: identify responsibilities, coupling, cohesion
  2. Propose: suggest extraction candidates (one at a time)
  3. Guard: ensure tests pass after each extraction
  4. Flag: if refactor scope grows, suggest splitting into separate PRs
```

---

## Ping-Pong Patterns

### Pattern: TDD Ping-Pong
```
Turn 1 (Developer): writes a failing test
Turn 2 (Claude): writes minimal implementation to pass it
Turn 3 (Developer): writes next failing test
Turn 4 (Claude): extends implementation
... repeat until feature is complete
Turn N (Claude): suggests refactoring opportunities
```

### Pattern: API Ping-Pong
```
Turn 1 (Developer): defines the API contract / interface
Turn 2 (Claude): implements the interface
Turn 3 (Developer): writes integration test
Turn 4 (Claude): fixes any failures, adds edge case handling
```

### Rules:
- Each turn should be < 20 lines of code
- Claude explains reasoning before writing
- If implementation requires > 20 lines, break into sub-turns
- Developer can reject Claude's implementation and rewrite

---

## Mob Patterns

### Pattern: Design Session
```
Both contribute to architecture decisions:
  1. Claude proposes initial structure
  2. Developer modifies based on project context
  3. Claude refines based on CLAUDE.md conventions
  4. Both agree on final approach
  5. Implementation alternates organically
```

### Pattern: Spike
```
Exploring unfamiliar territory together:
  1. Define: what question are we answering?
  2. Timebox: agree on max time (suggest 30-60 min)
  3. Explore: both write throwaway code to learn
  4. Synthesize: decide what approach to productionize
  5. Discard: spike code is deleted, clean implementation follows
```

---

## Switching Styles — Decision Guide

| Situation | Recommended Style |
|-----------|-------------------|
| Bug investigation | Driver-Navigator |
| New feature with tests | Ping-Pong |
| Complex refactoring | Driver-Navigator |
| Learning new API/library | Mob |
| Performance optimization | Driver-Navigator |
| Writing boilerplate | Mob (Claude drives) |
| Architecture decisions | Mob |
| Spike / prototype | Mob |
| Code review | Driver-Navigator |
| Writing tests for existing code | Ping-Pong |
