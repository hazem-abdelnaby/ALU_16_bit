`timescale 1us/1ns
module ALU_signed_16b_tb
 #(
 parameter IN_DATA_WIDTH_tb=16,
  OUT_DATA_WIDTH_Arith_tb=32,
  OUT_DATA_WIDTH_Logic_tb=16,
  OUT_DATA_WIDTH_CMP_tb=2,
  OUT_DATA_WIDTH_SHIFT_tb=16
 )();
  reg signed [IN_DATA_WIDTH_tb-1:0] A_tb,B_tb;
  reg [3:0] ALU_FUN_tb;
  reg CLK_tb,RST_tb;
  wire signed [OUT_DATA_WIDTH_Arith_tb-1:0] Arith_OUT_tb;
  wire [OUT_DATA_WIDTH_Logic_tb-1:0] Logic_OUT_tb;
  wire [OUT_DATA_WIDTH_CMP_tb-1:0] CMP_OUT_tb;
  wire [OUT_DATA_WIDTH_SHIFT_tb-1:0] SHIFT_OUT_tb;

  wire Arith_Flag_tb,Logic_Flag_tb,CMP_Flag_tb,Shift_Flag_tb;


initial 
begin
  $dumpfile("ALU_signed_16b.vcd");
  $dumpvars;
  
  A_tb='b0;
  B_tb='b0;
  CLK_tb=1'b0;
  RST_tb=1'b0;
  ALU_FUN_tb=4'b0000;
  
  #10
  RST_tb=1'b1;
  
  /*-----------------------------------------------------------------------------------------------------------*/
    //test 1 Signed Arithmetic Addition: A is Negative & B is Negative
  
  A_tb=-14;
  B_tb=-16;
  
  #10
  
  if(Arith_OUT_tb==-30)
    $display("%0d + %0d =%0d correct",A_tb,B_tb,Arith_OUT_tb);
    
  else
    $display("%0d + %0d =%0d INCORRECT XXXXX",A_tb,B_tb,Arith_OUT_tb);
    
/*-------------------------------------------------------------------------------------------------------------- */

  // test 2 Signed Arithmetic Addition: A is Positive & B is Negative 
  A_tb=14;
  B_tb=-16;
  
  #10
  
  if(Arith_OUT_tb==-2)
    $display("%0d + %0d =%0d correct",A_tb,B_tb,Arith_OUT_tb);
    
  else
    $display("%0d + %0d =%0d INCORRECT XXXXX",A_tb,B_tb,Arith_OUT_tb);
/*-------------------------------------------------------------------------------------------------------------- */

  // test 3 Signed Arithmetic Addition: A is Negative & B is Positive 
 
  A_tb=-14;
  B_tb=16;
  
  #10
  
  if(Arith_OUT_tb==2)
    $display("%0d + %0d =%0d correct",A_tb,B_tb,Arith_OUT_tb);
    
  else
    $display("%0d + %0d =%0d INCORRECT XXXXX",A_tb,B_tb,Arith_OUT_tb);

/*-------------------------------------------------------------------------------------------------------------- */

  // test 4  Signed Arithmetic Addition: A is Positive & B is Positive 

  A_tb=14;
  B_tb=16;
  
  #10
  
  if(Arith_OUT_tb==30 )
    $display("%0d + %0d =%0d correct",A_tb,B_tb,Arith_OUT_tb);
    
  else
    $display("%0d + %0d =%0d INCORRECT XXXXX",A_tb,B_tb,Arith_OUT_tb);
    
/*-------------------------------------------------------------------------------------------------------------- */ 
  
   //test 5 Signed Arithmetic Subtraction: A is Negative & B is Negative
  A_tb=-19;
  B_tb=-13;
  ALU_FUN_tb=4'b0001;
  #10
  
  if(Arith_OUT_tb==-6 )
    $display("%0d - %0d =%0d correct",A_tb,B_tb,Arith_OUT_tb);
    
  else
    $display("%0d - %0d =%0d INCORRECT XXXXX",A_tb,B_tb,Arith_OUT_tb);

/*-------------------------------------------------------------------------------------------------------------- */ 
  
   //test 6 Signed Arithmetic Subtraction: A is Positive & B is Negative 

  A_tb=19;
  B_tb=-13;
  #10
  
  if(Arith_OUT_tb==32 )
    $display("%0d - %0d =%0d correct",A_tb,B_tb,Arith_OUT_tb);
    
  else
    $display("%0d - %0d =%0d INCORRECT XXXXX",A_tb,B_tb,Arith_OUT_tb);
    

/*-------------------------------------------------------------------------------------------------------------- */ 
  
   //test 7 Signed Arithmetic Subtraction: A is Negative & B is Positive 

  A_tb=-19; 
  B_tb=13;
  #10
  
  if(Arith_OUT_tb==-32 )
    $display("%0d - %0d =%0d correct",A_tb,B_tb,Arith_OUT_tb);
    
  else
    $display("%0d - %0d =%0d INCORRECT XXXXX",A_tb,B_tb,Arith_OUT_tb); 
    
/*-------------------------------------------------------------------------------------------------------------- */ 
  
   //test 8 Signed Arithmetic Subtraction: A is Positive & B is Positive 
 

  A_tb=19; 
  B_tb=13;
  #10
  
  if(Arith_OUT_tb==6 )
    $display("%0d - %0d =%0d correct",A_tb,B_tb,Arith_OUT_tb);
    
  else
    $display("%0d - %0d =%0d INCORRECT XXXXX",A_tb,B_tb,Arith_OUT_tb); 
    
/*-------------------------------------------------------------------------------------------------------------- */ 
  
   //test 9 Signed Arithmetic Multiplication: A is Negative & B is Negative 
 

  A_tb=-5; 
  B_tb=-3;
  ALU_FUN_tb=4'b0010;
  #10
  
  if(Arith_OUT_tb==15 )
    $display("%0d * %0d =%0d correct",A_tb,B_tb,Arith_OUT_tb);
    
  else
    $display("%0d * %0d =%0d INCORRECT XXXXX",A_tb,B_tb,Arith_OUT_tb);       
    
       
/*-------------------------------------------------------------------------------------------------------------- */ 
  
   //test 10 Signed Arithmetic Multiplication: A is Positive & B is Negative 
 


  A_tb=5; 
  B_tb=-3;
  #10
  
  if(Arith_OUT_tb==-15 )
    $display("%0d * %0d =%0d correct",A_tb,B_tb,Arith_OUT_tb);
    
  else
    $display("%0d * %0d =%0d INCORRECT XXXXX",A_tb,B_tb,Arith_OUT_tb); 
    
    
/*-------------------------------------------------------------------------------------------------------------- */ 
  
   //test 11 Signed Arithmetic Multiplication: A is Negative & B is Positive 
 
 

  A_tb=-5; 
  B_tb=3;
  #10
  
  if(Arith_OUT_tb==-15 )
    $display("%0d * %0d =%0d correct",A_tb,B_tb,Arith_OUT_tb);
    
  else
    $display("%0d * %0d =%0d INCORRECT XXXXX",A_tb,B_tb,Arith_OUT_tb);    
      
/*-------------------------------------------------------------------------------------------------------------- */ 
  
   //test 12 Signed Arithmetic Multiplication: A is Positive & B is Positive 
 
 
 

  A_tb=5; 
  B_tb=3;
  #10
  
  if(Arith_OUT_tb==15 )
    $display("%0d * %0d =%0d correct",A_tb,B_tb,Arith_OUT_tb);
    
  else
    $display("%0d * %0d =%0d INCORRECT XXXXX",A_tb,B_tb,Arith_OUT_tb);
    
/*-------------------------------------------------------------------------------------------------------------- */ 
  
   //test 13 Signed Arithmetic Division: A is Negative & B is Negative 
 
 

  A_tb=-9; 
  B_tb=-3;
  ALU_FUN_tb=4'b0011;
  #10
  
  if(Arith_OUT_tb==3 )
    $display("%0d / %0d =%0d correct",A_tb,B_tb,Arith_OUT_tb);
    
  else
    $display("%0d / %0d =%0d INCORRECT XXXXX",A_tb,B_tb,Arith_OUT_tb);
    
    
/*-------------------------------------------------------------------------------------------------------------- */ 
  
   //test 14 Signed Arithmetic Division: A is Positive & B is Negative 
 
 

  A_tb=9; 
  B_tb=-3;
  
  #10
  
  if(Arith_OUT_tb==-3 )
    $display("%0d / %0d =%0d correct",A_tb,B_tb,Arith_OUT_tb);
    
  else
    $display("%0d / %0d =%0d INCORRECT XXXXX",A_tb,B_tb,Arith_OUT_tb);    


/*-------------------------------------------------------------------------------------------------------------- */ 
  
   //test 15 Signed Arithmetic Division: A is Negative & B is Positive  
 

  A_tb=-9; 
  B_tb=3;
  
  #10
  
  if(Arith_OUT_tb==-3 )
    $display("%0d / %0d =%0d correct",A_tb,B_tb,Arith_OUT_tb);
    
  else
    $display("%0d / %0d =%0d INCORRECT XXXXX",A_tb,B_tb,Arith_OUT_tb);

/*-------------------------------------------------------------------------------------------------------------- */ 
  
   //test 16 Signed Arithmetic Division: A is Positive & B is Positive 
  

  A_tb=9; 
  B_tb=3;
  
  #10
  
  if(Arith_OUT_tb==3 )
    $display("%0d / %0d =%0d correct",A_tb,B_tb,Arith_OUT_tb);
    
  else
    $display("%0d / %0d =%0d INCORRECT XXXXX",A_tb,B_tb,Arith_OUT_tb); 
    
    
/*--------------------------------------------------------------------------------------------------------------*/

  //test  17
  
    ALU_FUN_tb= 4'b0100;
    A_tb=37;
    B_tb=63;
    #10
    if(Logic_OUT_tb[0]&&Logic_OUT_tb[2]&&Logic_OUT_tb[5])
      $display("test CASE 17 is sucessfull");     
    else
      $display("test CASE 17 is failleed"); 

/*------------------------------------------------------------------------------------------------------------*/

  //test 18

    ALU_FUN_tb= 4'b0101;
    A_tb=37;
    B_tb=63;
    #10
    if(Logic_OUT_tb[0]&&Logic_OUT_tb[1]&&Logic_OUT_tb[2]&&Logic_OUT_tb[3]&&Logic_OUT_tb[4]&&Logic_OUT_tb[5])
      $display("test CASE 18 is sucessfull");     
    else
      $display("test CASE 18 is failleed");
      
      
/*------------------------------------------------------------------------------------------------------------*/

  //test 19
  
    ALU_FUN_tb= 4'b0110;
    A_tb=37;
    B_tb=63;
    #10
    if(!Logic_OUT_tb[0]&&Logic_OUT_tb[1]&&!Logic_OUT_tb[2]&&Logic_OUT_tb[3]&&Logic_OUT_tb [4]&&!Logic_OUT_tb[5])
      $display("test CASE 19 is sucessfull");     
    else
      $display("test CASE 19 is failleed");
      
/*------------------------------------------------------------------------------------------------------------*/

  //test 20
  
    ALU_FUN_tb= 4'b0111;
    A_tb=37;
    B_tb=63;
    #10
    if(!Logic_OUT_tb[0]&&!Logic_OUT_tb[1]&&!Logic_OUT_tb[2]&&!Logic_OUT_tb[3]&&!Logic_OUT_tb[4]&&!Logic_OUT_tb[5]&&Logic_OUT_tb[6])
      $display("test CASE 20 is sucessfull");     
    else
      $display("test CASE 20 is failleed");
      
/*------------------------------------------------------------------------------------------------------------*/

  //test 21 A==B
  
  ALU_FUN_tb=4'b1001;
  A_tb=18;
  B_tb=18;
  #10
  if(CMP_OUT_tb==1)
    $display("%0d == %0d (OUT)=%0d correct",A_tb,B_tb,CMP_OUT_tb);
  else
    $display("%0d == %0d (OUT)=%0d INCORRECT XXXXXX",A_tb,B_tb,CMP_OUT_tb);
    
/*------------------------------------------------------------------------------------------------------------*/

  //test 22 A>B
  
  ALU_FUN_tb=4'b1010;
  A_tb=19;
  B_tb=18;
  #10
  if(CMP_OUT_tb==2)
    $display("%0d > %0d (OUT)=%0d correct",A_tb,B_tb,CMP_OUT_tb);
  else
    $display("%0d > %0d (OUT)=%0d INCORRECT XXXXXX",A_tb,B_tb,CMP_OUT_tb);
    
/*------------------------------------------------------------------------------------------------------------*/

  //test 23 A<B
  
  ALU_FUN_tb=4'b1011;
  A_tb=18;
  B_tb=19;
  #10
  if(CMP_OUT_tb==3)
    $display("%0d < %0d (OUT)=%0d correct",A_tb,B_tb,CMP_OUT_tb);
  else
    $display("%0d < %0d (OUT)=%0d INCORRECT XXXXXX",A_tb,B_tb,CMP_OUT_tb);   
  


/*------------------------------------------------------------------------------------------------------------*/

  //test 24 NOP
  
  ALU_FUN_tb=4'b1000;
  A_tb=18;
  B_tb=19;
  #10
  if(CMP_OUT_tb==0)
    $display("test 24 correct");
  else
    $display("test 24 incorrect"); 
    
    
/*------------------------------------------------------------------------------------------------------------*/

  //test 25 A shift right
  
  ALU_FUN_tb=4'b1100;
  A_tb=18;
  #10
  if(SHIFT_OUT_tb==9)
    $display("test 25 correct");
  else
    $display("test 25 incorrect");
    
/*------------------------------------------------------------------------------------------------------------*/

  //test 26 A shift left
  
  ALU_FUN_tb=4'b1101;
  A_tb=18;
  #10
  if(SHIFT_OUT_tb==36)
    $display("test 26 correct");
  else
    $display("test 26 incorrect");
    
    
/*------------------------------------------------------------------------------------------------------------*/

  //test 27 B shift right
  
  ALU_FUN_tb=4'b1110;
  B_tb=18;
  #10
  if(SHIFT_OUT_tb==9)
    $display("test 27 correct");
  else
    $display("test 27 incorrect"); 
    
    /*------------------------------------------------------------------------------------------------------------*/

  //test 28 B shift left
  
  ALU_FUN_tb=4'b1111;
  B_tb=18;
  #10
  if(SHIFT_OUT_tb==36)
    $display("test 28 correct");
  else
    $display("test 28 incorrect");           
#70
$stop;
  
end



always 
begin
  #4 
  CLK_tb=1'b1;
  #6
  CLK_tb=1'b0;
end

ALU_TOP 
#(
.IN_DATA_WIDTH (IN_DATA_WIDTH_tb),
.OUT_DATA_WIDTH_Arith (OUT_DATA_WIDTH_Arith_tb),
.OUT_DATA_WIDTH_Logic (OUT_DATA_WIDTH_Logic_tb),
.OUT_DATA_WIDTH_CMP (OUT_DATA_WIDTH_CMP_tb),
.OUT_DATA_WIDTH_SHIFT (OUT_DATA_WIDTH_SHIFT_tb)
)DUT
(
.A (A_tb),
.B (B_tb),
.ALU_FUN (ALU_FUN_tb),
.CLK (CLK_tb),
.RST (RST_tb),
.Arith_OUT (Arith_OUT_tb),
.Logic_OUT (Logic_OUT_tb),
.CMP_OUT (CMP_OUT_tb),
.SHIFT_OUT (SHIFT_OUT_tb),
.Arith_Flag (Arith_Flag_tb),
.Logic_Flag (Logic_Flag_tb),
.CMP_Flag (CMP_Flag_tb),
.SHIFT_Flag (Shift_Flag_tb)
);
endmodule