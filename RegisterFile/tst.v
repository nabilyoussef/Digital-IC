`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/30/2023 02:08:01 AM
// Design Name: 
// Module Name: tst
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


module tb();
    reg [15:0] WrData;
    reg [2:0] Address; // we have 8 regs
    reg WrEn,RdEn;
    reg CLK,RST;
    wire [15:0] RdData;
reg8x16 DUT (
.WrData(WrData),
.Address(Address),
.WrEn(WrEn),
.RdEn(RdEn),
.CLK(CLK),
.RST(RST),
.RdData(RdData)
);
    initial begin
        CLK=0;
        RST=1'b0;
        #10;
        RST=1'b1;
        #10;
        WrData<=16'd33;
        //////
        WrEn=1'b1;
        RdEn=1'b0;
        Address=3'd1;
        #20;
        WrData<=16'd34;
        Address=3'd4;
        #20;
        WrData<=16'd35;
        Address=3'd2;
        #20;
        ////////////
        WrEn=1'b0;
        RdEn=1'b1;
        Address =3'd1;
        #20;
        Address=3'd4;
        #20;
        Address=3'd2;
        #20;
        $finish;
        
    end
    always begin
        #5 CLK=~CLK;
    end
endmodule