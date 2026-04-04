# Agent Frontmatter Quick Guide

Use this header at the top of each `.agent.md` file.

```yaml
---
name: VerilogDeveloper
description: "Use when: implementing or debugging Verilog/SystemVerilog RTL and testbenches"
argument-hint: "Describe the implementation task or issue clearly."
# tools: ['vscode', 'execute', 'read', 'agent', 'edit', 'search', 'web', 'todo']
---
```

## Required Keys
- `name`: Agent identifier shown in Copilot.
- `description`: Discovery text Copilot uses to match the agent.

## Recommended Keys
- `argument-hint`: Tells users what inputs the agent expects.
- `tools`: Optional tool restrictions. Omit to allow all enabled tools.

## Rules
- Keep frontmatter as valid YAML between `---` markers.
- Use spaces, not tabs.
- Quote values containing `:`.
- Keep agent files in `.github/agents/` and use the `.agent.md` suffix.
