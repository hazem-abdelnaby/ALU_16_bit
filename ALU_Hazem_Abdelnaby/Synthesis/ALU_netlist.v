/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : O-2018.06-SP1
// Date      : Sat Aug  8 18:50:32 2026
/////////////////////////////////////////////////////////////


module ALU_TOP ( A, B, ALU_FUN, CLK, RST, Arith_OUT, Logic_OUT, CMP_OUT, 
        SHIFT_OUT, Arith_Flag, Logic_Flag, CMP_Flag, SHIFT_Flag );
  input [15:0] A;
  input [15:0] B;
  input [3:0] ALU_FUN;
  output [15:0] Arith_OUT;
  output [15:0] Logic_OUT;
  output [1:0] CMP_OUT;
  output [15:0] SHIFT_OUT;
  input CLK, RST;
  output Arith_Flag, Logic_Flag, CMP_Flag, SHIFT_Flag;
  wire   Arith_Enable, Logic_Enable, CMP_Enable, Shift_Enable;

  ARITHMETIC_UNIT U1 ( .A(A), .B(B), .ALU_FUN(ALU_FUN[1:0]), .Arith_Enable(
        Arith_Enable), .CLK(CLK), .RST(RST), .Arith_Flag(Arith_Flag), 
        .Arith_OUT(Arith_OUT) );
  LOGIC_UNIT U2 ( .A(A), .B(B), .Logic_Enable(Logic_Enable), .ALU_FUN(
        ALU_FUN[1:0]), .CLK(CLK), .RST(RST), .Logic_OUT(Logic_OUT), 
        .Logic_Flag(Logic_Flag) );
  CMP_UNIT U3 ( .A(A), .B(B), .ALU_FUN(ALU_FUN[1:0]), .CMP_Enable(CMP_Enable), 
        .CLK(CLK), .RST(RST), .CMP_OUT(CMP_OUT), .CMP_Flag(CMP_Flag) );
  SHIFT_UNIT U4 ( .A(A), .B(B), .ALU_FUN(ALU_FUN[1:0]), .Shift_Enable(
        Shift_Enable), .CLK(CLK), .RST(RST), .SHIFT_OUT(SHIFT_OUT), 
        .SHIFT_Flag(SHIFT_Flag) );
  Decoder U5 ( .ALU_FUN_OP(ALU_FUN[3:2]), .Arith_Enable(Arith_Enable), 
        .Logic_Enable(Logic_Enable), .CMP_Enable(CMP_Enable), .Shift_Enable(
        Shift_Enable) );
endmodule

