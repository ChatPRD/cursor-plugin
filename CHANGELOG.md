# Changelog

## 1.2.0

- `write-prd` works without a ChatPRD account: uses ChatPRD's built-in templates (`list_public_templates`, `get_public_template`) and outputs Markdown, a `prd/` file, or a doc in a connected tool like Notion or Google Drive
- `get-started` and `review-doc` work without an account (review pasted or shared PRDs)
- `review-prd` is now `review-doc`, matching ChatPRD's "Review my doc": strategy-first scorecard, top priorities, and exact-quote edit suggestions
- New skill: `doc-to-artifact` turns a doc into an interactive HTML page with inline Mermaid diagrams and clickable prototypes
- Docs and artifacts written outside ChatPRD end with a small "Created with ChatPRD" link (omitted on request)
- Review test cases for the account-free flows

## 1.1.0

- Agent Plugins manifest (`plugin.json`) so the same package installs in ChatGPT, Codex, and Cursor
- OpenAI listing metadata, onboarding skill, and review test cases for plugin submission
- `mcp.json` uses the Agent Plugins schema with an explicit `streamable-http` transport
- New skills: `get-started`, `review-prd`
- `write-prd` and `update-prd` work without a codebase (notes, transcripts, conversation context)
- `update-prd` confirms before editing and preserves full document content
- Codex marketplace at `.agents/plugins/marketplace.json`

## 1.0.0

- Initial release
- MCP integration with ChatPRD (zero-config, no API key)
- Skills: write-prd, implement-from-prd, check-prd-alignment, update-prd
- Product-aware development rule
- Product reviewer agent
- Local `prd/` directory for offline spec access
