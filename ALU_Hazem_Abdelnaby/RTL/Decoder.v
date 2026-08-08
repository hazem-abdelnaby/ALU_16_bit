module Decoder 
  (
  input [1:0] ALU_FUN_OP,
  output reg Arith_Enable,Logic_Enable,CMP_Enable,Shift_Enable 
  );
always @(*)
begin
Arith_Enable=1'b0;
Logic_Enable=1'b0;
CMP_Enable=1'b0;
Shift_Enable=1'b0;
 
  case(ALU_FUN_OP [1:0])
      2'b00:Arith_Enable=1'b1;
      2'b01:Logic_Enable=1'b1;
      2'b10:CMP_Enable=1'b1;
      2'b11:Shift_Enable=1'b1;
endcase
  
end 
endmodule