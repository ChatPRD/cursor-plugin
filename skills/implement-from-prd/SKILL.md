---
name: implement-from-prd
description: Fetch a PRD from ChatPRD and generate a scoped implementation plan for the current code repository. Use in a coding workspace when starting work on a spec, breaking down a PRD into tasks, or planning how to build a feature.
---

# Implement from PRD

## Trigger

User has a PRD in ChatPRD and wants to plan or start the implementation.

## Workflow

1. Help the user find the right PRD:
   - Search documents using `search_documents` if they give a name or keyword.
   - Or list recent documents using `list_documents` to browse.
   - Also check the local `prd/` directory for previously saved specs.
2. Fetch the full PRD content using `get_document`.
3. Build the implementation plan before writing code (use plan mode if your editor has one). The plan should:
   - Analyze the codebase to understand where new code should live, what can be reused, and what conventions to follow.
   - Break the PRD into implementation milestones, each a shippable increment ordered by dependency (schema → API → UI).
   - For each milestone, specify: files to create or modify, key implementation details, acceptance criteria from the PRD, and risks or unknowns.
   - Map every PRD requirement to at least one milestone so nothing is missed.
4. Present the plan for the user to review and approve before starting implementation.
5. Once approved, begin work on the first milestone.

## Guardrails

- Always plan first — never jump straight to implementation on a PRD.
- Map every PRD requirement to at least one milestone.
- Flag requirements that are ambiguous or missing technical detail.
- Keep milestones small enough to review in a single PR.
- Don't skip edge cases mentioned in the PRD.

## Output

- Implementation plan with ordered milestones
- File-level change list per milestone
- Requirement coverage mapping
- Ready to execute on first milestone after approval
