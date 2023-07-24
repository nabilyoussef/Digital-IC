`timescale 1ns/1ps

module Parity_Calc_TB;

    // Inputs
    reg [7:0] P_DATA;
    reg DATA_Valid;
    reg PAR_EN;
    reg PAR_TYP;
    reg CLK;
    reg RST;

    // Outputs
    wire par_bit;

    // Instantiate the Unit Under Test (UUT)
    Parity_Calc uut (
        .P_DATA(P_DATA),
        .DATA_Valid(DATA_Valid),
        .PAR_EN(PAR_EN),
        .PAR_TYP(PAR_TYP),
        .CLK(CLK),
        .RST(RST),
        .par_bit(par_bit)
    );

    initial begin
        // Initialize inputs
        P_DATA = 8'b00000000;
        DATA_Valid = 1'b0;
        PAR_EN = 1'b0;
        PAR_TYP = 1'b0;
        CLK = 1'b1;
        RST = 1'b0;
        #10;
        RST = 1'b1;
        P_DATA = 8'b00000000;
        DATA_Valid = 1'b1;
        PAR_EN = 1'b1;
        PAR_TYP = 1'b0;
        #50;
        P_DATA = 8'b00000001;
        #50;
        PAR_TYP = 1'b1;
        P_DATA = 8'b00000000;
        #50;
        P_DATA = 8'b00000001;
        #50;
        $finish;
    end

    always #5 CLK = ~CLK;

endmodule