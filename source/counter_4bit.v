module counter_4bit #(
    parameter WIDTH = 4
) (
    input  wire                   clk,
    input  wire                   rst, // synchronous active-high reset
    input  wire                   en,
    output reg  [WIDTH-1:0]       q
);

    always @(posedge clk) begin
        if (rst)
            q <= {WIDTH{1'b0}};
        else if (en)
            q <= q + 1'b1;
    end

endmodule
