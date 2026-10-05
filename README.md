# ChatPRD plugin

One plugin package for ChatGPT, Codex, and Cursor. Product requirements where you work. Write PRDs from code context, implement from specs, verify alignment, and keep docs in sync — powered by [ChatPRD](https://chatprd.ai).

## What's included

**MCP Server** — Zero-config connection to ChatPRD. No API key needed. ChatPRD's built-in templates (PRD, AI development brief, user testing plan, launch checklist) work without an account; connect a ChatPRD account to access your documents, projects, templates, and team workspace.

**Skills:**

| Skill | What it does |
|-------|-------------|
| `get-started` | Onboarding: confirms the ChatPRD connection and suggests a first task |
| `write-prd` | Writes a PRD from notes, a feature idea, or codebase context — as Markdown or in a connected doc tool without an account, or in ChatPRD when connected |
| `review-doc` | ChatPRD's "Review my doc": a strategy-first scorecard (strategy, structure, clarity, completeness) with exact, quotable edit suggestions — no account needed for pasted docs |
| `doc-to-artifact` | Turns a PRD or doc into a self-contained interactive HTML page with inline diagrams and clickable prototypes |
| `implement-from-prd` | Fetches a PRD and builds an implementation plan using plan mode |
| `check-prd-alignment` | Diffs your branch against a PRD — reports coverage, gaps, and **Opportunity** items to better achieve the PRD's goals |
| `update-prd` | Updates a PRD with new decisions or what was actually built, including deviations and trade-offs |

**Rule** — Always-on product-aware development standards: reference specs, handle edge cases, flag deviations.

**Agent** — Product reviewer that checks code changes against PRD requirements, not just technical correctness.

## How it works

The plugin saves local copies of PRDs to a `prd/` directory in your project root. These are committed to the repo so the whole team has specs alongside the code — useful for code review, onboarding, and understanding why things were built a certain way. ChatPRD remains the source of truth; local copies are kept in sync by the `update-prd` skill.

When you run `implement-from-prd`, Cursor enters plan mode to build a structured implementation plan before writing any code. Every PRD requirement maps to a milestone so nothing gets missed.

The `check-prd-alignment` skill goes beyond a checkbox exercise — it reads the PRD's stated user and business goals and identifies **Opportunity** items where the implementation could better achieve those goals.

## Package layout

The repo root is an [Agent Plugins](https://agent-plugins.org) package:

- `plugin.json` — portable manifest. OpenAI listing, onboarding, and review metadata live in `extensions.com.openai`.
- `mcp.json` — the ChatPRD remote MCP server (`https://app.chatprd.ai/mcp`). Template tools are public; account tools use OAuth.
- `skills/` — shared by ChatGPT, Codex, and Cursor.
- `assets/` — icons.
- `.cursor-plugin/plugin.json`, `rules/`, `agents/` — Cursor-only components.
- `.agents/plugins/marketplace.json` — Codex / ChatGPT desktop marketplace for installing from this repo.

## Getting started

**Cursor:** Install the ChatPRD plugin from the Cursor Marketplace, open a project, and try "Write a PRD for [feature]".

**Codex / ChatGPT desktop:**

```bash
codex plugin marketplace add ChatPRD/cursor-plugin
codex plugin add chatprd@chatprd
```

Then connect your ChatPRD account when prompted and try "Review my latest ChatPRD document".

## Submitting to the ChatGPT plugin directory

```bash
./scripts/package-openai.sh   # writes dist/chatprd-<version>.zip
```

Upload the ZIP in the OpenAI plugin submission portal. Reviewer credentials and the demo recording URL are entered in the dashboard, not in the package. Bump `version` in `plugin.json` for each new upload.

## Links

- [ChatPRD](https://chatprd.ai)
- [ChatPRD MCP docs](https://chatprd.ai/product/mcp)
- [Cursor Plugin docs](https://cursor.com/docs/plugins)
- [OpenAI plugin docs](https://developers.openai.com/plugins)
