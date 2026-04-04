---
agent: ask
description: "Create a blank Verilog module specification markdown file."
argument-hint: "Module name (required)."
---

# Verilog Module Specification Creation

Create a blank module specification markdown document.

## Interaction Rule

If the module name is not provided, ask exactly this question first:

What is the module name?

Do not generate the specification until the user answers with a module name.

## Output Rules

1. Output markdown only.
2. Use the exact structure below.
3. Replace all placeholders with the provided module name where applicable.
4. Keep content intentionally blank or placeholder-like for user completion.

## Template

# <ModuleName> Specification
This is a human-machine co-created specification for the <ModuleName> module.

## Filename
<ModuleName>.sv

## Inputs and Outputs
| Direction | Signal Name |
| --- | --- |
| input | <signal_1> |
| output | <signal_2> |
| bidirectional | <signal_3> |

### Description
- <describe module behavior>
- <reset behavior>
- <state/output expectations>

## State Diagram

```mermaid
stateDiagram-v2
    [*] --> <INITIAL_STATE>
    <INITIAL_STATE> --> <NEXT_STATE>: <condition>
    <NEXT_STATE> --> <ANOTHER_STATE>: <condition>
```