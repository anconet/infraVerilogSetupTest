---
agent: ask
description: "User entrypoint for creating a new Verilog module scaffold by invoking the verilog-module-scaffold skill."
argument-hint: "Module name and target directory path."
---

# Verilog Module Scaffold Creation

Use the `verilog-module-scaffold` skill to create a new directory and starter files for a Verilog/SystemVerilog module.

## Interaction Rules

If the module name is not provided, ask exactly this question first:

What is the module name?

If the new module directory location is not provided, ask exactly this question next:

Where should I create the new module directory?

Do not create files until both values are provided.

## Inputs

- `moduleName`: The module name, for example `counter_8bit`.
- `targetDirectory`: The path where the new module directory should be created.

## Required Action

Invoke the `verilog-module-scaffold` skill and pass the collected `moduleName` and `targetDirectory` values.

The skill is responsible for creating the directory, generating all scaffold files, and reporting created outputs.

## Skill Dependency

- `.github/skills/verilog-module-scaffold/SKILL.md`

## Output Rules

1. Confirm the full path of the created module directory.
2. List all created files.
3. Do not add extra files unless the user asks.
4. Keep placeholders and starter logic intentionally minimal.
