# Catalog

Everything in this kit at a glance. Open the file for full details.

---

## Agents (`agents/`)

Subagents are launched via the `Task` / `Agent` tool with `subagent_type: <name>`. Use when you want isolated context, a different model, or parallel execution.

| Agent | Purpose |
|---|---|
| `ceo` | Strategic orchestrator. Breaks ambiguous multi-domain objectives into delegated tasks across the other agents. |
| `planner` | Decomposes features into milestones, slices, and tasks. Writes slice specs to `.claude/specs/`. |
| `architect` | System design, scalability decisions, technology selection. |
| `tdd-guide` | Enforces write-tests-first methodology. Targets 80%+ coverage. |
| `code-reviewer` | Quality, maintainability, idiomatic patterns. Run immediately after writing code. |
| `security-reviewer` | OWASP, auth, RLS, payments, secret-handling, injection vectors. Pair with `code-reviewer` for sensitive surfaces. |
| `build-error-resolver` | Minimal-diff fixes for TypeScript/build errors. No architectural rewrites. |
| `e2e-runner` | Playwright test generation, run, artifact capture, flake quarantine. |
| `refactor-cleaner` | Dead-code removal via knip, ts-prune, depcheck. Safe consolidation. |
| `doc-updater` | Keeps READMEs and codemaps in sync. Runs `/update-codemaps` + `/update-docs`. |

---

## Slash Commands (`commands/`)

Type `/<name>` in Claude Code. Most commands are designed to be invoked at predictable moments in the dev loop.

### Daily core

| Command | Purpose |
|---|---|
| `/init` | Open a session — read project context, recent commits, current slice. Greet with state and wait for direction. |
| `/plan` | Restate requirements, decompose into slices, ask for CONFIRM before any code change. |
| `/tdd` | TDD cycle: failing test → minimal impl → refactor → coverage check. |
| `/cap` | **The ship workflow.** Lint, types, tests, format, build, env sync, optional CodeRabbit, conventional commit, push, ship-verify. |
| `/qa` | Browser-based QA via Codex CLI. Walks the actual user-facing behavior end-to-end. |
| `/code-review` | Quality + maintainability review of uncommitted changes. |
| `/verify` | Build + types + lint + tests audit. |
| `/build-fix` | Hands off to `build-error-resolver` for minimal-diff fixes. |

### Status & state

| Command | Purpose |
|---|---|
| `/dashboard` | One-shot status across all known projects (git, CI, Vercel). Facts only, no recommendations. |
| `/morning-briefing` | Daily cross-project state summary with "what should I work on today?" suggestions. |
| `/health` | Sanity check the Claude Code setup itself — hooks, CLIs, MCPs, scripts. |
| `/stats` | Telemetry stats — sessions, commands fired, skills triggered. |
| `/decisions` | Search/add/browse the cross-project decisions index. |
| `/digest` | Weekly closed-loop learning digest. Promotes patterns, rewrites skills. |

### Refactor & polish

| Command | Purpose |
|---|---|
| `/refactor-clean` | Dead-code sweep. Delegates to `refactor-cleaner`. |
| `/test-coverage` | Coverage report. |
| `/update-codemaps` | Sync `docs/CODEMAPS/*`. |
| `/update-docs` | Sync READMEs and docs. |
| `/checkpoint` | Named checkpoints + comparison. |
| `/design-qa` | Visual + a11y + perf gate (Playwright + axe-core + Lighthouse). |

### Orchestration

| Command | Purpose |
|---|---|
| `/orchestrate` | Sequential agent workflow (feature / bugfix / refactor / security). |
| `/multi-plan` | Plan with multiple models in parallel, no code changes. |
| `/multi-execute` | Execute a multi-model implementation plan (Claude is sole file writer). |
| `/loop-start` | Start a managed autonomous loop with safety defaults. |

### Caveman compression

| Command | Purpose |
|---|---|
| `/caveman-commit` | Terse ≤50-char conventional commit from staged diff. |
| `/caveman-compress` | Compress a verbose file (CLAUDE.md, MEMORY.md, docs) without losing meaning. |
| `/caveman-stats` | Token-savings stats. |

### Evals & evolution

| Command | Purpose |
|---|---|
| `/eval` | Run the eval harness. |
| `/quality-gate` | ECC quality pipeline for a file or project scope. |
| `/harness-audit` | Audit the Claude Code config itself. Returns prioritized scorecard. |
| `/learn` | Extract reusable patterns mid-session. |
| `/evolve` | Suggest or generate evolved skills/rules/agents. |
| `/evolve-skills` | Measured, git-backed mutation loop against frozen eval set. |
| `/prune` | Delete stale pending instincts. |

### Setup

| Command | Purpose |
|---|---|
| `/onboard-project` | Audit project against the canonical template, scaffold missing pieces. |
| `/setup-pm` | Package manager config. |
| `/go` | One-word affirmative — execute the latest proposal in the current session. |

