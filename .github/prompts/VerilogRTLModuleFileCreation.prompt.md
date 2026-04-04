---
agent: ask
description: "Create a minimal Verilog/SystemVerilog RTL module file (<moduleName>.sv)."
argument-hint: "Module name (required)."
---

# Verilog RTL Module File Creation

Create starter RTL content for `<moduleName>.sv`.

## Interaction Rule

If the module name is not provided, ask exactly this question first:

What is the module name?

Do not generate output until the user answers with a module name.

## Output Rules

1. Output SystemVerilog only.
2. Use the exact template below.
3. Replace placeholders with the provided module name.
4. Keep behavior intentionally minimal.

## Template

```systemverilog
module <moduleName> (
    input  logic clk,
    input  logic rst_n,
    output logic done
);

    always_comb begin
        done = 1'b0;
    end

endmodule
```
