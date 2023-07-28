module LOGIC_UNIT#(parameter inWidth=7,
                   parameter outWidth=15)(
                input wire [inWidth:0] A,
                input wire [inWidth:0] B,
                input wire [1:0] ALU_FUN,
                input CLK,RST,
                input wire Logic_Enable,
                output reg [outWidth:0] Logic_OUT,
                output reg Logic_Flag // '1' while working
);
        
    always @(posedge CLK or negedge RST) begin
        if (!RST) begin
            Logic_OUT<= 16'd0;
            Logic_Flag<=1'b0;
        end
        else if (Logic_Enable==1'b1) begin
            case (ALU_FUN)
            2'b00: begin
                Logic_OUT<= (A & B);
                Logic_Flag<=1'b1;
             end
            2'b01:begin
                Logic_OUT<= (A | B);
                Logic_Flag<=1'b1;
            end
            2'b10:begin
                Logic_OUT<= ~(A & B);
                Logic_Flag<=1'b1;
            end
            
            2'b11: begin
                Logic_OUT<= ~(A | B);
                Logic_Flag<=1'b1; 
            end
                default: begin
                    Logic_OUT<= 16'b0;
                    Logic_Flag<=1'b0;
                end
            endcase
        end
        else
            Logic_Flag<=1'b0; 
    end
endmodule