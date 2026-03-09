# /review — Pair Review Checklist

Run the full pair review checklist against the current changes.

## Behavior

When invoked:

1. **Identify changed files** — use `git diff --name-only` (staged + unstaged) to find what changed.
2. **Detect the stack** — from the changed files' extensions and project markers.
3. **Load CLAUDE.md** — read project conventions.
4. **Run the universal checklist** (10 items) against the diff.
5. **Run the stack-specific checklist** for the detected language.
6. **Run CLAUDE.md-specific checks** — any custom rules defined in the project.
7. **Report findings** using the signal system:
   - 🟢 **Pass** — item is satisfied
   - 🟡 **Suggestion** — optional improvement
   - 🔴 **Issue** — must be fixed before commit
   - ⚡ **CLAUDE.md** — convention violation

## Output Format

```
🔍 Pair Review — [N files changed]

Universal:
  🟢 Naming: consistent with project conventions
  🟢 Error handling: all errors handled
  🔴 Edge case: `processItems` doesn't handle empty array
  🟡 Complexity: `calculateTotal` could extract tax logic

Stack (Swift/iOS):
  🟢 No force unwraps
  🔴 Retain cycle: closure in `fetchData` captures self strongly
  🟢 Accessibility labels present

CLAUDE.md:
  ⚡ Line 23: uses `if let` but CLAUDE.md requires `guard let` for early returns
  🟢 Architecture: follows MVVM pattern

Result: 2 issues to fix, 1 suggestion
```

## Important

- The review should be thorough but concise — one line per item.
- Only flag items relevant to the actual changes, not the entire codebase.
- After listing issues, offer to help fix them.
