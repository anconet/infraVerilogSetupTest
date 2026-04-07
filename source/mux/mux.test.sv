`timescale 1ns/1ps

module mux_test;
    logic Select;
    logic InputA;
    logic InputB;
    logic OutputC;

    mux dut (
        .Select(Select),
        .InputA(InputA),
        .InputB(InputB),
        .OutputC(OutputC)
    );

    initial begin
        Select = 1'b0;
        InputA = 1'b0;
        InputB = 1'b0;

        // Select=0 should route InputB.
        #1;
        if (OutputC !== 1'b0) $fatal(1, "FAIL: Select=0, InputB=0, expected OutputC=0, got %b", OutputC);

        InputA = 1'b1;
        InputB = 1'b0;
        #1;
        if (OutputC !== 1'b0) $fatal(1, "FAIL: Select=0, InputB=0, expected OutputC=0, got %b", OutputC);

        InputA = 1'b0;
        InputB = 1'b1;
        #1;
        if (OutputC !== 1'b1) $fatal(1, "FAIL: Select=0, InputB=1, expected OutputC=1, got %b", OutputC);

        // Select=1 should route InputA.
        Select = 1'b1;
        InputA = 1'b0;
        InputB = 1'b1;
        #1;
        if (OutputC !== 1'b0) $fatal(1, "FAIL: Select=1, InputA=0, expected OutputC=0, got %b", OutputC);

        InputA = 1'b1;
        InputB = 1'b0;
        #1;
        if (OutputC !== 1'b1) $fatal(1, "FAIL: Select=1, InputA=1, expected OutputC=1, got %b", OutputC);

        // Toggle select with fixed inputs to verify source switching.
        InputA = 1'b1;
        InputB = 1'b0;
        Select = 1'b0;
        #1;
        if (OutputC !== 1'b0) $fatal(1, "FAIL: Select toggle low, expected OutputC=InputB=0, got %b", OutputC);

        Select = 1'b1;
        #1;
        if (OutputC !== 1'b1) $fatal(1, "FAIL: Select toggle high, expected OutputC=InputA=1, got %b", OutputC);

        $display("PASS: mux directed tests completed successfully.");
        $finish;
    end
endmodule
