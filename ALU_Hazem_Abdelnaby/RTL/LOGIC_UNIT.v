module LOGIC_UNIT
#(
parameter IN_DATA_WIDTH=16,
OUT_DATA_WIDTH=16
)
(
input signed [IN_DATA_WIDTH-1:0] A,B,
input Logic_Enable,
input [1:0] ALU_FUN,
input CLK,RST, 

output reg [OUT_DATA_WIDTH-1:0] Logic_OUT,
output reg Logic_Flag

);

reg [OUT_DATA_WIDTH-1:0] Logic_Temp;
reg Logic_Flag_Temp;
always @(*)
begin
  Logic_Temp='b0;
  Logic_Flag_Temp=1'b0;
  
  if(Logic_Enable)
    begin
      Logic_Flag_Temp=1'b1;
      case(ALU_FUN[1:0])
        2'b00:
        begin
          Logic_Temp=A&B;
          
        end
        2'b01:
        begin
          Logic_Temp=A|B;
          
        end
        2'b10:
        begin
          Logic_Temp=~(A&B);
          
        end
        2'b11:
        begin
          Logic_Temp=~(A|B);
          
        end
      endcase
    end
    else
      begin
        Logic_Temp='b0;
        Logic_Flag_Temp=1'b0;
      end  
  
end

always @ (posedge CLK or negedge RST)
begin
  if(!RST)
    begin
      Logic_OUT<='b0;
      Logic_Flag<=1'b0;
    end
  else
    begin
      Logic_OUT<=Logic_Temp;
      Logic_Flag<=Logic_Flag_Temp;
    end
  
  
end
endmodule