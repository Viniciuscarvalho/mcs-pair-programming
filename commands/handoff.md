# /handoff — Session Handoff Summary

Generate a structured summary of the current pairing session for continuity.

## Behavior

When invoked:

1. **Review the session** — analyze the conversation history for:
   - Tasks completed
   - Decisions made (architectural, convention, tooling)
   - Open items / TODOs
   - Bugs or issues discovered
   - Any CLAUDE.md updates that should be made

2. **Generate the handoff document** in this format:

```markdown
## Pair Session Summary

**Date:** [today's date]
**Stack:** [detected stack]
**Style:** [pairing style used]
**Duration:** [approximate based on conversation length]

### Completed
- [clear description of each completed item]

### Decisions Made
- [decision]: [brief reasoning]

### Open Items
- [ ] [item with enough context for the next session to pick up]

### Issues Discovered
- [bug or concern with file/line reference if applicable]

### Suggested CLAUDE.md Updates
- [any new conventions or rules that emerged]
```

3. **Offer to save** — ask if the developer wants to:
   - Save to `.claude/handoffs/` for future reference
   - Copy to clipboard
   - Just display in chat

## Important

- Keep descriptions actionable — the next session (or a different developer) should understand each item without extra context.
- Reference specific files and line numbers where relevant.
- If no CLAUDE.md updates are needed, omit that section.
