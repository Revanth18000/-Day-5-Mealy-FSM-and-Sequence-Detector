module seq_fsm_tb;

reg clk;
reg reset;
reg din;
wire detect;

seq_fsm uut (
    .clk(clk),
    .reset(reset),
    .din(din),
    .detect(detect)
);

always #5 clk = ~clk;

initial begin
    clk = 0;
    reset = 1;
    din = 0;

    #10 reset = 0;

    #10 din = 1;
    #10 din = 0;
    #10 din = 1;   // <<< detect should go HIGH here

    #10 din = 0;
    #10 din = 1;
    #10 din = 1;

    #30 $finish;
end

endmodule
