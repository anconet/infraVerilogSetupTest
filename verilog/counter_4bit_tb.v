`timescale 1ns/1ps

// default dump filename if not provided via compilation define
`ifndef VCD_FILE
`define VCD_FILE "dump.vcd"
`endif

module counter_4bit_tb;
    reg clk;
    reg rst;
    reg en;
    wire [3:0] q;

    counter_4bit #(.WIDTH(4)) uut (
        .clk(clk),
        .rst(rst),
        .en(en),
        .q(q)
    );

    initial begin
        $dumpfile(`VCD_FILE);
        $dumpvars(0, counter_4bit_tb);

        clk = 0;
        rst = 1;
        en  = 0;

        #12 rst = 0; // release reset after a couple edges
        #8  en  = 1; // enable counting
        #200 en  = 0;
        #20 $display("Test complete");
        $finish;
    end

    always #5 clk = ~clk;

    initial begin
        $monitor("%0t clk=%b rst=%b en=%b q=%b", $time, clk, rst, en, q);
    end

endmodule
