module mux (
    input  logic Select,
    input  logic InputA,
    input  logic InputB,
    output logic OutputC
);

    always_comb begin
        if (Select) begin
            OutputC = InputA;
        end else begin
            OutputC = InputB;
        end
    end

endmodule
