# Copilot Customizations Guide

This guide explains how to use the workspace customizations in `.github/agents`, `.github/prompts`, and `.github/skills`.

## Quick Start

1. For a one-shot file/template generation task, use a prompt from `.github/prompts`.
2. For a multi-step workflow (directory + multiple files), use a skill from `.github/skills`.
3. For broader implementation tasks (for example writing RTL or tests), switch to an agent from `.github/agents`.

## How To Use

### Prompts

Prompts are best for focused outputs.

- In Copilot Chat, type `/` and select the prompt by name.
- Follow any required questions in the prompt (for example module name and path).

### Skills

Skills are best for repeatable multi-step workflows.

- In Copilot Chat, type `/` and select the skill name if it is user-invocable.
- Provide the required arguments from `argument-hint`.

### Agents

Agents are best for broader tasks and iterative implementation.

- Switch chat mode to the target custom agent.
- Give the agent a concrete task and expected output.

## Current Skills

| Skill | Purpose | Inputs |
| --- | --- | --- |
| `verilog-module-scaffold` | Creates a full module scaffold directory and all starter files. | `moduleName`, `targetDirectory` |

Skill file:
- `.github/skills/verilog-module-scaffold/SKILL.md`

## Current Prompts

| Prompt File | Purpose | Typical Input |
| --- | --- | --- |
| `VerilogModuleScaffoldCreation.prompt.md` | User entrypoint that delegates scaffolding to the `verilog-module-scaffold` skill. | Module name, target directory |
| `VerilogModuleSpecificationCreation.prompt.md` | Creates blank module specification markdown. | Module name |
| `VerilogRTLModuleFileCreation.prompt.md` | Creates minimal RTL module file content. | Module name |
| `VerilogTestbenchFileCreation.prompt.md` | Creates minimal testbench file content. | Module name |
| `VerilogRTLIncludeFileCreation.prompt.md` | Creates RTL include manifest (`<module>.include.json`). | Module name |
| `VerilogTestIncludeManifestCreation.prompt.md` | Creates test include manifest (`<module>.test.include.json`). | Module name |
| `VerilogIncludeFileCreation.prompt.md` | Creates a general include manifest schema with optional metadata keys. | Include filename, include list, optional keys |
| `context-audit.prompt.md` | Audits session context, assumptions, and missing inputs before edits. | Optional focus area |
| `verilog-session-primer.prompt.md` | Session setup template for VerilogDeveloper runs. | Session goals and constraints |

Prompt folder:
- `.github/prompts/`

## Current Agents

| Agent File | Role | Use When |
| --- | --- | --- |
| `VerilogDeveloper.agent.md` | Verilog implementation agent | Building or modifying synthesizable RTL |
| `VerilogTester.agent.md` | Verilog unit test agent | Creating SystemVerilog tests and include manifests |
| `PythonExpert.agent.md` | Python-focused coding agent | Editing build/config/tooling Python code |

Agent folder:
- `.github/agents/`

## Recommended Workflow

1. Start new module creation with `VerilogModuleScaffoldCreation.prompt.md`.
2. Update `<module>.Specification.md` with concrete requirements.
3. Use `VerilogTester.agent.md` to create tests from the specification.
4. Expect tests to fail while `<module>.sv` is still a placeholder.
5. Use `VerilogDeveloper.agent.md` to implement RTL that meets the specification and passes tests.
6. Use `VerilogIncludeFileCreation.prompt.md` only when you need a custom include schema beyond the RTL/test defaults.

## Maintenance Tips

1. Keep prompt names task-specific and stable.
2. Keep orchestration logic in skills, not in multiple prompts.
3. Keep prompts focused on single outputs.
4. Update this README whenever you add or rename a prompt/skill/agent.
