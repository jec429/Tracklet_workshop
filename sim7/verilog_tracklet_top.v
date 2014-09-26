`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:58:45 09/26/2014 
// Design Name: 
// Module Name:    verilog_tracklet_top 
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
module verilog_tracklet_top(
    input reset,
    input clk,
    input en_proc
    );

	wire [53:0] tracklet;
	wire [8:0] read_tracklet;
	
	wire [53:0] projection_calc;
	wire [8:0] write_projection;
	wire [53:0] projection;
	wire [8:0] read_projection;
	
	wire vm_wr_en_1;
	wire vm_wr_en_2;
	wire vm_wr_en_3;
	wire [8:0] vm_wr_add_1;
	wire [8:0] vm_wr_add_2;
	wire [8:0] vm_wr_add_3;
	wire [12:0] vm_projection;

	Memory #(54,9,"tracklets.txt") tracklets(
		.CLK(clk),
		.READ_ADD(read_tracklet),
		.OUT(tracklet)
	);

	Projection_Calculation #(2) Calculation
	(
		.clk(clk),
		.read_tracklet(read_tracklet),
		.tracklet(tracklet),
		.write_projection(write_projection),
		.wr_en(wr_en),
		.projection_calc(projection_calc)
	);

	// If you skipped step 1, include the memory file ("projections.txt") in the parameters
	//Memory #(54,9) projections(
	Memory #(54,9,"projections.txt") projections(
		.CLK(clk),
		//.WR_EN(wr_en),									// If you are doing step 1
		.WR_EN(1'b0),										// If you are not doing step 1
		.WR_ADD(write_projection),
		.IN(projection_calc),
		.READ_ADD(read_projection),
		.OUT(projection)
	);
	
	VM_Proj_Routing #(2) Routing
	(
		.clk(clk),
		.read_projection(read_projection),
		.projection(projection),
		
		.wr_en_1(vm_wr_en_1),
		.wr_en_2(vm_wr_en_2),
		.wr_en_3(vm_wr_en_3),
		.wr_add_1(vm_wr_add_1),
		.wr_add_2(vm_wr_add_2),
		.wr_add_3(vm_wr_add_3),
		
		.vm_projection(vm_projection)		
	);
	
	Memory #(13,9) vm_projections_1(
		.CLK(clk),
		.WR_EN(vm_wr_en_1),
		.WR_ADD(vm_wr_add_1),
		.IN(vm_projection)
	);
	Memory #(13,9) vm_projections_2(
		.CLK(clk),
		.WR_EN(vm_wr_en_2),
		.WR_ADD(vm_wr_add_2),
		.IN(vm_projection)
	);
	Memory #(13,9) vm_projections_3(
		.CLK(clk),
		.WR_EN(vm_wr_en_3),
		.WR_ADD(vm_wr_add_3),
		.IN(vm_projection)
	);
	
endmodule
