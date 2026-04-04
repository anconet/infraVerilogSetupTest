---
agent: ask
description: "Audit current chat context: assumptions, sources, and missing inputs before edits"
argument-hint: "Optional focus area, file, or risk to audit"
---

You are performing a context audit for the current Copilot chat session.

Goal: make hidden assumptions explicit before implementation.

## Instructions
1. Summarize the active objective in 1-2 sentences.
2. List the concrete inputs currently in context:
- User requirements stated in this thread
- Referenced files and symbols
- Tool outputs already gathered
- Constraints and non-goals
3. List assumptions you are making right now.
4. Identify missing context that could change implementation decisions.
5. Provide a confidence rating for current context quality:
- High: enough to implement now
- Medium: can proceed with explicit assumptions
- Low: should clarify first
6. If confidence is not High, provide up to 5 focused clarification questions.
7. End with a Recommended Next Action section containing exactly one option:
- Proceed with implementation
- Run targeted discovery
- Ask clarifying questions first

## Output Format
Use this exact structure:

Session Goal
- ...

Known Context
- ...

Current Assumptions
- ...

Missing or Ambiguous Context
- ...

Context Confidence
- High | Medium | Low
- Reason: ...

Clarifying Questions (if needed)
1. ...

Recommended Next Action
- ...
