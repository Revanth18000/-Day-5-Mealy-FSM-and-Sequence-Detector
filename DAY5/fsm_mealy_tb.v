module fsm_mealy_tb;
reg clk;
reg reset;
reg x;
wire y ;

fsm_mealy uut(.clk(clk) , .reset(reset) , .x(x) , .y(y)  );

always #5 clk = ~clk ;
initial begin 
    clk =0 ;
    reset = 1;
    x =0 ;

    #20 reset = 0;
    #20 x = 1;
    #20 x = 0 ;
    #10 x = 1;

    #30 $finish;
end
endmodule