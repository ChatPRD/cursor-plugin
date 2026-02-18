---
name: update-prd
description: Update a ChatPRD document to reflect what was actually built. Use after implementation to capture decisions, trade-offs, and deviations from the original spec.
---

# Update PRD

## Trigger

User finished building a feature and wants to update the PRD to match reality.

## Workflow

1. Find the relevant PRD:
   - Ask the user which document to update.
   - Or search using `search_documents`.
   - Also check the local `prd/` directory.
2. Fetch the current PRD content using `get_document`.
3. Analyze what was actually built:
   - Review the git diff against the base branch.
   - Identify the key implementation decisions.
4. Compare the implementation against the original spec and note:
   - Requirements that were implemented as specified
   - Deviations and the reasons behind them
   - Scope that was deferred or cut
   - New edge cases or considerations discovered during implementation
5. Draft update instructions that:
   - Mark completed requirements
   - Document deviations with rationale
   - Add a "What was actually built" section if significant changes were made
   - Move deferred items to a "Future work" section
6. Update the document in ChatPRD using `update_document`.
7. Update the local copy in `prd/` to stay in sync.

## Guardrails

- Preserve the original PRD structure — add to it, don't rewrite it.
- Be honest about deviations — they're documentation, not failures.
- Keep the update concise and factual.

## Output

- Updated PRD in ChatPRD
- Updated local copy in `prd/`
- Summary of changes made to the document
