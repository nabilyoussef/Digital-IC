module ARITHMETIC_UNIT#(parameter inWidth=7,
                        parameter outWidth=15)
(
                input wire [inWidth:0] A,
                input wire [inWidth:0] B,
                input wire [1:0] ALU_FUN,
                input CLK,RST,
                input wire Arith_Enable,
                output reg [outWidth:0] Arith_OUT,
                output reg Carry_OUT,
                output reg Arith_Flag // '1' while working
);
    
    always @(posedge CLK or negedge RST) begin
        if (!RST) begin
            Arith_OUT<= 16'd0;
            Carry_OUT<=1'b0;
            Arith_Flag<=1'b0;
        end
        else if (Arith_Enable==1'b1) begin
            case (ALU_FUN)
            2'b00: begin
                Arith_OUT<= A + B;
                Carry_OUT<= Arith_OUT[inWidth+1];
                Arith_Flag<=1;
             end
            2'b01:begin
                Arith_OUT<= A - B;
                Carry_OUT<= 1'b0;
                Arith_Flag<=1'b1;
            end
            2'b10:begin
                Arith_OUT<= A * B;
                Carry_OUT<= 1'b0;
                Arith_Flag<=1'b1;
            end
            
            2'b11: begin
                Arith_OUT<= A / B;
                Carry_OUT<= 1'b0;
                Arith_Flag<=1'b1; 
            end
                default: begin
                    Arith_OUT<= 16'b0;
                    Carry_OUT<= 1'b0;
                    Arith_Flag<=1'b0;
                end
            endcase
        end
        else
                Arith_Flag<=1'b0; 
    end
endmodule