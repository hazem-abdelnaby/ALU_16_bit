  module ARITHMETIC_UNIT  
  #(
  parameter IN_DATA_WIDTH=16,
  OUT_DATA_WIDTH=32
  )
  (
  input signed [IN_DATA_WIDTH-1:0] A,B,
  input [1:0] ALU_FUN,
  input Arith_Enable,
  input CLK,RST,
  
  output reg Arith_Flag ,
  output reg [OUT_DATA_WIDTH-1:0] Arith_OUT
  
  );
  reg [OUT_DATA_WIDTH-1:0] Arith_Temp;
  reg Arith_Flag_Temp;

  always @ (*)
  begin
    Arith_Temp='b0;
    Arith_Flag_Temp=1'b0;
    if(Arith_Enable)
      begin
    Arith_Flag_Temp=1'b1;
    case(ALU_FUN[1:0])
      2'b00:
      begin
        Arith_Temp=A+B;
      end
      2'b01:
      begin
        Arith_Temp=A-B;
      end
      2'b10:
      begin
        Arith_Temp=A*B;
      end
      2'b11:
          begin
        if(B=='b0)
          Arith_Temp='b0;
        else
          Arith_Temp=A/B;
          end
        endcase
      end
    else
      begin
    Arith_Temp='b0;
    Arith_Flag_Temp=1'b0;
      end
    
  end
  always @ (posedge CLK or negedge RST)
begin
  if(!RST)
    begin
  Arith_OUT<='b0;
  Arith_Flag<= 1'b0;
    end
  else
    begin
      Arith_OUT<=Arith_Temp;
      Arith_Flag<=Arith_Flag_Temp;
      
    end 
end

endmodule
