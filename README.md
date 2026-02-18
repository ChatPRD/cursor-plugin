# ChatPRD for Cursor

Product requirements in your editor. Write PRDs from code context, implement from specs, verify alignment, and keep docs in sync — powered by [ChatPRD](https://chatprd.ai).

## What's included

**MCP Server** — Zero-config connection to ChatPRD. No API key needed. Access your documents, projects, templates, and team workspace directly from Cursor.

**Skills:**

| Skill | What it does |
|-------|-------------|
| `write-prd` | Analyzes your codebase and creates a PRD in ChatPRD with real technical context |
| `implement-from-prd` | Fetches a PRD and builds an implementation plan using plan mode |
| `check-prd-alignment` | Diffs your branch against a PRD — reports coverage, gaps, and **Opportunity** items to better achieve the PRD's goals |
| `update-prd` | Updates the PRD to reflect what was actually built, including deviations and trade-offs |

**Rule** — Always-on product-aware development standards: reference specs, handle edge cases, flag deviations.

**Agent** — Product reviewer that checks code changes against PRD requirements, not just technical correctness.

## How it works

The plugin saves local copies of PRDs to a `prd/` directory in your project root. These are committed to the repo so the whole team has specs alongside the code — useful for code review, onboarding, and understanding why things were built a certain way. ChatPRD remains the source of truth; local copies are kept in sync by the `update-prd` skill.

When you run `implement-from-prd`, Cursor enters plan mode to build a structured implementation plan before writing any code. Every PRD requirement maps to a milestone so nothing gets missed.

The `check-prd-alignment` skill goes beyond a checkbox exercise — it reads the PRD's stated user and business goals and identifies **Opportunity** items where the implementation could better achieve those goals.

## Getting started

1. Install the ChatPRD plugin from the Cursor Marketplace.
2. Open a project in Cursor — the MCP connection is automatic.
3. Try: "Write a PRD for [feature]" or "Implement the [document name] PRD".

## Links

- [ChatPRD](https://chatprd.ai)
- [ChatPRD MCP docs](https://chatprd.ai/product/mcp)
- [Cursor Plugin docs](https://cursor.com/docs/plugins)
