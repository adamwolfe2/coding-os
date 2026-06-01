# Everything Claude Code — Public

Battle-tested agents, skills, slash commands, rules, and hooks for [Claude Code](https://docs.claude.com/en/docs/claude-code/overview). Drop them into `~/.claude/` and you inherit a complete autopilot workflow on every project: planning, TDD, code/security review, design craft, shipping with preflight, and a learning loop that compounds. This repo is a sanitized public copy intended for sharing — feel free to fork it, mix and match, or vendor pieces into your own setup.

---

## Quick install

```bash
git clone https://github.com/<your-org>/everything-claude-code-public.git ~/everything-claude-code

# Symlink the four user-level surfaces into ~/.claude/
ln -sfn ~/everything-claude-code/agents   ~/.claude/agents
ln -sfn ~/everything-claude-code/commands ~/.claude/commands
ln -sfn ~/everything-claude-code/skills   ~/.claude/skills
ln -sfn ~/everything-claude-code/rules    ~/.claude/rules

# Optional: drop the autopilot CLAUDE.md template into ~/.claude/
cp ~/everything-claude-code/CLAUDE.md.example ~/.claude/CLAUDE.md
```

Restart Claude Code and the agents/commands/skills will be picked up automatically.

---

## Layout

```
everything-claude-code/
|-- agents/             Specialized subagents (planner, tdd-guide, code-reviewer, ...)
|-- commands/           Slash commands (/cap, /tdd, /plan, /qa, ...)
|-- skills/             Workflow + domain knowledge (impeccable, safe-feature-slice, ...)
|-- rules/              Always-follow guidelines (security, testing, git, ...)
|-- hooks/              hooks.json + Node-based session lifecycle scripts
|-- scripts/            Cross-platform implementations of hooks + helpers
|-- contexts/           Mode prompts (dev / review / research)
|-- mcp-configs/        MCP server definitions
|-- examples/           Sample project + user CLAUDE.md
|-- evals/              Frozen eval set used by /evolve-skills
|-- archive/            Skills/hooks parked out of the active selector
|-- plugins/            Plugin packaging notes
|-- .claude-plugin/     Plugin manifest
|-- CLAUDE.md.example   Drop into ~/.claude/CLAUDE.md to enable autopilot mode
|-- RTK.md              Rust Token Killer integration notes
|-- AUTOPILOT.md        Architecture of the closed-loop self-improving build system
```

---

## Highlights

- **`/cap`** — the headline ship workflow. Lint, types, tests, format, build, env-sync, optional CodeRabbit, conventional commit, push, ship-verify (CI + Vercel + URL). One command, full preflight.
- **`safe-feature-slice`** — Tier-1 safety workflow that auto-activates on money / auth / RLS / webhook / state-transition work.
- **`impeccable`** — frontend craft skill backed by curated CSV references (typography pairings, palettes, UX rules) merged in from ui-ux-pro-max.
- **planner / tdd-guide / code-reviewer / security-reviewer** — the standard subagent rotation for any feature.
- **Marketing skills** — `cold-email`, `cro`, `launch`, `onboarding`, `pricing`, `product-marketing`. Real outbound and lifecycle playbooks, not toy prompts.
- **`/evolve-skills`** — measured, git-backed mutation loop that scores changes against a frozen eval set before promoting them.

---

## Credits

This repo stands on the shoulders of several open-source efforts. Integrations preserved with attribution:

- **[affaan-m/everything-claude-code](https://github.com/affaan-m/everything-claude-code)** — original foundation: agents, hooks, commands skeleton.
- **[affaan-m/ecc](https://github.com/affaan-m/ecc)** — `/quality-gate`, `/harness-audit`, `/multi-plan`, `/multi-execute`; skills `eval-harness`, `verification-loop`, `cost-aware-llm-pipeline`, `database-migrations`, `deployment-patterns`.
- **[coreyhaines31/marketingskills](https://github.com/coreyhaines31/marketingskills)** — marketing skills suite: `cold-email`, `cro`, `launch`, `onboarding`, `pricing`, `product-marketing`.
- **[nextlevelbuilder/ui-ux-pro-max-skill](https://github.com/nextlevelbuilder/ui-ux-pro-max-skill)** — CSV reference data merged into `impeccable/references/ui-ux-pro-max/`.
- **[JuliusBrussee/caveman](https://github.com/JuliusBrussee/caveman)** — `/caveman-commit`, `/caveman-compress`, `/caveman-stats` and the compression philosophy.
- **[karpathy/autoresearch](https://github.com/karpathy/autoresearch)** — closed-loop measured-mutation pattern behind `/evolve-skills`.
- **[nousresearch/hermes-agent](https://github.com/nousresearch/hermes-agent)** — agent orchestration patterns informing the planner/architect/CEO chain.
- **James Vanderhaak** — `safe-feature-slice` skill and the `/cap` design (used with permission).

Per-skill attribution is preserved in each integrated skill's `SOURCE.md`.

---

## Contributing

See [CONTRIBUTING.md](./CONTRIBUTING.md). The short version: keep configs focused, modular, and free of personal/project identifiers. Test against Claude Code before submitting.

---

## License

MIT — see [LICENSE](./LICENSE). Use it, fork it, mix it into your own setup.
