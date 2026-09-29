---
name: get-started
description: Introduce the ChatPRD plugin, confirm the ChatPRD connection, and suggest a first task. Use when the user first installs ChatPRD, asks what ChatPRD can do, or asks how to get started.
---

# Get started with ChatPRD

## Workflow

1. Confirm the connection by calling `list_documents` with a small `limit` (for example, 5).
   - If the call fails with an authentication error, ask the user to connect or reconnect their ChatPRD account and stop.
   - If it succeeds, briefly mention how many recent documents you found (titles only).
2. Call `list_projects` to see whether the user organizes documents into projects. Mention project names if any exist.
3. Explain in two or three sentences what you can do with ChatPRD:
   - Draft a new PRD from notes, a transcript, or a feature idea using their ChatPRD templates.
   - Review an existing PRD for gaps, unclear requirements, and missing edge cases.
   - Find documents and update them as decisions change.
   - In a code workspace: plan implementation from a PRD and check changes against it.
4. Offer two or three concrete next steps based on what you found. For example: "Review <most recent document title>" or "Draft a PRD from notes you paste here."

## Guardrails

- Only report documents and projects returned by the tools. Don't invent examples from the user's account.
- Don't create or update documents during onboarding unless the user asks.
- Keep the introduction short and move quickly to a first task.
