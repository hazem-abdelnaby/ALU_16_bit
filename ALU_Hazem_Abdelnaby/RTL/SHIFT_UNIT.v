module SHIFT_UNIT
  #(
  parameter IN_DATA_WIDTH=16,
  OUT_DATA_WIDTH=16
  )
  (
  input signed [IN_DATA_WIDTH-1:0] A,B,
  input [1:0] ALU_FUN,
  input Shift_Enable,
  input CLK,RST,
  
  output reg [OUT_DATA_WIDTH-1:0] SHIFT_OUT,
  output reg SHIFT_Flag
  );
  reg [OUT_DATA_WIDTH-1:0] SHIFT_Temp;
  reg SHIFT_Flag_Temp;
  always @ (*)
  begin
    SHIFT_Flag_Temp=1'b0;
    SHIFT_Temp='b0;
    if(Shift_Enable)
      begin
        SHIFT_Flag_Temp=1'b1;
        case(ALU_FUN [1:0])
          2'b00:
          begin
           SHIFT_Temp=A>>1; 
          end
          2'b01:
          begin
           SHIFT_Temp=A<<1; 
          end
          2'b10:
          begin
           SHIFT_Temp=B>>1; 
          end
          2'b11:
          begin
           SHIFT_Temp=B<<1; 
          end
        endcase
      end
      else
        begin
         SHIFT_Flag_Temp=1'b0;
         SHIFT_Temp='b0; 
        end
      
    
  end
  always @ (posedge CLK or negedge RST)
  begin
    if(!RST)
      begin
        SHIFT_OUT<='b0;
        SHIFT_Flag<=1'b0;
      end
    else
      begin
        SHIFT_OUT<=SHIFT_Temp;
        SHIFT_Flag<=SHIFT_Flag_Temp;
        
      end
    
  end
endmodule
