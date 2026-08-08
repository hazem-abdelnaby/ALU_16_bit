module CMP_UNIT
#(
parameter IN_DATA_WIDTH=16,
OUT_DATA_WIDTH=2
)
(
input signed [IN_DATA_WIDTH-1:0] A,B,
input [1:0] ALU_FUN,
input CMP_Enable,
input CLK,RST,

output reg [OUT_DATA_WIDTH-1:0] CMP_OUT,
output reg CMP_Flag
);
reg [OUT_DATA_WIDTH-1:0] CMP_Temp;
reg  CMP_Flag_Temp;

always @ (*)
begin
  CMP_Temp='b0;
  CMP_Flag_Temp=1'b0;
  
  if(CMP_Enable)
    begin
     CMP_Flag_Temp=1'b1;
     case(ALU_FUN [1:0])
     2'b00:CMP_Temp='d0;
     2'b01:
      begin
        if(A==B)
          CMP_Temp='d1;
        else
          CMP_Temp='d0;
     
      end 
      2'b10:
      begin
        if(A>B)
          CMP_Temp='d2;
        else
          CMP_Temp='d0;
     
      end
      2'b11:
      begin
        if(A<B)
          CMP_Temp='d3;
        else
          CMP_Temp='d0;
     
      end
    endcase
      
    end
  else
    begin
    CMP_Temp='b0;
    CMP_Flag_Temp=1'b0;
    end
  
end

always @ (posedge CLK or negedge RST)
begin
  if(!RST)
    begin
      CMP_OUT<='b0;
      CMP_Flag<=1'b0;
    end
  else
    begin
      CMP_OUT<=CMP_Temp;
      CMP_Flag<=CMP_Flag_Temp;
    end
  
  
end
endmodule
