`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/30/2023 02:06:14 AM
// Design Name: 
// Module Name: register
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module reg8x16(
    input wire [15:0] WrData,
    input wire [2:0] Address, // we have 8 regs
    input wire WrEn,RdEn,
    input wire CLK,RST,
    output reg [15:0] RdData
);

reg [15:0] regz [7:0]; // array for registers
// each reg is bits and they are 8 regs
always @(posedge CLK or negedge RST) begin
    if (!RST) begin
        RdData <= 16'b0;
    end
    else if ( (WrEn==1'b1) && (RdEn==1'b0) ) begin
        regz[Address] = WrData;
    end
    else if ( (WrEn==1'b0) && (RdEn==1'b1) ) begin
        RdData <= regz[Address];
    end
end

endmodule
