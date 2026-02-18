---
name: write-prd
description: Create a product requirements document in ChatPRD from codebase context. Use when speccing a new feature, writing up requirements, or drafting a PRD.
---

# Write a PRD

## Trigger

User wants to create a product requirements document for a feature, with context from the current codebase.

## Workflow

1. Ask the user what feature or change they want to spec out.
2. Explore the codebase to understand relevant context:
   - Existing data models and schema
   - Related components, routes, and API endpoints
   - Current patterns and conventions
3. List the user's ChatPRD projects using `list_projects` and ask which project this PRD belongs to (or skip if none).
4. Pick the right template:
   - List available templates using `list_templates`.
   - Use the user's default template if they have one set.
   - Otherwise use the default PRD template.
   - If multiple templates could fit (e.g., a "Technical Spec" vs "Feature PRD"), ask the user which to use.
5. Draft an outline with sections tailored to the feature:
   - Problem statement and goals
   - User stories and acceptance criteria
   - Technical context (from codebase analysis)
   - Edge cases and error states
   - Open questions
6. Create the document in ChatPRD using `create_document` with the outline and selected template.
7. Save a local copy of the PRD as a markdown file in the `prd/` directory at the project root (create the directory if it doesn't exist). Name the file using the document title in kebab-case (e.g., `prd/user-authentication.md`). This gives the team local access to specs for reference during development.
8. Share the ChatPRD document link and local file path with the user.

## Guardrails

- Ground the PRD in actual codebase context, not generic boilerplate.
- Include specific file paths and existing patterns when describing technical context.
- Keep scope focused — one feature per PRD.
- Flag unknowns as open questions rather than making assumptions.
- The `prd/` directory should be `.gitignored` — remind the user to add it if it isn't already.

## Output

- PRD created in ChatPRD with document link
- Local copy saved to `prd/` directory
- Summary of what was included
