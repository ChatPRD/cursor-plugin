---
name: update-prd
description: Update an existing ChatPRD document with new decisions, feedback, or what was actually built. Use when the user wants to revise a PRD, add or change a section, or capture implementation decisions, trade-offs, and deviations after building.
---

# Update PRD

## Trigger

User wants to change an existing PRD — to add a section, apply review feedback, record new decisions, or match what was actually built.

## Workflow

1. Find the relevant PRD:
   - Ask the user which document to update, or search using `search_documents`.
   - In a code repository, also check the local `prd/` directory.
2. Fetch the current PRD content using `get_document`.
3. Gather what should change:
   - Changes the user described in the conversation.
   - If the user just finished building the feature in a code repository, review the git diff against the base branch and compare it with the spec: requirements implemented as specified, deviations and their reasons, deferred scope, and new edge cases.
4. Draft the change:
   - Mark completed requirements and document deviations with rationale.
   - Add a "What was actually built" section if the implementation changed significantly.
   - Move deferred items to a "Future work" section.
5. Show the user a short summary of the planned edits and get confirmation.
6. Update the document using `update_document`. This tool replaces the whole document, so pass the complete rewritten markdown in `contentMarkdown`, keeping every section you didn't intend to change, and include a brief `summary` of the edits.
7. If a local copy exists in `prd/`, update it to match.

## Guardrails

- Always confirm before calling `update_document`.
- Preserve the original PRD structure — add to it, don't rewrite it.
- Never drop existing content unless the user asked to remove it.
- Be honest about deviations — they're documentation, not failures.

## Output

- Updated PRD in ChatPRD with document link
- Updated local copy in `prd/`, if present
- Summary of changes made to the document
