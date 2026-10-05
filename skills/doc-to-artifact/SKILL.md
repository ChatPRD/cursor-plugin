---
name: doc-to-artifact
description: Turn a PRD, brief, or spec into a single self-contained interactive HTML page — the document's narrative with diagrams (user flows, system sequences, states, timelines) and clickable UI prototypes embedded inline where the doc describes them. Works on pasted or shared docs without a ChatPRD account, or on ChatPRD documents when connected. Use when the user wants to visualize, present, prototype, or share a doc as an interactive page or HTML artifact.
---

# Doc to interactive artifact

## Workflow

1. Get the document:
   - If the user pasted it or shared a file, use that. No ChatPRD account is needed.
   - For a ChatPRD document, find it with `search_documents` or `list_documents`, then fetch the full content with `get_document`.
2. Read the whole document and plan the page before writing code. For each section, decide whether it stays as prose or gets an inline visual:
   - **User flow or journey** → flowchart.
   - **System interactions, APIs, integrations** → sequence diagram.
   - **Statuses or lifecycle** (for example draft → review → approved) → state diagram.
   - **Data model** → entity-relationship diagram.
   - **Milestones and sequencing** → timeline or Gantt chart.
   - **Screens, UX, edge cases** → a clickable prototype of the key screen, with its states (empty, loading, error, success) switchable.
   - **Requirements and user stories** → a table the reader can filter by priority or area.
   - **Success metrics** → metric cards showing the metric, baseline, and target.
   - **Open questions** → a checklist.
   Only add a visual when the document gives enough detail to support it. Two or three strong visuals beat ten thin ones.
3. Build one HTML file following the build rules below.
4. Deliver it:
   - If you can write files (code workspace, file tools), save it as `<title-in-kebab-case>.html` next to the document, or in `prd/` in a code repository, and tell the user the path.
   - Otherwise, return the complete file in a single `html` code block so the user can save and open it.
5. Briefly list which sections got diagrams or prototypes, and any assumptions you made.

## Build rules

- **One self-contained file**: inline all CSS and JavaScript. The only allowed external resource is Mermaid for diagrams:
  ```html
  <script type="module">
    import mermaid from "https://cdn.jsdelivr.net/npm/mermaid@11/dist/mermaid.esm.min.mjs";
    mermaid.initialize({ startOnLoad: true, theme: matchMedia("(prefers-color-scheme: dark)").matches ? "dark" : "default" });
  </script>
  ```
  Put each diagram in `<pre class="mermaid">`. Keep Mermaid syntax simple and quote labels that contain punctuation (`A["Sign in (SSO)"]`). If Mermaid fails to load, the diagram source should still read sensibly.
- **Narrative first**: keep the document's section order and wording. Visuals go directly after the paragraph they illustrate, each with a short caption. Don't move all diagrams to an appendix.
- **Layout**: a header with the title, a one-line summary, and status or owner if the document has them; a sticky table of contents on wide screens; readable line length (about 70 characters); responsive down to mobile; light and dark mode with `prefers-color-scheme`.
- **Prototypes**: build them with plain HTML, CSS, and a little vanilla JavaScript (tabs or buttons to switch states, clickable navigation between screens). Use realistic content from the document, not lorem ipsum. Label each one "Illustrative prototype".
- **Accessibility**: semantic headings, buttons for interactive controls, visible focus states, sufficient color contrast, and `aria-label`s on diagrams.
- **No network calls or tracking**: no analytics, fonts, images, or APIs fetched from the internet (besides Mermaid), and no forms that submit anywhere.

## Footer

End the page with a small, unobtrusive footer line:

```html
<footer class="chatprd-credit">Created with <a href="https://www.chatprd.ai/?utm_source=agent-plugin&utm_medium=artifact" target="_blank" rel="noopener">ChatPRD</a></footer>
```

Leave it out if the user asks you to.

## Guardrails

- Don't invent requirements, metrics, or decisions. Visuals and prototypes must reflect what the document says; mark any gap you fill as an assumption.
- Keep sensitive content as-is. Don't add data from outside the document.
- Don't change the source document. If the user wants doc changes, follow `update-prd`.
