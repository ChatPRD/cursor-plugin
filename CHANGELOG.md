# Changelog

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
