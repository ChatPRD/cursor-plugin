---
name: get-started
description: Introduce the ChatPRD plugin, check whether a ChatPRD account is connected, and suggest a first task. Use when the user first installs ChatPRD, asks what ChatPRD can do, or asks how to get started.
---

# Get started with ChatPRD

## Workflow

1. Check for a connected account by calling `list_documents` with a small `limit` (for example, 5).
   - If it succeeds, briefly mention how many recent documents you found (titles only), then call `list_projects` and mention project names if any exist.
   - If it fails because the user isn't signed in, or their plan doesn't include it, continue without an account. Don't block on sign-in.
2. Explain in two or three sentences what you can do:
   - Without an account: draft a PRD or other product doc from notes, a transcript, or a feature idea using ChatPRD's built-in templates (`list_public_templates`), as Markdown or in a connected doc tool like Notion or Google Drive; review a doc the user pastes or shares with a ChatPRD scorecard; turn a doc into an interactive HTML page with diagrams and prototypes.
   - With a connected account: also save docs to ChatPRD, use their own templates and projects, find documents, and update them as decisions change.
   - In a code workspace: plan implementation from a PRD and check changes against it.
3. Offer two or three concrete next steps based on what you found. For example: "Review <most recent document title>", "Draft a PRD from notes you paste here", or "Show me ChatPRD's templates."

## Guardrails

- Only report documents and projects returned by the tools. Don't invent examples from the user's account.
- Don't create or update documents during onboarding unless the user asks.
- Keep the introduction short and move quickly to a first task.
