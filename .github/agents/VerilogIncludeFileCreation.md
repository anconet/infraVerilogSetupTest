# Introduction
This file defines the rules for creating the JSON based verilog include file manifest.

# Assumptions
This file used by https://github.com/anconet/infraVerilogSetup.git/build.py.

The include file is a manifest for a testbench with the possible name <moduleName>.test.sv.

## Rules for creating the include file manifest

- The file name should be <moduleName>.include.json, where <moduleName> is the name of the module being tested. For example, if the module being tested is named "adder", the include file should be named "adder.include.json".

- The include file should be a JSON file with the following structure:
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
where testBenchFile is the name of the test bench file, moduleName is the name of the module being tested, and include is an array of file names that should be included in the test bench. The files listed in the include array should be the files that are needed to compile and run the test bench successfully. Make sure to include all necessary files to avoid compilation errors when running the test bench.

