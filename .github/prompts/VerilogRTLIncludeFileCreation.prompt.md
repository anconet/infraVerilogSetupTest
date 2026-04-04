---
agent: ask
description: "Create a module include manifest (<moduleName>.include.json) for build.py workflows."
argument-hint: "Module name (required)."
---

# Verilog RTL Include File Creation

Create JSON content for `<moduleName>.include.json`.

## Interaction Rule

If the module name is not provided, ask exactly this question first:

What is the module name?

Do not generate output until the user answers with a module name.

## Output Rules

1. Output JSON only.
2. Use the exact schema and key order below.
3. Replace placeholders with the provided module name.

## Template

```json
{
  "moduleFile": "<moduleName>.sv",
  "moduleName": "<moduleName>",
  "include": []
}
```

## Note to users
- This file is intended to be used as part of a larger scaffold generation process. 
  - It may not be useful on its own, but it is required for the scaffold to function properly.
  - Do not delete or modify this file unless you know what you are doing.
- The include array is used pull in other files that the module depends on. For a simple module with no dependencies, it can be left empty as shown in the template.
