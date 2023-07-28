module SHIFT_UNIT#(parameter Width=7,
                   parameter outWidth=15)(
                input wire [Width:0] A,
                input wire [Width:0] B,
                input wire [1:0] ALU_FUN,
                input CLK,RST,
                input wire Shift_Enable,
                output reg [outWidth:0] SHIFT_OUT,
                output reg SHIFT_Flag // '1' while working
);
        
    always @(posedge CLK or negedge RST) begin
        if (!RST) begin
            SHIFT_OUT<= 16'd0;
            SHIFT_Flag<=1'b0;
        end
        else if (Shift_Enable==1'b1) begin
            case (ALU_FUN)
            2'b00: begin
                SHIFT_OUT<= (A >> 1);
                SHIFT_Flag<=1'b1;
             end
            2'b01:begin
                SHIFT_OUT<= (A << 1);
                SHIFT_Flag<=1'b1;
            end
            2'b10:begin
                SHIFT_OUT<= (B >> 1);
                SHIFT_Flag<=1'b1;
            end
            
            2'b11: begin
                SHIFT_OUT<= (B << 1);
                SHIFT_Flag<=1'b1; 
            end
                default: begin
                    SHIFT_OUT<= 16'd0;
                    SHIFT_Flag<=1'b0;
                end
            endcase
        end
        else
            SHIFT_Flag<=1'b0;
    end
endmodule