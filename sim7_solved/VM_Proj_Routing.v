`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:23:12 09/26/2014 
// Design Name: 
// Module Name:    VM_Proj_Routing 
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
module VM_Proj_Routing(
    input clk,
	 input [53:0] projection,
	 output [8:0] read_projection,
	 
	 output wr_en_1,
	 output wr_en_2,
	 output wr_en_3,
	 output [8:0] wr_add_1,
	 output [8:0] wr_add_2,
	 output [8:0] wr_add_3,
	 
	 output reg [12:0] vm_projection
	 
    );

	parameter NUM_PROJ = 0;
	parameter zbit = 29;
	
	assign read_projection = 9'b0;
	assign wr_add_1 = 9'b0;
	assign wr_add_2 = 9'b0;
	assign wr_add_3 = 9'b0;

	always @(posedge clk) begin
		vm_projection <= {read_projection[5:0],projection[40:38],projection[zbit-2'd3:zbit-3'd6]};
	end

	assign wr_en_1 = (projection[43:41] == 3'b001 |projection[43:41] == 3'b010);
	assign wr_en_2 = (projection[43:41] == 3'b011 |projection[43:41] == 3'b100);
	assign wr_en_3 = (projection[43:41] == 3'b101 |projection[43:41] == 3'b110);

endmodule
