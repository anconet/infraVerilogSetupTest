---
agent: ask
description: "Create a Verilog include manifest (<moduleName>.include.json) for a testbench with required source dependencies."
argument-hint: "Module name, testbench file name, and files required for compilation."
---

# Verilog Include Manifest Creation

Create a JSON include manifest for a Verilog/SystemVerilog testbench used by `build.py` from `infraVerilogSetup`.

## Rules

1. Name the manifest file `<moduleName>.include.json`.
2. Set `testBenchFile` to the testbench filename, typically `<moduleName>.test.sv`.
3. Set `moduleName` to the module under test.
4. Set `include` to an ordered array of all source files required to compile and run the testbench successfully.
5. Include all required dependencies to avoid compilation failures.

## Output Schema

```json
{
  "testBenchFile": "adder.test.sv",
  "moduleName": "adder",
  "include": [
    "adder.sv",
    "utils.sv"
  ]
}
```

Return the manifest as valid JSON only.