---

## Skills (`skills/`)

Skills auto-activate when their trigger phrases appear, or invoke explicitly via the `Skill` tool. Each is a directory with `SKILL.md` + supporting references.

### Engineering & safety

| Skill | Trigger |
|---|---|
| `safe-feature-slice` | Tier-1 work: money, auth, RLS, webhooks, state transitions. Auto-activates on those keywords. |
| `tdd-workflow` | Writing new features, fixing bugs, refactoring. Tests first, 80%+ coverage. |
| `security-review` | Adding auth, handling user input, secrets, API endpoints, payments. |
| `coding-standards` | TS/JS/React/Node defaults. |
| `backend-patterns` | API design, database optimization, server-side patterns. |
| `frontend-patterns` | React, Next.js, state management, performance. |
| `database-migrations` | Schema changes, data migrations, zero-downtime patterns. |
| `deployment-patterns` | CI/CD, Docker, health checks, rollback strategies. |
| `clerk` | Clerk auth, user/org/session mgmt, instance config. |
| `cost-aware-llm-pipeline` | Model routing, budget tracking, retry logic, prompt caching. |
| `agent-architecture-audit` | Diagnostic for agent/LLM apps — 12-layer audit. |
| `codebase-onboarding` | Analyze unfamiliar codebase, generate onboarding guide. |
| `continuous-learning` | Auto-extract patterns from sessions, save as learned skills. |
| `eval-harness` | Set up + run evals on critical changes. |
| `verification-loop` | Closed-loop verification for sensitive work. |
| `strategic-compact` | Manual compaction nudges at logical task boundaries. |

### Design & craft

| Skill | Trigger |
|---|---|
| `impeccable` | Frontend craft — design, redesign, critique, polish UI. Backed by ui-ux-pro-max CSV references. |

### Marketing & GTM

| Skill | Trigger |
|---|---|
| `product-marketing` | Root context skill — creates `.agents/product-marketing.md` that other marketing skills reference. |
| `cold-email` | B2B cold outreach + follow-up sequences. |
| `cro` | Conversion rate optimization for landing/pricing/forms. |
| `pricing` | Packaging, freemium, willingness-to-pay, tier design. |
| `launch` | Product Hunt, beta, GTM playbook. |
| `onboarding` | Post-signup activation, first-run experience, time-to-value. |

### Meta

| Skill | Trigger |
|---|---|
| `catch-up` | Resume after time away — read recent commits + open work + context. |
| `project-guidelines-example` | Template for per-project guidelines. |
| `learned/` | Destination for `/learn` and `/evolve-skills`. Empty on fresh install. |

---

## Rules (`rules/`)

Always-on guidelines. Modular, internalized — not recited.

| File | Topic |
|---|---|
| `security.md` | Secret handling, input validation, OWASP defaults. |
| `coding-style.md` | Immutability, file organization, error handling. |
| `testing.md` | 80%+ coverage, TDD workflow, test types. |
| `git-workflow.md` | Commit message format, PR workflow, hard rules. |
| `agents.md` | When to use agents vs skills vs commands. |
| `patterns.md` | API response format, hooks pattern, repository pattern. |
| `performance.md` | Model selection, context management, ultrathink. |
| `performance-audit.md` | Performance audit master prompt — 7-section sweep. |
| `hooks.md` | Hook types, current hooks reference. |

---

## Hooks (`hooks/` + `scripts/hooks/`)

Wired in `hooks/hooks.json`. After install, fires automatically.

| Event | Script | Effect |
|---|---|---|
| SessionStart | `session-start.js` | Load previous context, detect package manager. |
| PreToolUse (Edit/Write) | `suggest-compact.js` | Suggest manual compaction at logical intervals. |
| PreToolUse (Edit/Write) | `scope-check.js` | Warn when edits stray outside current slice spec scope. |
| PreCompact | `pre-compact.js` | Save state before context compaction. |
| Stop | `taste-lint.js` | Flag mutation, swallowed errors, magic numbers. |
| Stop | `compact-trigger.js` | Nudge `/caveman-compress` when context is heavy. |
| SessionEnd | `session-end.js` | Persist session state. |
| SessionEnd | `evaluate-session.js` | Evaluate session for extractable patterns. |

Plus inline JS hooks (tmux reminders, git push review, prettier auto-format, TypeScript check, console.log warnings, PR URL logging) — see `hooks/hooks.json`.

---

## Where to start

1. New here? Run `/init` in any project.
2. Building a feature? `/plan` → confirm → execute.
3. Ready to ship? `/cap`.
4. Lost? `/dashboard` for facts, `/morning-briefing` for "what should I work on?".
5. Want to learn a workflow? Open the corresponding skill in `skills/<name>/SKILL.md`.
