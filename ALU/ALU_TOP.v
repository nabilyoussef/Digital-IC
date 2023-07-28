module ALU_TOP#(parameter inWidth = 8,
                parameter outWidth = 16)
(
    input wire [inWidth-1 : 0] A,B,
    input wire [3:0] ALU_FUN,
    input CLK, RST,

    inout Arith_Enable,Logic_Enable,CMP_Enable,Shift_Enable,

    output wire [outWidth-1:0] Arith_OUT,
    output wire Carry_OUT,Arith_Flag,
    output wire [outWidth-1:0] Logic_OUT,
    output wire Logic_Flag,
    output wire [4-1:0] CMP_OUT,
    output wire CMP_Flag,
    output wire [outWidth-1:0] SHIFT_OUT,
    output wire SHIFT_Flag
);

Decoder_Unit u0 (
    .ALU_FUN(ALU_FUN[3:2]),
    .CLK(CLK),.RST(RST),
    .Arith_Enable(Arith_Enable),
    .Logic_Enable(Logic_Enable),
    .CMP_Enable(CMP_Enable),
    .Shift_Enable(Shift_Enable)
);
ARITHMETIC_UNIT u1 (
    .A(A), .B(B),
    .ALU_FUN(ALU_FUN [1:0]),
    .CLK(CLK),.RST(RST),
    .Arith_Enable(Arith_Enable),
    .Arith_OUT(Arith_OUT),
    .Carry_OUT (Carry_OUT),
    .Arith_Flag (Arith_Flag)
);
LOGIC_UNIT u2 (
    .A(A), .B(B),
    .ALU_FUN(ALU_FUN [1:0]),
    .CLK(CLK),.RST(RST),
    .Logic_Enable(Logic_Enable),
    .Logic_OUT(Logic_OUT),
    .Logic_Flag (Logic_Flag)
);
CMP_UNIT u3 (
    .A(A), .B(B),
    .ALU_FUN(ALU_FUN [1:0]),
    .CLK(CLK),.RST(RST),
    .CMP_Enable(CMP_Enable),
    .CMP_OUT(CMP_OUT),
    .CMP_Flag (CMP_Flag)
);
SHIFT_UNIT u4 (
    .A(A), .B(B),
    .ALU_FUN(ALU_FUN [1:0]),
    .CLK(CLK),.RST(RST),
    .Shift_Enable(Shift_Enable),
    .SHIFT_OUT(SHIFT_OUT),
    .SHIFT_Flag (SHIFT_Flag)
);
endmodule