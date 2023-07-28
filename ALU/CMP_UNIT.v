module CMP_UNIT#(parameter inWidth=7,
                 parameter outWidth=15)(
                input wire [inWidth:0] A,
                input wire [inWidth:0] B,
                input wire [1:0] ALU_FUN,
                input CLK,RST,
                input wire CMP_Enable,
                output reg [3 : 0] CMP_OUT,
                output reg CMP_Flag // '1' while working
);
        
    always @(posedge CLK or negedge RST) begin
        if (!RST) begin
            CMP_OUT<= 16'd0;
            CMP_Flag<=1'b0;
        end
        else if (CMP_Enable==1'b1) begin
            case (ALU_FUN)
            2'b00: begin
                CMP_OUT<= 4'd0;
                CMP_Flag<=1'b1;
             end
            2'b01:begin
                CMP_Flag<=1'b1;
                CMP_OUT<=(A == B)? 4'd1 : 4'd0;
            end
            2'b10:begin
                CMP_Flag<=1'b1;
                CMP_OUT<=(A > B)? 4'd2 : 4'd0;
            end
            
            2'b11: begin
                CMP_Flag<=1'b1;
                CMP_OUT<=(A < B)? 4'd3 : 4'd0; 
            end
                default: begin
                    CMP_OUT<= 4'd0;
                    CMP_Flag<=1'b0;
                end
            endcase
        end
        else
            CMP_Flag<= 1'b0; 
    end
endmodule