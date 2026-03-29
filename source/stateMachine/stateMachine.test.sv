`timescale 1ns/1ps

`ifndef VCD_FILE
`define VCD_FILE "dump.vcd"
`endif

module stateMachine_test;
    logic clock;
    logic resetn;
    logic go;
    logic continueSignal;
    logic done;

    typedef enum logic [2:0] {
        IDLE,
        ONE,
        TWO,
        PAUSE,
        THREE,
        FOUR,
        FIVE
    } state_t;

    state_t expected_state;
    int pass_count;

    stateMachine dut (
        .clock(clock),
        .resetn(resetn),
        .go(go),
        .continueSignal(continueSignal),
        .done(done)
    );

    always #5 clock = ~clock;

    // Clocked reference model to predict expected done behavior.
    always_ff @(posedge clock or negedge resetn) begin
        if (!resetn) begin
            expected_state <= IDLE;
        end else begin
            unique case (expected_state)
                IDLE:  expected_state <= go ? ONE : IDLE;
                ONE:   expected_state <= TWO;
                TWO:   expected_state <= PAUSE;
                PAUSE: expected_state <= continueSignal ? THREE : PAUSE;
                THREE: expected_state <= FOUR;
                FOUR:  expected_state <= FIVE;
                FIVE:  expected_state <= IDLE;
                default: expected_state <= IDLE;
            endcase
        end
    end

    task automatic check_done(string label);
        logic expected_done;
        begin
            #1;
            expected_done = (expected_state == IDLE);
            if (done !== expected_done) begin
                $error("%s failed at t=%0t: done=%0b expected=%0b", label, $time, done, expected_done);
                $fatal(1);
            end
            pass_count = pass_count + 1;
            $display("PASS %-32s t=%0t done=%0b state=%0d", label, $time, done, expected_state);
        end
    endtask

    initial begin
        $dumpfile(`VCD_FILE);
        $dumpvars(0, stateMachine_test);

        clock = 1'b0;
        resetn = 1'b0;
        go = 1'b0;
        continueSignal = 1'b0;
        pass_count = 0;

        // Verify reset forces IDLE and done=1.
        repeat (2) begin
            @(posedge clock);
            check_done("reset keeps done high");
        end

        resetn = 1'b1;

        // Stay in IDLE without go.
        repeat (2) begin
            @(posedge clock);
            check_done("idle hold without go");
        end

        // Kick off first transaction.
        go = 1'b1;
        @(posedge clock);
        check_done("go transition IDLE->ONE");
        go = 1'b0;

        @(posedge clock);
        check_done("ONE->TWO done low");
        @(posedge clock);
        check_done("TWO->PAUSE done low");

        // Hold in PAUSE while continueSignal is low.
        repeat (3) begin
            @(posedge clock);
            check_done("pause hold continue low");
        end

        // Resume and run through to IDLE.
        continueSignal = 1'b1;
        @(posedge clock);
        check_done("PAUSE->THREE");
        continueSignal = 1'b0;

        @(posedge clock);
        check_done("THREE->FOUR");
        @(posedge clock);
        check_done("FOUR->FIVE");
        @(posedge clock);
        check_done("FIVE->IDLE done high");

        // Ensure IDLE is sticky without go.
        repeat (2) begin
            @(posedge clock);
            check_done("idle hold after sequence");
        end

        // Start a second transaction as a regression check.
        go = 1'b1;
        @(posedge clock);
        check_done("second go IDLE->ONE");
        go = 1'b0;

        @(posedge clock);
        check_done("second ONE->TWO");
        @(posedge clock);
        check_done("second TWO->PAUSE");

        continueSignal = 1'b1;
        @(posedge clock);
        check_done("second PAUSE->THREE");
        continueSignal = 1'b0;

        @(posedge clock);
        check_done("second THREE->FOUR");
        @(posedge clock);
        check_done("second FOUR->FIVE");
        @(posedge clock);
        check_done("second FIVE->IDLE");

        $display("All checks passed (%0d assertions).", pass_count);
        $finish;
    end

endmodule