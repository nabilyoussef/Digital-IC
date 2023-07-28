`timescale 1ns/1ns
module test();
reg [8-1 : 0] A;
reg [8-1 : 0] B;
reg [3:0] ALU_FUN;
reg CLK, RST;
wire Arith_Enable,Logic_Enable,CMP_Enable,Shift_Enable;
wire [16-1:0] Arith_OUT;
wire Carry_OUT,Arith_Flag;
wire [16-1:0] Logic_OUT;
wire Logic_Flag;
wire [4-1:0] CMP_OUT;
wire CMP_Flag;
wire [16-1:0] SHIFT_OUT;
wire SHIFT_Flag;

ALU_TOP DUT (
    .A(A),.B(B), // comman
    .ALU_FUN(ALU_FUN),
    .CLK(CLK),.RST(RST),
    .Arith_Enable(Arith_Enable),
    .Logic_Enable(Logic_Enable),
    .CMP_Enable(CMP_Enable),
    .Shift_Enable(Shift_Enable),
    .Arith_OUT(Arith_OUT),
    .Carry_OUT (Carry_OUT),
    .Arith_Flag (Arith_Flag),
    .Logic_OUT(Logic_OUT),
    .Logic_Flag (Logic_Flag),
    .CMP_OUT(CMP_OUT),
    .CMP_Flag (CMP_Flag),
    .SHIFT_OUT(SHIFT_OUT),
    .SHIFT_Flag (SHIFT_Flag)
);
initial begin
    A <= 8'b01010101;
    B <= 8'b00110011;
    RST<= 1'b0;
    #20000;
    RST<= 1'b1;

    //Arith unit
    ALU_FUN <= 4'b0000; //add
    #20000;
    ALU_FUN <= 4'b0001; //sub
    #20000;
    ALU_FUN <= 4'b0010; //multi
    #20000;
    ALU_FUN <= 4'b0011; //division
    #20000;
    //Logic unit
    ALU_FUN <= 4'b0100; //and
    #20000;
    ALU_FUN <= 4'b0101; //or
    #20000;
    ALU_FUN <= 4'b0110; //nand
    #20000;
    ALU_FUN <= 4'b0111; //nor
    #20000;
    //CMP unit
    ALU_FUN <= 4'b1000; //nop
    #20000;
    ALU_FUN <= 4'b1001; //=
    #20000;
    ALU_FUN <= 4'b1010; //>
    #20000;
    ALU_FUN <= 4'b1011; //<
    #20000;
    // shift unit
    ALU_FUN <= 4'b1100; //A>>1
    #20000;
    ALU_FUN <= 4'b1101; //A<<1
    #20000;
    ALU_FUN <= 4'b1110; //B>>1
    #20000;
    ALU_FUN <= 4'b1111; //B<<1
    #20000;
    RST<=0;
    #20000;
    $finish;
end
always  begin
    CLK=1'b1;
    #6000;
    CLK=1'b0;
    #4000;
end




endmodule