# Prompt Frontmatter Quick Guide

Use this header at the top of each `.prompt.md` file.

```yaml
---
agent: ask
description: "Reusable prompt for VerilogDeveloper sessions"
---
```

## Required Keys
- `description`: Discovery text Copilot uses to find the prompt.

## Recommended Keys
- `agent`: Chat mode or custom agent name to run this prompt with.

## Rules
- Use `agent`, not deprecated `mode`.
- Keep frontmatter as valid YAML between `---` markers.
- Use spaces, not tabs.
- Quote values containing `:`.
- Keep prompt files in `.github/prompts/` and use the `.prompt.md` suffix.
