#!/bin/bash
# pair-review-gate.sh — UserPromptSubmit hook
# When the user's prompt mentions committing, pushing, or finishing,
# reminds Claude to run the pair review checklist first.

set -euo pipefail

USER_PROMPT="${CLAUDE_USER_PROMPT:-}"

# Check if the prompt suggests the user wants to commit/push/finish
if echo "$USER_PROMPT" | grep -qiE '(commit|push|merge|pr |pull request|finish|done|ship it|lgtm|ready to)'; then
  cat <<'EOF'

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
🔍 PAIR REVIEW GATE
Before proceeding, run the pair review checklist:
1. CLAUDE.md compliance
2. Naming consistency
3. Edge cases covered
4. Tests passing
5. No regressions

Use /review for the full checklist.
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

EOF
fi
