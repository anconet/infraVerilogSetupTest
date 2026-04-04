---
agent: ask
description: "Create a general Verilog/SystemVerilog include manifest JSON file used by build.py workflows."
argument-hint: "Include manifest filename and ordered list of required source files; optional additional metadata keys."
---

# Verilog Include Manifest Creation

Create a general JSON include manifest for Verilog/SystemVerilog build workflows.

## Rules

1. Output valid JSON only.
2. Always include an `include` key whose value is an ordered array of required source files.
3. Keep the `include` array empty (`[]`) if no source files are provided yet.
4. Add other top-level keys only when the user explicitly asks for them.
5. Preserve the user-provided key names exactly.

## Output Schema

```json
{
  "include": []
}
```

If optional metadata is requested, include it alongside `include`.

## Note to users

Different workflows in this repository use different optional top-level keys in addition to `include`.

- RTL include style from `VerilogRTLIncludeFileCreation.prompt.md`:
  - `moduleFile`: The RTL source filename, for example `<moduleName>.sv`.
  - `moduleName`: The DUT module name.
  - `include`: Usually `[]` unless extra dependency files are required.
- Test include style from `VerilogTestIncludeManifestCreation.prompt.md`:
  - `testBenchFile`: The testbench filename, for example `<moduleName>.test.sv`.
  - `DUT`: The DUT module name.
  - `include`: Ordered dependency list, often starting with `<moduleName>.sv`.

Use the key set that matches the consuming tool or workflow, and keep `include` present in all cases.