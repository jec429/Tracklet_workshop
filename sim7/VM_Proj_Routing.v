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

   /*
    Hint:
    The Virtual Module Projections are a reduced version of the projection data that we
    will use for a rough matching to Virtual Module Stubs. These VM projections contain
    a few bits of phi position, z position, and their derivatives (as shown in the table
    in the README file). We also use the phi and z information to route them into the 
    appropriate memories. From the projection, the top three bits from phi and the third 
    bit from z (top two give the region information) are used to route in VM memories and
    we store the next three (four) bits for phi (z) into the VM projection. The index
    corresponds to the bottom six bit of the address in the Projections memory.
        
    */
   
	

endmodule
