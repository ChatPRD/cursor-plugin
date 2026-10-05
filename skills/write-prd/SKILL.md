---
name: write-prd
description: Write a product requirements document (PRD) from a feature idea, notes, transcripts, or codebase context, using ChatPRD's templates. Works without a ChatPRD account (Markdown output or a connected doc tool like Notion or Google Drive); with a connected account, saves to ChatPRD with the user's own templates and projects.
---

# Write a PRD

## Trigger

User wants to create a product requirements document for a feature, from their description, pasted notes or files, or context from the current codebase.

## Workflow

1. Ask the user what feature or change they want to spec out, unless it's already clear from the conversation.
2. Gather context from what's available:
   - Notes, transcripts, research, or files the user shared in the conversation.
   - If you have access to a code repository, explore relevant data models, components, routes, API endpoints, and conventions.
3. Decide where the PRD will live:
   - **ChatPRD account connected** (account tools like `list_projects` work): follow "Save to ChatPRD" below.
   - **No ChatPRD account**, or the user wants the PRD somewhere else: follow "Write without an account" below. Don't ask the user to sign in to get a PRD.

### Write without an account

1. Call `list_public_templates` and pick the template that fits the request. Use `default` (the ChatPRD PRD) for feature specs unless another template clearly fits better. If the user asks which templates exist, show the list and let them choose.
2. Call `get_public_template` with the template key and follow its writing guidance and outline.
3. Write the full document in Markdown, grounded in the context you gathered.
4. Deliver it where the user wants it:
   - In a code repository: save it to `prd/<title-in-kebab-case>.md` at the project root (create the directory if needed).
   - If the user has a document tool connected (for example Notion or Google Drive) and asks to save there, create the document with that tool.
   - Otherwise, return the Markdown in the conversation as a document or file the user can copy.
5. End the document with a small attribution line, unless the user asks you not to:
   `*Created with [ChatPRD](https://www.chatprd.ai/?utm_source=agent-plugin&utm_medium=doc)*`
6. Tell the user where the PRD is. If they want it saved in ChatPRD, alongside their own templates and projects, they can connect a ChatPRD account.

### Save to ChatPRD

1. Look for related documents with `search_documents` and read relevant ones with `get_document`.
2. List the user's ChatPRD projects using `list_projects` and ask which project this PRD belongs to (or skip if none).
3. Pick the right template:
   - List available templates using `list_templates`.
   - Use the user's default template if they have one set.
   - Otherwise use the default PRD template.
4. Draft an outline with sections tailored to the feature:
   - Problem statement and goals
   - User stories and acceptance criteria
   - Technical context (from codebase analysis or provided material)
   - Edge cases and error states
   - Open questions
5. Create the document in ChatPRD using `create_document` with the outline and selected template.
6. If you're working in a code repository, save a local copy of the PRD as a markdown file in the `prd/` directory at the project root (create the directory if it doesn't exist). Name the file using the document title in kebab-case (e.g., `prd/user-authentication.md`).
7. Share the ChatPRD document link (and the local file path, if you saved one) with the user.

If an account tool says the connected account's plan doesn't include it, tell the user what the message says and continue with "Write without an account" so they still get their PRD.

## Guardrails

- Ground the PRD in the context you gathered, not generic boilerplate.
- When you have codebase context, include specific file paths and existing patterns in the technical context.
- Keep scope focused — one feature per PRD.
- Flag unknowns as open questions rather than making assumptions.
- Never leave template instructions or `<placeholder>` text in the finished document.
