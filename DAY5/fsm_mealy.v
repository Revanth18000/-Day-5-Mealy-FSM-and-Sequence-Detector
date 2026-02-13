module fsm_mealy(
    input clk ,
    input reset ,
    input x ,

    output reg y 
);

parameter s0 = 1'b0;
parameter s1 =  1'b1;

reg state ;

always @(posedge clk ) begin
    if(reset)
        state <=0 ;
    else begin
        case(state)
            s0: begin
                    if(x)
                        state <= s1;
                    else
                        state <= s0 ;
                end
            s1 :state <= s0;
        endcase
    end
end
always @(*) begin
    case(state)
        s0 : y = x ? 1 : 0;
        s1 : y = 0 ;
    endcase
end
endmodule