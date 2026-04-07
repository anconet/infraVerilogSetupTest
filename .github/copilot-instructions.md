# Verilog Module Development Workflow

Use this default workflow for new Verilog modules unless the user explicitly asks to do something different.

## Default 4-Stage Flow

1. Run scaffolding first.
   - Use `.github/prompts/VerilogModuleScaffoldCreation.prompt.md`.
   - Create a new module directory and starter files.
2. User updates the specification.
   - User edits `<module>.Specification.md` with real requirements.
3. Build tests from the specification.
   - Use the Verilog tester workflow to create or refine `<module>.test.sv` and include manifests.
   - At this stage, test failures are expected because `<module>.sv` is still a placeholder.
   - Do not implement or rewrite DUT RTL in this stage unless explicitly requested.
4. Implement RTL to pass tests.
   - Use the Verilog developer workflow to implement `<module>.sv` according to the specification.
   - Make tests pass without weakening test intent.

## Behavioral Rules

1. Treat the specification as the contract.
2. Prefer test-first behavior for new modules.
3. If tests are ambiguous or conflict with the specification, call out the ambiguity before changing behavior.
4. Do not skip the scaffold step for new modules unless the user asks to work in an existing directory.
