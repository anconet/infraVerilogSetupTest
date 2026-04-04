---
agent: ask
description: "Create a test include manifest (<moduleName>.test.include.json) for build.py workflows."
argument-hint: "Module name (required)."
---

# Verilog Test Include Manifest Creation

Create JSON content for `<moduleName>.test.include.json`.

## Interaction Rule

If the module name is not provided, ask exactly this question first:

What is the module name?

Do not generate output until the user answers with a module name.

## Output Rules

1. Output JSON only.
2. Use the exact schema below.
3. Replace placeholders with the provided module name.

## Template

```json
{
  "testBenchFile": "<moduleName>.test.sv",
  "DUT": "<moduleName>",
  "include": [
    "<moduleName>.sv"
  ]
}
```
## Note to users
- This file is intended to be used as part of a larger scaffold generation process. 
  - It may not be useful on its own, but it is required for the scaffold to function properly.
  - Do not delete or modify this file unless you know what you are doing.
- The include array is used pull in other files that the testbench depends on. For a simple testbench that only depends on the DUT module file, it should include just that file as shown in the template.