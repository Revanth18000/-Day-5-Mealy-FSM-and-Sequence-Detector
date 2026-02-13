module seq_fsm(
    input clk,
    input reset,
    input din,
    output reg detect
);

parameter S0 = 2'b00;
parameter S1 = 2'b01;
parameter S2 = 2'b10;

reg [1:0] state;

always @(posedge clk) begin
    if (reset)
        state <= S0;
    else begin
        case(state)
            S0: if (din) state <= S1; else state <= S0;
            S1: if (!din) state <= S2; else state <= S1;
            S2: if (din) state <= S1; else state <= S0;
            default: state <= S0;
        endcase
    end
end

always @(*) begin
    if (state == S2 && din)
        detect = 1;
    else
        detect = 0;
end

endmodule
