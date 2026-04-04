---
name: verilog-module-scaffold
description: "Create a complete Verilog module scaffold directory with starter RTL, testbench, include manifests, and specification files. Use for new module setup and structured file generation workflows."
argument-hint: "Module name and target directory path."
user-invocable: true
---

# Verilog Module Scaffold Skill

Create a new module directory and generate all required starter files for this repository's Verilog workflow.

## When to use

- You need to create a new Verilog/SystemVerilog module workspace quickly.
- You want consistent starter files aligned with existing prompt templates.
- You want one command that creates directory plus all module artifacts.

## Required Inputs

- `moduleName`: The module name, for example `counter_8bit`.
- `targetDirectory`: Parent path where `<moduleName>/` will be created.

## Interaction Rules

If the module name is missing, ask exactly:

What is the module name?

If the target directory is missing, ask exactly:

Where should I create the new module directory?

Do not create files until both values are provided.

## Procedure

1. Create the directory `<targetDirectory>/<moduleName>/` if it does not exist.
2. Generate and write `<moduleName>.sv` using `.github/prompts/VerilogRTLModuleFileCreation.prompt.md`.
3. Generate and write `<moduleName>.test.sv` using `.github/prompts/VerilogTestbenchFileCreation.prompt.md`.
4. Generate and write `<moduleName>.include.json` using `.github/prompts/VerilogRTLIncludeFileCreation.prompt.md`.
5. Generate and write `<moduleName>.test.include.json` using `.github/prompts/VerilogTestIncludeManifestCreation.prompt.md`.
6. Generate and write `<moduleName>.Specification.md` using `.github/prompts/VerilogModuleSpecificationCreation.prompt.md`.

## Output Rules

1. Confirm the full created directory path.
2. List all files created.
3. Do not add extra files unless explicitly requested.
4. Keep generated starter content intentionally minimal.

## Prompt Dependencies

- `.github/prompts/VerilogRTLModuleFileCreation.prompt.md`
- `.github/prompts/VerilogTestbenchFileCreation.prompt.md`
- `.github/prompts/VerilogRTLIncludeFileCreation.prompt.md`
- `.github/prompts/VerilogTestIncludeManifestCreation.prompt.md`
- `.github/prompts/VerilogModuleSpecificationCreation.prompt.md`
