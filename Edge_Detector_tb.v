`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/03/2024 06:12:56 PM
// Design Name: 
// Module Name: Edge_Detector_tb
// Project Name: 
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


module Edge_Detector_tb();

// inputs and outputs declarations:
reg clk,resetn,clock_signal;
wire rise_edge,fall_edge;

// Clock generation:
always
    begin
    #5 clk = ~clk;
    end

//Design Under Test:
Edge_Detector DUT(
.resetn(resetn),
.clk(clk),
.clock_signal(clock_signal),
.pose_edge(rise_edge),
.neg_edge(fall_edge)
);


//Stimulli:
initial 
begin
clk = 1'b0;
resetn = 1'b0;
clock_signal = 1'b0;
@(negedge clk) resetn=1'b1;
#10 clock_signal = 1'b0;
#10 clock_signal = 1'b1;
#10 clock_signal = 1'b0;

end


//Mointor the outputs
initial 
begin
$dumpfile("Edge_Detector_tb.vcd");
$dumpvars(0,Edge_Detector_tb);
$monitor("At time %0t: input_clock = %b, rise_edge = %b and fall_edge = %b",$time,clock_signal,rise_edge,fall_edge);

end

endmodule
