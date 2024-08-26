`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Student: Kirollos Rafat
// 
// Create Date: 08/26/2024 12:32:11 PM
// Design Name: 
// Module Name: Up_Dn_Counter_tb
// Project Name: Up and Down Counter
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Up_Dn_Counter_tb  () ;
  

  reg [4:0] IN;
  reg LOAD, Up, Down,clk;
  wire [4:0] Counter;  
  wire High, Low ;
  parameter T = 10;
  
  // Clock Generator  
always
    begin
    clk = 1'b0;
    #(T/2); 
    clk = 1'b1 ;
    #(T/2);  
    end  
    
    
    // instaniate design instance 
      Up_Dn_Counter DUT (
        .IN(IN),
        .LOAD(LOAD), 
        .Up(Up), 
        .Down(Down),
        .clk(clk),
        .Counter(Counter),
        .High(High),
        .Low(Low)
      );

    
    
    
    
//initial block
initial 
  begin
    //initial values
    IN = 5'b01010 ;  // 10 decimal 
    LOAD = 1'b0 ;
    Up = 1'b0 ;
    Down = 1'b0 ;
    
     // test Load Function
    #3
    LOAD = 1'b1 ;
    Up = 1'b0 ;
    Down = 1'b0 ; 
    #7
    


   // test Load has highest priority
    #3
    LOAD = 1'b1 ;
    Up = 1'b1 ;
    Down = 1'b1 ; 
    #7
 

   // Test Down Function
    #3
    LOAD = 1'b0 ;
    Up = 1'b0 ;
    Down = 1'b1 ; 
    #27

    
  // test Down has higher priority than Up
    #3
    LOAD = 1'b0 ;
    Up = 1'b1 ;
    Down = 1'b1 ; 
    #37
       

    // test if all control signals are down
    #3
    LOAD = 1'b0 ;
    Up = 1'b0 ;
    Down = 1'b0 ; 
    #37


    // test Low signal
    #3
    LOAD = 1'b0 ;
    Up = 1'b0 ;
    Down = 1'b1 ; 
    #27


    // test Up Function
    #3
    LOAD = 1'b0 ;
    Up = 1'b1 ;
    Down = 1'b0 ; 
    #97
    
   
    
    #100
    $finish ;
    
  end
  
               // Monitor the outputs
initial begin
    $dumpfile("Up_Dn_Counter_tb.vcd");
    $dumpvars(0,Up_Dn_Counter_tb);
   $monitor("At time %0t: IN = %b, LOAD = %b, Down = %b, Up = %b, High = %b, Low = %b, Counter = %d",
             $time,IN,LOAD,Down,Up,High,Low,Counter);
end
  

  
  endmodule
  
