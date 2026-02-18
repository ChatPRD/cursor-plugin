---
name: check-prd-alignment
description: Compare current code changes against a PRD to find gaps, deviations, and opportunities. Use before opening a PR, after finishing a feature, or to verify requirement coverage.
---

# Check PRD alignment

## Trigger

User wants to verify their implementation matches the product requirements and find opportunities to better achieve the PRD's goals.

## Workflow

1. Identify what changed — run `git diff` against the base branch to see all modifications.
2. Find the relevant PRD:
   - Ask the user which PRD to check against.
   - Search ChatPRD documents using `search_documents` with keywords from the branch or commit messages.
   - Also check the local `prd/` directory for saved specs.
3. Fetch the full PRD using `get_document`.
4. Extract all requirements, acceptance criteria, and — critically — the user and business goals the PRD is trying to achieve.
5. For each requirement, assess:
   - **Covered**: implemented and matching the spec
   - **Partial**: started but incomplete or missing edge cases
   - **Missing**: not addressed in the current changes
   - **Deviated**: implemented differently than specified
6. Review the implementation through the lens of the PRD's stated goals. For each goal, identify **Opportunity** items — places where the UX or implementation could be improved to better achieve the goal. Examples:
   - A flow that technically meets the spec but adds unnecessary friction
   - An edge case where a better error message or fallback would improve the experience
   - A place where the implementation could be more delightful or intuitive than what was specced
   - A data model or API design choice that would better support the stated business goal
7. Produce a coverage report with:
   - Requirement-by-requirement status
   - Specific code references for covered items
   - Actionable notes for gaps and deviations
   - **Opportunity** items tied back to specific PRD goals

## Guardrails

- Be specific — cite file paths and line ranges, not vague summaries.
- Distinguish between intentional trade-offs and accidental omissions.
- Don't flag requirements that are explicitly marked as out-of-scope or future work in the PRD.
- Keep **Opportunity** items grounded and actionable — tie each one to a specific PRD goal and explain the concrete improvement.

## Output

- Alignment report (covered / partial / missing / deviated)
- **Opportunity** items with goal references and suggested improvements
- Specific gaps with suggested next steps
- Summary of overall coverage
