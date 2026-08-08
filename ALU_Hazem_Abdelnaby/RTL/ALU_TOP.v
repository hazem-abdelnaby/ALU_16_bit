module ALU_TOP
#(
parameter IN_DATA_WIDTH=16,
  OUT_DATA_WIDTH_Arith=32,
  OUT_DATA_WIDTH_Logic=16,
  OUT_DATA_WIDTH_CMP=2,
  OUT_DATA_WIDTH_SHIFT=16
)
(
input [IN_DATA_WIDTH-1:0] A,B,
input [3:0] ALU_FUN,
input CLK,RST,

output  [OUT_DATA_WIDTH_Arith-1:0] Arith_OUT,
output  [OUT_DATA_WIDTH_Logic-1:0] Logic_OUT,
output  [OUT_DATA_WIDTH_CMP-1:0] CMP_OUT,
output  [OUT_DATA_WIDTH_SHIFT-1:0] SHIFT_OUT,

output  Arith_Flag,Logic_Flag,CMP_Flag,SHIFT_Flag

);

wire Arith_Enable, Logic_Enable, CMP_Enable, Shift_Enable;

ARITHMETIC_UNIT 
#(
.IN_DATA_WIDTH (IN_DATA_WIDTH),
.OUT_DATA_WIDTH (OUT_DATA_WIDTH_Arith)
)U1
(
.A (A),
.B (B),
.CLK (CLK),
.RST (RST),
.ALU_FUN (ALU_FUN[1:0]),
.Arith_OUT (Arith_OUT),
.Arith_Flag (Arith_Flag),
.Arith_Enable (Arith_Enable)
);


LOGIC_UNIT
#(
.IN_DATA_WIDTH (IN_DATA_WIDTH),
.OUT_DATA_WIDTH (OUT_DATA_WIDTH_Logic)
)U2
(
.A (A),
.B (B),
.CLK (CLK),
.RST (RST),
.ALU_FUN (ALU_FUN[1:0]),
.Logic_OUT (Logic_OUT),
.Logic_Enable (Logic_Enable),
.Logic_Flag (Logic_Flag)

);


CMP_UNIT
#(
.IN_DATA_WIDTH (IN_DATA_WIDTH),
.OUT_DATA_WIDTH (OUT_DATA_WIDTH_CMP)
)U3
(
.A (A),
.B (B),
.CLK (CLK),
.RST (RST),
.ALU_FUN (ALU_FUN[1:0]),
.CMP_OUT (CMP_OUT),
.CMP_Enable (CMP_Enable),
.CMP_Flag (CMP_Flag)
);



SHIFT_UNIT
#(
.IN_DATA_WIDTH (IN_DATA_WIDTH),
.OUT_DATA_WIDTH (OUT_DATA_WIDTH_SHIFT)
)U4
(
.A (A),
.B (B),
.CLK (CLK),
.RST (RST),
.ALU_FUN (ALU_FUN[1:0]),
.SHIFT_OUT (SHIFT_OUT),
.SHIFT_Flag (SHIFT_Flag),
.Shift_Enable (Shift_Enable)
);



Decoder U5
(
.ALU_FUN_OP (ALU_FUN[3:2]),
.Arith_Enable (Arith_Enable),
.Logic_Enable (Logic_Enable),
.CMP_Enable (CMP_Enable),
.Shift_Enable (Shift_Enable)
);
endmodule
