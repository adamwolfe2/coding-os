---
name: dashboard
description: One-shot status board for all known projects. Smaller than /morning-briefing — just facts, no recommendations. Use when you want a fast overview without spinning up the full briefing flow.
---

# /dashboard — Project status board

Fast (<15s). Reads MEMORY.md project index. For each project: branch, last commit, CI status, deployment state. No analysis, just facts.

## Output format

```
/dashboard — <timestamp>

Project       Branch          LastCommit    CI         Deploy      MRR    Notes
─────────────────────────────────────────────────────────────────────────────────
<proj-a>      main            2h ago        green      Ready       $4k    -
<proj-b>      testing/...     1h ago        green      Ready       $2k    13 ahead
<proj-c>      main            5h ago        green      Ready       $12k   -
<proj-d>      main            6d ago        n/a        n/a         -      stale
<proj-e>      main            1d ago        green      Ready       -      DNS pending
<proj-f>      main            3d ago        yellow     Building    $400   -
<proj-g>      main            12d ago       red        Error       -      missing env
```

## Implementation

Per project (parallel):
1. `cd <path> && git log -1 --format='%cr|%s' && git rev-parse --abbrev-ref HEAD`
2. `gh run list --repo <repo> --limit 1 --json status,conclusion`
3. `vercel ls --json | head -3` (if Vercel)
4. Stripe MRR (if MCP available)

Total time: ≤15s. Cache results at `~/.claude/dashboard-cache.json` with 5-min TTL.

## Hard rules

- Read-only. Never modifies project state.
- If a check times out (>5s), report `-` not `error`.
- Parallel all per-project calls.
- No emojis in output (use plain `green` / `yellow` / `red` text).
