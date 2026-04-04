---
agent: ask
description: "Create a minimal Verilog/SystemVerilog testbench file (<moduleName>.test.sv)."
argument-hint: "Module name (required)."
---

# Verilog Testbench File Creation

Create starter testbench content for `<moduleName>.test.sv`.

## Interaction Rule

If the module name is not provided, ask exactly this question first:

What is the module name?

Do not generate output until the user answers with a module name.

## Output Rules

1. Output SystemVerilog only.
2. Use the exact template below.
3. Replace placeholders with the provided module name.
4. Keep test behavior intentionally minimal.

## Template

```systemverilog
`timescale 1ns/1ps

module <moduleName>_test;
    logic clk;
    logic rst_n;
    logic done;

    <moduleName> dut (
        .clk(clk),
        .rst_n(rst_n),
        .done(done)
    );

    initial begin
        clk = 1'b0;
        forever #5 clk = ~clk;
    end

    initial begin
        rst_n = 1'b0;
        #20;
        rst_n = 1'b1;

        #100;
        $finish;
    end
endmodule
```
