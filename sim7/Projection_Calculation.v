`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:18:34 09/26/2014 
// Design Name: 
// Module Name:    Projection_Calculation 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Projection_Calculation(
    input clk,
	 input [53:0] tracklet,
	 output [8:0] read_tracklet,
	 output reg [8:0] write_projection,
	 output wr_en,
	 output reg [53:0] projection_calc
    );

	parameter NUM_TKL = 0;
	parameter rproj = 16'h86a;
	parameter layer = 1'b1;
	parameter PHI_BITS = 14;
	parameter Z_BITS = 12;
	parameter PHID_BITS = 9;
	parameter ZD_BITS = 9;
	
	assign read_tracklet 	= 9'b0;
	initial
		write_projection = 0;

   /*
    In combination with the algorithm presented in the whitepaper, this
    is the code you will try to implement from a C++ version into verilog

    Projections:
    int it1=0.5*irproj*irinv;
    int it2=(it1>>9)*(it1>>9);
    int it3=(1<<20)+((it2*488)>>25);  
    int it4=(it1>>8)*(it3>>10);
    iphiproj=iphi0-(it4>>10); 
    int it5=it*irproj;
    int it6=(it5>>9)*(it3>>9);
    izproj=iz0+(is6>>16); 
    iphider=-0.5*irinv;
    izder=it;
    
    */

   
	always @(posedge clk) begin
		projection_calc 	<= tracklet - 1'b1;
		write_projection 	<= 9'b0;
	end

	
		
		

endmodule
