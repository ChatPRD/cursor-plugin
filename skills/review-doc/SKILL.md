---
name: review-doc
description: Review a PRD, brief, or spec the way ChatPRD's "Review my doc" does — a strategy-first scorecard (Strategy, Structure, Clarity, Completeness), top priorities, and 3-5 exact, quotable edit suggestions. Works on pasted or shared docs without a ChatPRD account, or on ChatPRD documents when connected. Use when the user asks to review, score, critique, pressure-test, or improve a document.
---

# Review my doc

## Workflow

1. Find the document:
   - If the user pasted the document or shared a file, review that directly. No ChatPRD account is needed.
   - If the user names a ChatPRD document, use `search_documents` with keywords from the name.
   - If they say "latest" or "most recent", use `list_documents`.
   - If the document is in a project, `list_projects` and `list_project_documents` can help narrow it down.
   - If several documents match, ask the user which one to review.
2. For a ChatPRD document, fetch the full content with `get_document`.
3. Analyze **strategy first (about 60% of your effort)**. Great formatting means nothing without strong product thinking. Rate each 1-10:
   - **Problem clarity**: Is the problem or opportunity clearly defined and compelling?
   - **Solution strength**: Is the proposed solution well thought out?
   - **Value proposition**: Is the value to users or customers clear?
   - **Feasibility**: Is this realistic to build?
   - **Differentiation**: Does it stand apart from alternatives?
4. Then analyze **presentation (about 40%)**:
   - **Structure**: organization, heading hierarchy, logical flow.
   - **Clarity**: readability, undefined jargon and acronyms, ambiguous phrasing.
   - **Completeness**: detect the document type (PRD, brief, spec, general) and list missing sections, undefined terms, and unanswered questions for that type.
5. Score each category 1-10 using the rubric below, then give an **overall score** weighted most heavily toward Strategy. A poorly structured doc with a great idea beats a well-formatted doc with weak thinking.
6. Write **3-5 suggestions**, strategic gaps first. For each one:
   - **Section** it applies to.
   - **Original**: an exact, verbatim quote from the document (including markdown such as `**` or `-`), so the user can find it. Never paraphrase the quote. For a missing section, quote the heading it should follow.
   - **Suggested**: the improved or added text.
   - **Why**: written as an action the user should take ("Set measurable goals by adding a target and timeframe"), not a description of the change ("This sets clearer goals").
   - **Priority**: high, medium, or low.
7. For a section with major problems, include a full rewrite to show what good looks like.
8. Offer to apply the suggestions. Only change a ChatPRD document after the user confirms, and follow the `update-prd` skill when you do. For a pasted or shared document, return the revised version as Markdown.

## Output format

```markdown
## Review: <document title>

**Overall: <n>/10** — <one-sentence executive summary>

| Category | Score | Summary |
| --- | --- | --- |
| Strategy | n/10 | ... |
| Structure | n/10 | ... |
| Clarity | n/10 | ... |
| Completeness | n/10 | ... |

**What's working:** <2-3 specific strengths>

**Top priorities**
1. ...
2. ...
3. ...

### Suggestions
**1. <Section> — <priority>**
> <exact original text>

**Suggested:** <replacement or addition>
**Why:** <action to take>
```

## Scoring rubric

**Strategy** (most important)
- 9-10: Compelling problem, innovative solution, clear value, realistic execution
- 7-8: Strong thinking with minor gaps in reasoning or differentiation
- 5-6: Decent idea but the problem or solution needs sharper definition
- 3-4: Weak product thinking, unclear value, or feasibility concerns
- 1-2: Fundamentally flawed approach or missing core rationale

**Structure**
- 9-10: Clear hierarchy and logical flow · 7-8: Well organized, minor improvements possible · 5-6: Adequate · 3-4: Confusing, hard to follow · 1-2: No clear organization

**Clarity**
- 9-10: Clear to any reader · 7-8: Occasional jargon or ambiguity · 5-6: Understandable with effort · 3-4: Frequently confusing · 1-2: Very hard to understand

**Completeness**
- 9-10: Addresses all aspects · 7-8: Minor gaps · 5-6: Missing some important details · 3-4: Significant gaps · 1-2: Missing critical information

## Guardrails

- Be specific. Reference the document's actual text instead of giving generic advice.
- Balance criticism with recognition of what's working.
- Judge the document as the type it is; don't penalize a brief for lacking PRD sections, or items marked out of scope or future work.
- Don't modify any document during a review unless the user explicitly asks.
