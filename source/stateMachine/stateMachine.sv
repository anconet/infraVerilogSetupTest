// Initial prompt: "Create a verilog module based on stateMachine.Specification.md"
// This module implements the specification-defined state transitions and done behavior.
module stateMachine (
    input  logic clock,
    input  logic resetn,
    input  logic go,
    input  logic continueSignal,
    output logic done
);

    typedef enum logic [2:0] {
        IDLE,
        ONE,
        TWO,
        PAUSE,
        THREE,
        FOUR,
        FIVE
    } stateType;

    stateType currentState;
    stateType nextState;

    // State register with asynchronous active-low reset.
    always_ff @(posedge clock or negedge resetn) begin
        if (!resetn)
            currentState <= IDLE;
        else
            currentState <= nextState;
    end

    // Next-state logic.
    always_comb begin
        nextState = currentState;

        unique case (currentState)
            IDLE: begin
                if (go)
                    nextState = ONE;
            end
            ONE: begin
                nextState = TWO;
            end
            TWO: begin
                nextState = PAUSE;
            end
            PAUSE: begin
                if (continueSignal)
                    nextState = THREE;
            end
            THREE: begin
                nextState = FOUR;
            end
            FOUR: begin
                nextState = FIVE;
            end
            FIVE: begin
                nextState = IDLE;
            end
            default: begin
                nextState = IDLE;
            end
        endcase
    end

    // done is high only while in IDLE.
    always_comb begin
        done = (currentState == IDLE);
    end

endmodule
