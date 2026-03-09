#!/bin/bash
# session-context.sh — SessionStart hook
# Detects project stack, checks for CLAUDE.md, and prints pairing context.

set -euo pipefail

PROJECT_DIR="${PWD}"

# ── Detect stack ──────────────────────────────────────────────────────────────
detect_stack() {
  local stacks=()

  [ -f "$PROJECT_DIR/Package.swift" ] && stacks+=("Swift/iOS")
  [ -f "$PROJECT_DIR/package.json" ] && stacks+=("Node/TypeScript")
  [ -f "$PROJECT_DIR/Cargo.toml" ] && stacks+=("Rust")
  [ -f "$PROJECT_DIR/go.mod" ] && stacks+=("Go")
  [ -f "$PROJECT_DIR/pyproject.toml" ] && stacks+=("Python")
  [ -f "$PROJECT_DIR/requirements.txt" ] && stacks+=("Python")
  [ -f "$PROJECT_DIR/build.gradle" ] && stacks+=("Kotlin/JVM")
  [ -f "$PROJECT_DIR/build.gradle.kts" ] && stacks+=("Kotlin/JVM")
  [ -f "$PROJECT_DIR/pom.xml" ] && stacks+=("Java/Maven")
  [ -f "$PROJECT_DIR/Gemfile" ] && stacks+=("Ruby")
  [ -f "$PROJECT_DIR/composer.json" ] && stacks+=("PHP")
  [ -f "$PROJECT_DIR/pubspec.yaml" ] && stacks+=("Dart/Flutter")

  # .NET detection
  local csproj_count
  csproj_count=$(find "$PROJECT_DIR" -maxdepth 2 -name "*.csproj" -o -name "*.sln" 2>/dev/null | head -1)
  [ -n "$csproj_count" ] && stacks+=(".NET/C#")

  if [ ${#stacks[@]} -eq 0 ]; then
    echo "Unknown"
  elif [ ${#stacks[@]} -eq 1 ]; then
    echo "${stacks[0]}"
  else
    echo "${stacks[*]}" | tr ' ' ' + '
  fi
}

# ── Check CLAUDE.md ──────────────────────────────────────────────────────────
check_claude_md() {
  if [ -f "$PROJECT_DIR/CLAUDE.md" ]; then
    echo "✅ Found (project root)"
  elif [ -f "$PROJECT_DIR/.claude/CLAUDE.md" ]; then
    echo "✅ Found (.claude/)"
  elif [ -f "$PROJECT_DIR/CLAUDE.local.md" ]; then
    echo "✅ Found (CLAUDE.local.md)"
  else
    echo "⚠️  Not found — using stack defaults"
  fi
}

# ── Git context ───────────────────────────────────────────────────────────────
git_context() {
  if git rev-parse --is-inside-work-tree &>/dev/null; then
    local branch
    branch=$(git branch --show-current 2>/dev/null || echo "detached")
    local status
    status=$(git status --porcelain 2>/dev/null | wc -l | tr -d ' ')
    echo "Branch: $branch | Uncommitted changes: $status"
  else
    echo "Not a git repository"
  fi
}

# ── Print context ─────────────────────────────────────────────────────────────
STACK=$(detect_stack)
CLAUDE_STATUS=$(check_claude_md)
GIT_INFO=$(git_context)

cat <<EOF

🤝 Pair Programming — Session Start
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Stack:     $STACK
CLAUDE.md: $CLAUDE_STATUS
Git:       $GIT_INFO
Style:     driver-navigator (use /pair to switch)
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

EOF
