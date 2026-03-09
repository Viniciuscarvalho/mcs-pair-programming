# Stack-Specific Review Checklists

These checklists extend the universal pair review protocol with stack-specific gates.
Claude loads the appropriate checklist based on the detected project stack.

---

## Swift / iOS

- [ ] No force unwraps (`!`) unless explicitly allowed in CLAUDE.md
- [ ] No retain cycles — weak/unowned references in closures capturing self
- [ ] Concurrency: using Swift Concurrency (async/await) over GCD where possible
- [ ] SwiftUI: views are small, extracted components — no 200+ line views
- [ ] Accessibility: `.accessibilityLabel`, `.accessibilityHint` on interactive elements
- [ ] Previews: SwiftUI previews compile and render correctly
- [ ] No hardcoded strings — use Localizable.strings or String Catalogs
- [ ] App lifecycle: no work in `init()` that should be in `onAppear` or `task`
- [ ] Memory: no large allocations in body recomputations
- [ ] Xcode warnings: zero new warnings introduced

## TypeScript / React

- [ ] No `any` types — use proper typing or `unknown` with narrowing
- [ ] Components under 150 lines — extract sub-components when larger
- [ ] Hooks follow rules-of-hooks (no conditional hooks, proper dependency arrays)
- [ ] No inline styles — use CSS modules, Tailwind, or styled-components per CLAUDE.md
- [ ] Keys in lists are stable and unique (not array index for dynamic lists)
- [ ] Effects have proper cleanup functions
- [ ] No direct DOM manipulation — use refs or state
- [ ] Bundle size: no unnecessarily large imports (use tree-shaking)
- [ ] ESLint / Prettier: zero new violations
- [ ] Error boundaries for component trees that might fail

## Python

- [ ] Type hints on all public functions and methods
- [ ] No bare `except:` — always catch specific exceptions
- [ ] Context managers for file/resource handling (`with` statements)
- [ ] No mutable default arguments (`def f(items=[])` → `def f(items=None)`)
- [ ] Virtual environment / dependency pinning respected
- [ ] Docstrings on public API (Google, NumPy, or Sphinx style per CLAUDE.md)
- [ ] No magic numbers — use named constants
- [ ] Async code: no blocking calls inside async functions
- [ ] Linter (ruff/flake8/pylint): zero new violations
- [ ] Tests: pytest conventions followed, fixtures over setUp/tearDown

## Rust

- [ ] No `unwrap()` in production paths — use `?` operator or proper error handling
- [ ] Clippy: zero new warnings (`cargo clippy -- -D warnings`)
- [ ] Lifetimes are explicit only when necessary — trust elision
- [ ] No unnecessary `clone()` — prefer borrowing
- [ ] Error types implement `Display` and `Error`
- [ ] Unsafe blocks: documented and minimized
- [ ] Cargo.toml: no wildcard version dependencies
- [ ] Documentation: `///` doc comments on public items
- [ ] Tests: `#[cfg(test)]` module present for new logic
- [ ] No panicking in library code

## Go

- [ ] Errors are handled, not discarded (`_ = doSomething()` is suspect)
- [ ] Error wrapping with `fmt.Errorf("context: %w", err)`
- [ ] No exported names without doc comments
- [ ] Context propagation: `context.Context` as first parameter where needed
- [ ] Goroutines: no leaks — proper cancellation via context or done channels
- [ ] No `init()` functions unless absolutely necessary
- [ ] Interfaces are small (1-3 methods) and defined by the consumer
- [ ] `go vet` / `golangci-lint`: zero new issues
- [ ] Table-driven tests preferred
- [ ] No `panic` in library code

## Kotlin / JVM

- [ ] Nullability: no `!!` operator without documented justification
- [ ] Coroutines: proper scope management, no `GlobalScope`
- [ ] Data classes for value objects
- [ ] Sealed classes/interfaces for restricted hierarchies
- [ ] No mutable collections exposed from public API
- [ ] ktlint / detekt: zero new violations
- [ ] Tests: JUnit 5 conventions, descriptive test names
- [ ] No blocking calls on the main/UI thread
- [ ] Dependencies: version catalogs or BOM for consistency
- [ ] Gradle: no deprecated API usage

## Ruby

- [ ] No monkey-patching core classes without documentation
- [ ] Frozen string literals enabled
- [ ] Guard clauses over deep nesting
- [ ] RuboCop: zero new violations
- [ ] Tests: RSpec / Minitest conventions followed
- [ ] No N+1 queries (use `includes` / `eager_load`)
- [ ] Strong parameters in controllers (Rails)
- [ ] Service objects for business logic (not fat models/controllers)
- [ ] No raw SQL without parameterization
- [ ] Proper use of `private` / `protected`

## .NET / C#

- [ ] Nullable reference types enabled and respected
- [ ] `async`/`await` all the way down — no `.Result` or `.Wait()`
- [ ] `IDisposable` resources in `using` statements
- [ ] No `string` concatenation in loops — use `StringBuilder`
- [ ] Dependency injection over static dependencies
- [ ] Analyzers: zero new warnings
- [ ] Unit tests: Arrange-Act-Assert pattern
- [ ] No magic strings — use `nameof()` or constants
- [ ] LINQ: no deferred execution surprises (materialize with `.ToList()`)
- [ ] Proper logging (structured logging with `ILogger`)

---

## Adding a New Stack

If the project uses a stack not listed above:

1. Claude should identify the language/framework.
2. Apply the **universal checklist** from the main skill.
3. Supplement with community best practices for that stack.
4. Suggest the developer adds stack-specific rules to CLAUDE.md.
5. Claude can create a new checklist section during the session and propose adding it to this file.
