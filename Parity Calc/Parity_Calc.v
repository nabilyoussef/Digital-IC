`timescale 1ns / 1ps
module Parity_Calc(
    input wire [7:0] P_DATA,
    input wire DATA_Valid,
    input wire PAR_EN,
    input wire PAR_TYP, // '0' even, '1' odd
    input CLK,RST,
    output reg par_bit);
 always @(posedge CLK or negedge RST) begin 
    if (!RST)
        par_bit <= 1'd0;
    else if (DATA_Valid && PAR_EN) begin // if both are onez 
        if (( PAR_TYP && (^P_DATA)) || (~PAR_TYP && (~^P_DATA))) begin
        // ^P_DATA is 1 >> odd Ones 
        //            0 >> even ones
        par_bit <= 1'd0; 
        end 
        else par_bit <= 1'd1;
    end
    else par_bit <= par_bit ;
 
 end
 
 
endmodule