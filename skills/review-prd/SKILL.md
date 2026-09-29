---
name: review-prd
description: Review a PRD stored in ChatPRD and give structured, actionable feedback on goals, requirements, acceptance criteria, edge cases, and open questions. Use when the user asks to review, critique, pressure-test, or improve a PRD or spec.
---

# Review a PRD

## Workflow

1. Find the document:
   - If the user names it, use `search_documents` with keywords from the name.
   - If they say "latest" or "most recent", use `list_documents`.
   - If the document is in a project, `list_projects` and `list_project_documents` can help narrow it down.
   - If several documents match, ask the user which one to review.
2. Fetch the full content with `get_document`.
3. Review the document against these criteria:
   - **Problem and goals**: Is the user problem clear? Are goals measurable, and is there a success metric?
   - **Scope**: Are in-scope and out-of-scope items explicit? Is the scope realistic for one release?
   - **Requirements**: Are requirements specific and testable? Does each one have acceptance criteria?
   - **Users and flows**: Are target users and key flows described, including empty, loading, error, and permission states?
   - **Risks and dependencies**: Are technical, legal, and cross-team dependencies called out?
   - **Open questions**: Are unknowns listed with an owner or next step?
4. Report back with:
   - A one-paragraph summary of the document's intent.
   - Strengths (brief).
   - Issues grouped by severity (**Blocking**, **Important**, **Nice to have**), each citing the section it applies to and suggesting concrete wording or an addition.
   - The top three questions the author should answer next.
5. Offer to apply the suggested changes. Only update the document if the user confirms. When updating, follow the `update-prd` skill.

## Guardrails

- Base feedback on the document's actual content. Quote or cite sections instead of giving generic advice.
- Don't modify the document during a review unless the user explicitly asks.
- Don't penalize items the PRD marks as out of scope or future work.
