`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Student:Kirollos Rafat 
// 
// Create Date: 08/27/2024 08:44:03 PM
// Design Name: 
// Module Name: sequence_detector_1010_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: A testbench to verify the functionality of the design 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module sequence_detector_1010_tb();

//Declarations:
reg clk,resetn,data;
wire detected;

//Clock Generation:
always
begin
#5 clk = ~clk; 
end

//Instansiate a Design Under Test:
sequence_detector_1010 DUT(
.clk(clk),
.resetn(resetn),
.data(data),
.sequence_detected(detected)
);


//Invoke Stimuli:
initial
begin
clk = 1'b0;
resetn = 1'b0;

@(negedge clk)
resetn = 1'b1;
data = 1'b1;
#10
data = 1'b0;
#10
data = 1'b1;
#10
data = 1'b0;
#10
if(detected != 1'b0)
    $display("Testbench is a Success!");
else
    $display("Testbench is a Failure!");
     
#10 $finish;

end


endmodule
